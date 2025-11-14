-- Migration: Add reply functionality to comments
-- This allows comments to have parent comments (threaded/nested comments)

-- Add parent_id column to comments table
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'comments' 
        AND column_name = 'parent_id'
    ) THEN
        -- Add the parent_id column
        ALTER TABLE comments 
        ADD COLUMN parent_id INTEGER REFERENCES comments(id) ON DELETE CASCADE;
        
        -- Add index for better performance when querying replies
        CREATE INDEX idx_comments_parent_id ON comments(parent_id);
        
        RAISE NOTICE 'Added parent_id column to comments table';
    ELSE
        RAISE NOTICE 'parent_id column already exists in comments table';
    END IF;
END $$;

-- Verify the changes
SELECT 
    column_name, 
    data_type, 
    column_default,
    is_nullable
FROM information_schema.columns 
WHERE table_name = 'comments' 
ORDER BY ordinal_position;

-- Example queries for working with replies:

-- Get all top-level comments (no parent)
-- SELECT * FROM comments WHERE parent_id IS NULL AND is_approved = true;

-- Get all replies to a specific comment
-- SELECT * FROM comments WHERE parent_id = 123 AND is_approved = true;

-- Get comment with reply count
-- SELECT c.*, COUNT(r.id) as reply_count 
-- FROM comments c 
-- LEFT JOIN comments r ON r.parent_id = c.id AND r.is_approved = true
-- WHERE c.parent_id IS NULL
-- GROUP BY c.id;

