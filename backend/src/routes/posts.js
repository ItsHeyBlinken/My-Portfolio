const express = require('express');
const router = express.Router();
const db = require('../config/database');
const { authenticateToken } = require('../middleware/auth');

// GET all posts with comment count
router.get('/', async (req, res) => {
  try {
    const query = `
      SELECT p.*, COUNT(c.id) as comment_count 
      FROM blog_posts p 
      LEFT JOIN comments c ON p.id = c.post_id AND c.is_approved = true 
      GROUP BY p.id 
      ORDER BY p.published_date DESC, p.created_at DESC
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching posts:', error);
    res.status(500).json({ error: 'Error fetching posts' });
  }
});

// GET post by ID
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const query = 'SELECT * FROM blog_posts WHERE id = $1';
    const result = await db.query(query, [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Post not found' });
    }
    
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error fetching post:', error);
    res.status(500).json({ error: 'Error fetching post' });
  }
});

// POST new post (admin only)
router.post('/', authenticateToken, async (req, res) => {
  try {
    const { title, content, tags, published_date } = req.body;
    const query = `
      INSERT INTO blog_posts (title, content, tags, published_date) 
      VALUES ($1, $2, $3, $4) 
      RETURNING *
    `;
    const values = [title, content, tags, published_date || new Date()];
    const result = await db.query(query, values);
    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error('Error creating post:', error);
    res.status(500).json({ error: 'Error creating post' });
  }
});

// PUT update post (admin only)
router.put('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { title, content, tags, published_date } = req.body;
    const query = `
      UPDATE blog_posts 
      SET title = $1, content = $2, tags = $3, published_date = $4, updated_at = NOW() 
      WHERE id = $5 
      RETURNING *
    `;
    const values = [title, content, tags, published_date, id];
    const result = await db.query(query, values);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Post not found' });
    }
    
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error updating post:', error);
    res.status(500).json({ error: 'Error updating post' });
  }
});

// DELETE post and all comments (admin only)
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    
    // Delete comments first
    await db.query('DELETE FROM comments WHERE post_id = $1', [id]);
    
    // Delete post
    const result = await db.query('DELETE FROM blog_posts WHERE id = $1 RETURNING *', [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Post not found' });
    }
    
    res.json({ message: 'Post and comments deleted successfully' });
  } catch (error) {
    console.error('Error deleting post:', error);
    res.status(500).json({ error: 'Error deleting post' });
  }
});

module.exports = router;
