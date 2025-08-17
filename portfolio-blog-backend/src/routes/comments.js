const express = require('express');
const router = express.Router();
const { pool } = require('../config/database');
const { authenticateToken } = require('../middleware/auth');

// GET comments for a specific post
router.get('/post/:postId', async (req, res) => {
  try {
    const { postId } = req.params;
    
    const query = `
      SELECT id, author_name, content, created_at
      FROM comments 
      WHERE post_id = $1 AND is_approved = true
      ORDER BY created_at ASC
    `;
    
    const result = await pool.query(query, [postId]);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching comments:', error);
    res.status(500).json({ error: 'Failed to fetch comments' });
  }
});

// POST new comment (public)
router.post('/', async (req, res) => {
  try {
    const { post_id, author_name, author_email, content } = req.body;
    
    if (!post_id || !author_name || !content) {
      return res.status(400).json({ 
        error: 'Post ID, author name, and content are required' 
      });
    }
    
    // Validate post exists
    const postCheck = await pool.query('SELECT id FROM blog_posts WHERE id = $1', [post_id]);
    if (postCheck.rows.length === 0) {
      return res.status(404).json({ error: 'Blog post not found' });
    }
    
    // Basic content validation
    if (content.length > 1000) {
      return res.status(400).json({ 
        error: 'Comment content must be less than 1000 characters' 
      });
    }
    
    const query = `
      INSERT INTO comments (post_id, author_name, author_email, content)
      VALUES ($1, $2, $3, $4)
      RETURNING id, author_name, content, created_at
    `;
    
    const values = [post_id, author_name, author_email || null, content];
    const result = await pool.query(query, values);
    
    res.status(201).json({
      message: 'Comment submitted successfully and awaiting approval',
      comment: result.rows[0]
    });
  } catch (error) {
    console.error('Error creating comment:', error);
    res.status(500).json({ error: 'Failed to create comment' });
  }
});

// GET all comments (admin only - for moderation)
router.get('/admin', authenticateToken, async (req, res) => {
  try {
    const query = `
      SELECT 
        c.id, c.author_name, c.author_email, c.content, c.created_at, c.is_approved,
        bp.title as post_title, bp.id as post_id
      FROM comments c
      JOIN blog_posts bp ON c.post_id = bp.id
      ORDER BY c.created_at DESC
    `;
    
    const result = await pool.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching admin comments:', error);
    res.status(500).json({ error: 'Failed to fetch comments' });
  }
});

// PUT approve/disapprove comment (admin only)
router.put('/:id/approve', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { is_approved } = req.body;
    
    const query = `
      UPDATE comments 
      SET is_approved = $1
      WHERE id = $2
      RETURNING *
    `;
    
    const result = await pool.query(query, [is_approved, id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Comment not found' });
    }
    
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error updating comment approval:', error);
    res.status(500).json({ error: 'Failed to update comment' });
  }
});

// DELETE comment (admin only)
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    
    const result = await pool.query('DELETE FROM comments WHERE id = $1 RETURNING *', [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Comment not found' });
    }
    
    res.json({ message: 'Comment deleted successfully' });
  } catch (error) {
    console.error('Error deleting comment:', error);
    res.status(500).json({ error: 'Failed to delete comment' });
  }
});

module.exports = router;
