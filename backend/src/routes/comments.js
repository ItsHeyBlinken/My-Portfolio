const express = require('express');
const router = express.Router();
const db = require('../config/database');
const { authenticateToken } = require('../middleware/auth');

// GET comments by post ID (public) - for frontend compatibility
router.get('/:postId', async (req, res) => {
  try {
    const { postId } = req.params;
    const query = `
      SELECT * FROM comments 
      WHERE post_id = $1 AND is_approved = true 
      ORDER BY created_at ASC
    `;
    const result = await db.query(query, [postId]);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching comments:', error);
    res.status(500).json({ error: 'Error fetching comments' });
  }
});

// GET comments by post ID (public) - original route
router.get('/post/:postId', async (req, res) => {
  try {
    const { postId } = req.params;
    const query = `
      SELECT * FROM comments 
      WHERE post_id = $1 AND is_approved = true 
      ORDER BY created_at ASC
    `;
    const result = await db.query(query, [postId]);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching comments:', error);
    res.status(500).json({ error: 'Error fetching comments' });
  }
});

// GET all comments (admin only)
router.get('/', authenticateToken, async (req, res) => {
  try {
    const query = `
      SELECT c.*, p.title as post_title 
      FROM comments c 
      JOIN blog_posts p ON c.post_id = p.id 
      ORDER BY c.created_at DESC
    `;
    const result = await db.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching all comments:', error);
    res.status(500).json({ error: 'Error fetching comments' });
  }
});

// POST new comment (public)
router.post('/', async (req, res) => {
  try {
    const { post_id, author_name, author_email, content } = req.body;
    const query = `
      INSERT INTO comments (post_id, author_name, author_email, content, is_approved) 
      VALUES ($1, $2, $3, $4, false) 
      RETURNING *
    `;
    const values = [post_id, author_name, author_email || null, content];
    const result = await db.query(query, values);
    
    res.status(201).json({
      ...result.rows[0],
      message: 'Comment submitted successfully and awaiting approval'
    });
  } catch (error) {
    console.error('Error creating comment:', error);
    res.status(500).json({ error: 'Error creating comment' });
  }
});

// PUT approve/disapprove comment (admin only)
router.put('/:id/approve', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { is_approved } = req.body;
    
    console.log(`Attempting to approve comment ${id} with is_approved: ${is_approved}`);
    console.log('Request body:', req.body);
    console.log('User authenticated:', req.user);
    
    const query = `
      UPDATE comments 
      SET is_approved = $1, updated_at = NOW() 
      WHERE id = $2 
      RETURNING *
    `;
    const values = [is_approved, id];
    
    console.log('Executing query:', query);
    console.log('Query values:', values);
    
    const result = await db.query(query, values);
    
    console.log('Query result:', result);
    
    if (result.rows.length === 0) {
      console.log('Comment not found');
      return res.status(404).json({ error: 'Comment not found' });
    }
    
    console.log('Comment updated successfully:', result.rows[0]);
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error updating comment approval:', error);
    console.error('Error stack:', error.stack);
    console.error('Error details:', {
      message: error.message,
      code: error.code,
      detail: error.detail,
      hint: error.hint
    });
    res.status(500).json({ error: 'Error updating comment', details: error.message });
  }
});

// PUT update comment (admin only)
router.put('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { content, is_approved } = req.body;
    
    console.log(`Attempting to update comment ${id}`);
    console.log('Request body:', req.body);
    
    const query = `
      UPDATE comments 
      SET content = $1, is_approved = $2, updated_at = NOW() 
      WHERE id = $3 
      RETURNING *
    `;
    const values = [content, is_approved, id];
    
    console.log('Executing query:', query);
    console.log('Query values:', values);
    
    const result = await db.query(query, values);
    
    if (result.rows.length === 0) {
      console.log('Comment not found');
      return res.status(404).json({ error: 'Comment not found' });
    }
    
    console.log('Comment updated successfully:', result.rows[0]);
    res.json(result.rows[0]);
  } catch (error) {
    console.error('Error updating comment:', error);
    console.error('Error stack:', error.stack);
    console.error('Error details:', {
      message: error.message,
      code: error.code,
      detail: error.detail,
      hint: error.hint
    });
    res.status(500).json({ error: 'Error updating comment', details: error.message });
  }
});

// DELETE comment (admin only)
router.delete('/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const result = await db.query('DELETE FROM comments WHERE id = $1 RETURNING *', [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Comment not found' });
    }
    
    res.json({ message: 'Comment deleted successfully' });
  } catch (error) {
    console.error('Error deleting comment:', error);
    res.status(500).json({ error: 'Error deleting comment' });
  }
});

module.exports = router;
