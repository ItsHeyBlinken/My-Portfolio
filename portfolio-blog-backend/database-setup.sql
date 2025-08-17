-- Portfolio Blog Database Setup
-- Run this script in your PostgreSQL database to create the necessary tables

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

I started diving into VPS management and server maintenance to get ready for hosting the app live. This is all new territory for me, but I''m making progress step by step, learning how to keep the server secure and stable.

I have only had to restore the server once, but it was a good reminder of how important it is to have a backup plan. I''m also learning how to monitor the server''s health and performance to ensure it''s running smoothly. So, I call that a win!

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
    'March has been a busy and productive month for my coding journey. This month, I dedicated countless hours to refining the Online Card Show project, addressing both frontend and backend improvements. My focus has been on ensuring that the platform is not only functional but also scalable, user-friendly, and efficient. From enhancing the seller dashboard to optimizing the payment system, every update has brought me one step closer to launching a fully operational platform.

One of the biggest challenges I tackled this month was fine-tuning the infrastructure for hosting and deployment. After thorough research and testing, I settled on a Hostinger VPS with Coolify, giving me more control over my server while keeping costs manageable. Additionally, I''ve been working on streamlining shipping integration by switching to the USPS Web Tools API, which will allow for seamless shipping calculations and label generation.

**Key Updates**

- Improved the seller dashboard with order management and storefront customization.
- Started building a basic admin panel for user and issue management.
- Worked on integrating Stripe for handling payments and subscriptions.
- Finalized hosting with a Hostinger VPS using Coolify for deployment.
- Decided to use the USPS Web Tools API for shipping instead of Shippo.
- Continued growing Online Card Show''s Instagram and refining marketing efforts.

**Next Steps**

April''s focus will be on completing the checkout system, refining storefront features, and testing everything before launch. This means finalizing the payment flow to ensure buyers can seamlessly purchase items while sellers receive payments without issues. I will also refine the storefront customization options, ensuring sellers can personalize their store pages to align with their brand.

Additionally, extensive testing will be conducted across various user scenarios, including mobile and desktop experiences, to identify and resolve any bugs or usability concerns. The goal is to create a smooth and professional user experience before officially launching the platform.

Thank you for following along on my journey! More Updates to come!',
    'Chris (BytesByBlinken)',
    '2025-03-28',
    ARRAY['seller-dashboard', 'hosting', 'stripe-integration', 'usps-api', 'online-card-show']
),
(
    'Progress Update: My Journey as a Self-Taught Developer',
    'As I continue on my journey as a self-taught developer, I''ve made some exciting progress on my project. Over the past few weeks, I''ve been working on setting up my app locally, transitioning away from Supabase and Vercel, and preparing for self-hosting PostgreSQL. It''s been a learning experience, but I''m getting closer to having a fully functional application.

One of the biggest steps I took recently was setting up PostgreSQL on my local machine and starting to structure my database. This involved learning how to create tables, adding relationships, and writing queries to retrieve and update data. I also worked on refining my API endpoints, making sure they align with how I want my app to function. This hands-on experience has given me a much better understanding of backend development, database management, and server configuration. While I still have a lot to learn, I feel more confident in my ability to tackle these technical challenges.

In addition to my development work, I''m continuing to document my journey through my YouTube channel. I recently uploaded a video about setting up my app and plan to dive into how AI tools can assist with web development in my next upload. Creating content has been a great way to reflect on my progress while also sharing insights that might help others who are learning to code.

Balancing development, content creation, and my daily responsibilities hasn''t been easy, but I''m staying consistent. Every step forward, no matter how small, is progress. I''m excited to keep building, learning, and sharing my experiences. Stay tuned for more updates!

Thank you for following along on my journey!',
    'Chris (BytesByBlinken)',
    '2025-02-15',
    ARRAY['postgresql', 'database-design', 'api-development', 'self-hosting', 'youtube-content']
),
(
    'Big Moments in My Coding Journey: January Update',
    'This month, I had the incredible opportunity to interview for a Developer I position at the company I currently work for. The role is primarily focused on Front-End Development, which aligns perfectly with the skills I''ve been building over the past 15 months. Surprisingly, I wasn''t nervous going into the interview. Instead, I felt prepared and excited to showcase what I''ve learned. I spent a lot of time reviewing potential interview questions and brushing up on technical topics, especially in C#, .NET, and front-end concepts. While I thought the interview went well overall, I got the impression they''re looking for someone with a bit more experience. Still, this was an invaluable learning experience for me—it showed me how far I''ve come, what I need to focus on, and how to navigate the job search process moving forward.

**Launching my YouTube Channel**

Another major highlight was launching my very own YouTube channel to chronicle my journey as a self-taught developer! I''ve been inspired by watching other coding vlogs, and I felt like sharing my own story could motivate others while keeping me accountable. I''ll admit, I was nervous to put my first vlog out there. But after editing the video and sharing it with close friends and family, their positive feedback gave me the confidence to post it. The channel is all about the struggles and triumphs of learning to code, and for now, I''m aiming to release a new video every two weeks.

**What''s Next in my Journey?**

Looking ahead, there are a few key areas I''m focusing on:

1. **Keeping up with Vlogging** - I want to continue sharing my journey on YouTube by sticking to my upload schedule and improving the quality of my videos.

2. **Learning and Growing as a Developer** - My focus remains on learning C# and ASP.NET, as these are the critical skills for the types of roles I''m pursuing.

3. **The Job Search Continues** - While I probably won''t walk away with the job this time, I see every interview as a step forward. I''m determined to keep improving, applying for new opportunities, and keep pushing towards my goal of landing a developer role.

**Final Thoughts**

This past month has shown me just how far I''ve come since I started learning to code. From stepping into my first developer interview to sharing my story publicly on YouTube, it''s been a month of growth and firsts. I''m excited to see what''s next and to keep building on the momentum I''ve gained so far. Whether it''s through vlogging, learning, or interviewing, I''m determined to keep moving forward in my journey as a self-taught developer.

Thank for listening!',
    'Chris (BytesByBlinken)',
    '2025-01-12',
    ARRAY['developer-interview', 'youtube-channel', 'c-sharp', 'asp-net', 'job-search', 'self-taught']
),
(
    'My First Blog Post: A New Adventure Begins',
    'This is my very first blog post, and I couldn''t be more excited to start this journey of sharing my experiences. My name is Chris, and after years of doing things that didn''t fully satisfy me, I''ve decided to make a major change in my career. I''m diving into the world of coding and web development, learning languages like HTML, CSS, JavaScript, and even C#. While it hasn''t always been easy, it''s been a thrilling adventure that has pushed me out of my comfort zone.

Learning to code later in life wasn''t something I expected to do, but sometimes life takes you down unexpected paths. After realizing that I wanted more flexibility and growth opportunities, I decided to invest in myself and make this change. The beauty of coding is that it''s a lifelong learning process. Every new project, every new concept, and every bug I fix reminds me that it''s never too late to learn something new and pursue a career that excites me.

What keeps me going on this new adventure is the thrill of progress. Every time I master a new concept or build something from scratch, I feel like I''m one step closer to my goal. But it''s not just about the end result—it''s about the journey. There''s a sense of satisfaction in knowing I''m learning and growing, even if it''s challenging at times. My family and my desire to provide a better future for them also play a huge role in motivating me to push through tough days. It''s all worth it in the end, and I''m looking forward to seeing where this journey will take me.

Thank for listening!',
    'Chris (BytesByBlinken)',
    '2024-12-15',
    ARRAY['first-post', 'career-change', 'coding-journey', 'html-css-javascript', 'c-sharp', 'self-taught']
);

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

-- Grant permissions (adjust as needed for your setup)
-- GRANT ALL PRIVILEGES ON TABLE blog_posts TO ocs-beta-db;
-- GRANT ALL PRIVILEGES ON TABLE comments TO ocs-beta-db;
-- GRANT USAGE, SELECT ON SEQUENCE blog_posts_id_seq TO ocs-beta-db;
-- GRANT USAGE, SELECT ON SEQUENCE comments_id_seq TO ocs-beta-db;

-- Verify tables were created
SELECT 'blog_posts' as table_name, count(*) as row_count FROM blog_posts
UNION ALL
SELECT 'comments' as table_name, count(*) as row_count FROM comments;
