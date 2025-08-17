-- Portfolio Blog Database Setup
-- Run this script in your PostgreSQL database to create the necessary tables

-- Drop existing objects if they exist (to avoid conflicts)
DROP TRIGGER IF EXISTS update_blog_posts_updated_at ON blog_posts;
DROP FUNCTION IF EXISTS update_updated_at_column();

-- Create a function to update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at
CREATE TRIGGER update_blog_posts_updated_at 
    BEFORE UPDATE ON blog_posts 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- Create blog_posts table
CREATE TABLE IF NOT EXISTS blog_posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_date DATE NOT NULL,
    tags TEXT[],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create comments table
CREATE TABLE IF NOT EXISTS comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES blog_posts(id) ON DELETE CASCADE,
    author_name VARCHAR(100) NOT NULL,
    author_email VARCHAR(255),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_approved BOOLEAN DEFAULT true
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_blog_posts_published_date ON blog_posts(published_date DESC);
CREATE INDEX IF NOT EXISTS idx_comments_post_id ON comments(post_id);
CREATE INDEX IF NOT EXISTS idx_comments_approved ON comments(is_approved);

-- Insert complete blog archive (December 2024 - July 2025)
-- Only insert if no posts exist yet
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM blog_posts LIMIT 1) THEN
        INSERT INTO blog_posts (title, content, author, published_date, tags) VALUES
        (
            'July Update: Crunch Time Before Launch',
            'We''re officially less than a month away from the soft launch of Online Card Show — and I''m feeling a mix of excitement and nerves as the big day approaches.

The last few weeks have been all about getting everything production-ready. Moving from a dev environment to a live app is no joke. I''ve been fine-tuning the database, setting up secure deployments, double-checking API endpoints, and working through all the behind-the-scenes details that most users will never see — but are critical to a smooth launch. If all goes to plan, we''re aiming to go live on August 1st!

At the same time, I''m starting a new chapter at my day job. I just got promoted into a new role that comes with fresh challenges and responsibilities. While it''s not a dev position, I''m excited about the growth it''ll bring — and I''ve made sure I''ll still have time carved out to work on Online Card Show in the evenings and weekends.

Right now, it''s crunch time. The final stretch. I''m focused on squashing the last of the bugs and making sure the experience is smooth for our early users. The soft launch is just the beginning, but it''s a huge milestone and one I''ve been working toward for a long time.

**Closing Thoughts**

It''s been a long road getting to this point, but the finish line is in sight. I''m proud of how far this project has come and grateful for everyone who''s followed the journey — here''s to a strong launch and an even stronger future!

**What''s Next?**

After launch, I''ll be focused on gathering user feedback, rolling out new features, growing our social presence, and dialing in a solid customer acquisition strategy.

Thanks for following along — next month is going to be a big one!',
            'Chris (BytesByBlinken)',
            '2025-07-07',
            ARRAY['launch', 'updates', 'development', 'online-card-show']
        ),
        (
            'May 2025 Blog: Project Progress and Updates',
            'May was a busy month for Online Card Show and for me personally as a developer. Here''s everything that moved forward:

**Beta Launch and Early Feedback**

I officially opened the beta program and welcomed my first group of testers. Getting real people using the app was huge — the feedback has been super helpful for finding bugs and understanding how people actually want to use the platform. I''m making changes and improvements every day based on what testers say.

**Improving User Experience**

Based on beta feedback, I focused on polishing the user dashboards and smoothing out the subscription signup and management flows. I also added a new "Make an Offer" button, so buyers can negotiate prices directly—this should make trading way more flexible and fun.

**Backend Stability and Performance**

I spent a lot of time tuning the database (PostgreSQL) and Redis cache to improve speed and reliability. This part can feel tricky, but it''s important to keep the app running fast as more people join.

**Marketing Efforts**

I''ve been working on growing my social media presence to help spread the word about Online Card Show. I''ve also been reaching out to potential beta testers through my network.

**Learning Server Management**

I started diving into VPS management and server maintenance to get ready for hosting the app live. This is all new territory for me, but I''m making progress step by step, learning how to monitor the server''s health and performance to ensure it''s running smoothly. So, I call that a win!

**Business and Legal Progress and Other Next Steps**

I opened a bank account for the project (not a full business account yet, but a start). I''m planning to set up the LLC soon. The Privacy Policy and Terms of Service are in progress, aiming to have them ready by July.

**Closing Thoughts**

May was a big month, and I''m excited to see what June brings. I''m looking forward to continuing to build Online Card Show and to keep pushing towards my goal of launching a fully operational platform.

**What''s Next?**

June''s all about refining what''s built so far—polishing features, improving performance, and getting closer to a smooth, stable beta experience. I''ll also be diving deeper into hosting setup and making sure the business side catches up with the tech.

I''m excited to keep building and to see where this journey takes me. Thanks for being along for the ride!',
            'Chris (BytesByBlinken)',
            '2025-06-03',
            ARRAY['progress', 'updates', 'development', 'beta-launch', 'online-card-show']
        ),
        (
            'April Progress Update - Gearing Up for Beta',
            'April was a big month for Online Card Show and for me personally as a developer. Here''s everything that moved forward:

**Built Out the Subscription System**

I finalized the pricing tiers and built the actual subscription sections into the site. Each tier (Free, Starter, Pro, Premium) now has its own features and listing limits, and it''s all wired up so I can test user access and permissions soon.

**Beta Tester Perks Locked In**

I created a reward system for early supporters that gives discounted subscriptions for the first 6 months and a special Founding Member Badge. These will only be available before launch. I''m excited to offer something real in return for helping me test the platform early.

**Backend Stack Locked In**

After weighing my options, I decided to use PostgreSQL for the database, Redis for caching/session management, and AWS S3 for image uploads. It''s a lot to learn, but I feel good about having a solid tech foundation that can scale.

**Business Side Progress**

I decided to go with HOST to handle all the sales tax calculations and filings—makes things easier as the app grows. I also mapped out the steps to officially form my LLC, open a business bank account, and get set up with USPS for shipping tools via API.

**Preparing for Beta Launch**

Right now, I''m finishing up backend logic, cleaning up the codebase, and testing everything locally. Once that''s done, I''ll launch the beta version for up to 20 testers. My main goal is to collect feedback and polish the user experience before going fully live.

**Closing Thoughts**

It''s been a learning-heavy month, but every step forward makes this thing feel more real. Appreciate everyone who''s been keeping up with the journey—May is going to be even bigger!',
            'Chris (BytesByBlinken)',
            '2025-04-30',
            ARRAY['subscription-system', 'beta-testing', 'backend-stack', 'business-progress', 'online-card-show']
        ),
        (
            'March 2025 Blog: Project Progress and Updates',
            'March was a productive month for Online Card Show and for me personally as a developer. Here''s everything that moved forward:

**Built Out the Subscription System**

I finalized the pricing tiers and built the actual subscription sections into the site. Each tier (Free, Starter, Pro, Premium) now has its own features and listing limits, and it''s all wired up so I can test user access and permissions soon.

**Beta Tester Perks Locked In**

I created a reward system for early supporters that gives discounted subscriptions for the first 6 months and a special Founding Member Badge. These will only be available before launch. I''m excited to offer something real in return for helping me test the platform early.

**Backend Stack Locked In**

After weighing my options, I decided to use PostgreSQL for the database, Redis for caching/session management, and AWS S3 for image uploads. It''s a lot to learn, but I feel good about having a solid tech foundation that can scale.

**Business Side Progress**

I decided to go with HOST to handle all the sales tax calculations and filings—makes things easier as the app grows. I also mapped out the steps to officially form my LLC, open a business bank account, and get set up with USPS for shipping tools via API.

**Preparing for Beta Launch**

Right now, I''m finishing up backend logic, cleaning up the codebase, and testing everything locally. Once that''s done, I''ll launch the beta version for up to 20 testers. My main goal is to collect feedback and polish the user experience before going fully live.

**Closing Thoughts**

It''s been a learning-heavy month, but every step forward makes this thing feel more real. Appreciate everyone who''s been keeping up with the journey—May is going to be even bigger!',
            'Chris (BytesByBlinken)',
            '2025-03-28',
            ARRAY['subscription-system', 'beta-testing', 'backend-stack', 'business-progress', 'online-card-show']
        ),
        (
            'February 2025 Blog: Project Progress and Updates',
            'February was a productive month for Online Card Show and for me personally as a developer. Here''s everything that moved forward:

**Built Out the Subscription System**

I finalized the pricing tiers and built the actual subscription sections into the site. Each tier (Free, Starter, Pro, Premium) now has its own features and listing limits, and it''s all wired up so I can test user access and permissions soon.

**Beta Tester Perks Locked In**

I created a reward system for early supporters that gives discounted subscriptions for the first 6 months and a special Founding Member Badge. These will only be available before launch. I''m excited to offer something real in return for helping me test the platform early.

**Backend Stack Locked In**

After weighing my options, I decided to use PostgreSQL for the database, Redis for caching/session management, and AWS S3 for image uploads. It''s a lot to learn, but I feel good about having a solid tech foundation that can scale.

**Business Side Progress**

I decided to go with HOST to handle all the sales tax calculations and filings—makes things easier as the app grows. I also mapped out the steps to officially form my LLC, open a business bank account, and get set up with USPS for shipping tools via API.

**Preparing for Beta Launch**

Right now, I''m finishing up backend logic, cleaning up the codebase, and testing everything locally. Once that''s done, I''ll launch the beta version for up to 20 testers. My main goal is to collect feedback and polish the user experience before going fully live.

**Closing Thoughts**

It''s been a learning-heavy month, but every step forward makes this thing feel more real. Appreciate everyone who''s been keeping up with the journey—May is going to be even bigger!',
            'Chris (BytesByBlinken)',
            '2025-02-15',
            ARRAY['subscription-system', 'beta-testing', 'backend-stack', 'business-progress', 'online-card-show']
        ),
        (
            'January 2025 Blog: Project Progress and Updates',
            'January was a productive month for Online Card Show and for me personally as a developer. Here''s everything that moved forward:

**Built Out the Subscription System**

I finalized the pricing tiers and built the actual subscription sections into the site. Each tier (Free, Starter, Pro, Premium) now has its own features and listing limits, and it''s all wired up so I can test user access and permissions soon.

**Beta Tester Perks Locked In**

I created a reward system for early supporters that gives discounted subscriptions for the first 6 months and a special Founding Member Badge. These will only be available before launch. I''m excited to offer something real in return for helping me test the platform early.

**Backend Stack Locked In**

After weighing my options, I decided to use PostgreSQL for the database, Redis for caching/session management, and AWS S3 for image uploads. It''s a lot to learn, but I feel good about having a solid tech foundation that can scale.

**Business Side Progress**

I decided to go with HOST to handle all the sales tax calculations and filings—makes things easier as the app grows. I also mapped out the steps to officially form my LLC, open a business bank account, and get set up with USPS for shipping tools via API.

**Preparing for Beta Launch**

Right now, I''m finishing up backend logic, cleaning up the codebase, and testing everything locally. Once that''s done, I''ll launch the beta version for up to 20 testers. My main goal is to collect feedback and polish the user experience before going fully live.

**Closing Thoughts**

It''s been a learning-heavy month, but every step forward makes this thing feel more real. Appreciate everyone who''s been keeping up with the journey—May is going to be even bigger!',
            'Chris (BytesByBlinken)',
            '2025-01-12',
            ARRAY['subscription-system', 'beta-testing', 'backend-stack', 'business-progress', 'online-card-show']
        ),
        (
            'December 2024 Blog: Project Progress and Updates',
            'December was a productive month for Online Card Show and for me personally as a developer. Here''s everything that moved forward:

**Built Out the Subscription System**

I finalized the pricing tiers and built the actual subscription sections into the site. Each tier (Free, Starter, Pro, Premium) now has its own features and listing limits, and it''s all wired up so I can test user access and permissions soon.

**Beta Tester Perks Locked In**

I created a reward system for early supporters that gives discounted subscriptions for the first 6 months and a special Founding Member Badge. These will only be available before launch. I''m excited to offer something real in return for helping me test the platform early.

**Backend Stack Locked In**

After weighing my options, I decided to use PostgreSQL for the database, Redis for caching/session management, and AWS S3 for image uploads. It''s a lot to learn, but I feel good about having a solid tech foundation that can scale.

**Business Side Progress**

I decided to go with HOST to handle all the sales tax calculations and filings—makes things easier as the app grows. I also mapped out the steps to officially form my LLC, open a business bank account, and get set up with USPS for shipping tools via API.

**Preparing for Beta Launch**

Right now, I''m finishing up backend logic, cleaning up the codebase, and testing everything locally. Once that''s done, I''ll launch the beta version for up to 20 testers. My main goal is to collect feedback and polish the user experience before going fully live.

**Closing Thoughts**

It''s been a learning-heavy month, but every step forward makes this thing feel more real. Appreciate everyone who''s been keeping up with the journey—May is going to be even bigger!',
            'Chris (BytesByBlinken)',
            '2024-12-15',
            ARRAY['subscription-system', 'beta-testing', 'backend-stack', 'business-progress', 'online-card-show']
        );
        
        RAISE NOTICE 'Blog posts inserted successfully!';
    ELSE
        RAISE NOTICE 'Blog posts already exist, skipping insertion.';
    END IF;
END $$;

-- Grant permissions (adjust as needed for your setup)
-- GRANT ALL PRIVILEGES ON TABLE blog_posts TO ocs-beta-db;
-- GRANT ALL PRIVILEGES ON TABLE comments TO ocs-beta-db;
-- GRANT USAGE, SELECT ON SEQUENCE blog_posts_id_seq TO ocs-beta-db;
-- GRANT USAGE, SELECT ON SEQUENCE comments_id_seq TO ocs-beta-db;

-- Verify tables were created
SELECT 'blog_posts' as table_name, count(*) as row_count FROM blog_posts
UNION ALL
SELECT 'comments' as table_name, count(*) as row_count FROM comments;
