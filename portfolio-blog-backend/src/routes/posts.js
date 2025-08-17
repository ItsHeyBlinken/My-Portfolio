const express = require('express');
const router = express.Router();
const { pool } = require('../config/database');
const { authenticateToken } = require('../middleware/auth');

// GET all blog posts
router.get('/', async (req, res) => {
  try {
    const query = `
      SELECT 
        id, title, content, author, published_date, tags, 
        created_at, updated_at,
        (SELECT COUNT(*) FROM comments WHERE post_id = blog_posts.id AND is_approved = true) as comment_count
      FROM blog_posts 
      ORDER BY published_date DESC
    `;
    
    const result = await pool.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching posts:', error);
    res.status(500).json({ error: 'Failed to fetch posts' });
  }
});

// GET single blog post by ID
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    // Get post details
    const postQuery = `
      SELECT id, title, content, author, published_date, tags, created_at, updated_at
      FROM blog_posts 
      WHERE id = $1
    `;
    
    const postResult = await pool.query(postQuery, [id]);
    
    if (postResult.rows.length === 0) {
      return res.status(404).json({ error: 'Post not found' });
    }
    
    // Get comments for this post
    const commentsQuery = `
      SELECT id, author_name, content, created_at
      FROM comments 
      WHERE post_id = $1 AND is_approved = true
      ORDER BY created_at ASC
    `;
    
    const commentsResult = await pool.query(commentsQuery, [id]);
    
    const post = postResult.rows[0];
    post.comments = commentsResult.rows;
    
    res.json(post);
  } catch (error) {
    console.error('Error fetching post:', error);
    res.status(500).json({ error: 'Failed to fetch post' });
  }
});

// POST new blog post (admin only)
router.post('/', authenticateToken, async (req, res) => {
  try {
    const { title, content, author, published_date, tags } = req.body;
    
    if (!title || !content || !author) {
      return res.status(400).json({ error: 'Title, content, and author are required' });
    }
    
    const query = `
      INSERT INTO blog_posts (title, content, author, published_date, tags)
      VALUES ($1, $2, $3, $4, $5)
      RETURNING *
    `;
    
    const values = [
      title, 
      content, 
      author, 
      published_date || new Date().toISOString().split('T')[0], 
      tags || []
    ];
    
    const result = await pool.query(query, values);
    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error('Error creating post:', error);
    res.status(500).json({ error: 'Failed to create post' });
  }
});

// PUT update blog post (admin only)
router.put('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { title, content, author, published_date, tags } = req.body;
    
    const query = `
      UPDATE blog_posts 
      SET title = $1, content = $2, author = $3, published_date = $4, tags = $5, updated_at = CURRENT_TIMESTAMP
      WHERE id = $6
      RETURNING *
    `;
    
    const values = [title, content, author, published_date, tags, id];
    const result = await pool.query(query, values);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Post not found' });
    }
    
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error updating post:', error);
    res.status(500).json({ error: 'Failed to update post' });
  }
});

// DELETE blog post (admin only)
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    
    // Delete comments first (due to foreign key constraint)
    await pool.query('DELETE FROM comments WHERE post_id = $1', [id]);
    
    // Delete the post
    const result = await pool.query('DELETE FROM blog_posts WHERE id = $1 RETURNING *', [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Post not found' });
    }
    
    res.json({ message: 'Post deleted successfully' });
  } catch (error) {
    console.error('Error deleting post:', error);
    res.status(500).json({ error: 'Failed to delete post' });
  }
});

module.exports = router;
