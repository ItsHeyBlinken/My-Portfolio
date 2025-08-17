-- Portfolio Blog Database Setup
-- Run this script in your PostgreSQL database

-- Create blog_posts table
CREATE TABLE IF NOT EXISTS blog_posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    tags TEXT[],
    published_date DATE NOT NULL,
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
    is_approved BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_blog_posts_published_date ON blog_posts(published_date);
CREATE INDEX IF NOT EXISTS idx_blog_posts_created_at ON blog_posts(created_at);
CREATE INDEX IF NOT EXISTS idx_comments_post_id ON comments(post_id);
CREATE INDEX IF NOT EXISTS idx_comments_is_approved ON comments(is_approved);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_blog_posts_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger for blog_posts
DROP TRIGGER IF EXISTS update_blog_posts_updated_at ON blog_posts;
CREATE TRIGGER update_blog_posts_updated_at
    BEFORE UPDATE ON blog_posts
    FOR EACH ROW
    EXECUTE FUNCTION update_blog_posts_updated_at();

-- Create function to update comments updated_at timestamp
CREATE OR REPLACE FUNCTION update_comments_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger for comments
DROP TRIGGER IF EXISTS update_comments_updated_at ON comments;
CREATE TRIGGER update_comments_updated_at
    BEFORE UPDATE ON comments
    FOR EACH ROW
    EXECUTE FUNCTION update_comments_updated_at();

-- Insert initial blog posts (only if table is empty)
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM blog_posts LIMIT 1) THEN
        INSERT INTO blog_posts (title, content, tags, published_date) VALUES
        (
            'December 2024 Blog: Project Progress and Updates',
            'As we approach the end of 2024, I wanted to take a moment to reflect on the incredible progress we''ve made with the Online Card Show project. This has been a year of significant milestones, technical challenges overcome, and valuable lessons learned.

The journey began with a simple concept: creating a platform that would revolutionize how trading card enthusiasts connect, trade, and showcase their collections. What started as a basic idea has evolved into a comprehensive system that addresses real needs in the trading card community.

Key Achievements This Year:
- Completed the core platform architecture
- Implemented secure user authentication and authorization
- Developed the trading system with real-time notifications
- Created an intuitive user interface for both desktop and mobile
- Established partnerships with key stakeholders in the trading card industry

Technical Challenges Overcome:
One of the most significant challenges we faced was implementing a robust real-time trading system that could handle thousands of concurrent users while maintaining data integrity and security. We solved this through a combination of WebSocket technology, database optimization, and careful architectural planning.

The mobile responsiveness was another area where we pushed boundaries. Ensuring that the platform works seamlessly across all devices and screen sizes required extensive testing and iterative improvements.

Looking Ahead to 2025:
As we move into the new year, our focus will be on:
- Beta testing with a select group of users
- Performance optimization based on real-world usage data
- Additional feature development based on user feedback
- Scaling infrastructure to handle increased user load

I''m incredibly grateful for the team that has made this project possible and for the support from the trading card community. The feedback and suggestions we''ve received have been invaluable in shaping the platform into what it is today.

Stay tuned for more updates as we continue this exciting journey!',
            ARRAY['Online Card Show', 'Trading Platform', 'Web Development', '2024 Review'],
            '2024-12-15'
        ),
        (
            'January 2025 Blog: Project Progress and Updates',
            'Happy New Year! 2025 is here, and we''re hitting the ground running with the Online Card Show project. The holiday break gave us valuable time to reflect on our progress and plan the next phase of development.

January has been a month of focused development and strategic planning. We''ve made significant strides in several key areas that will be crucial for our upcoming beta launch.

Recent Developments:
1. Enhanced Security Features
We''ve implemented additional security measures including two-factor authentication, enhanced encryption for sensitive data, and improved session management. Security is paramount when dealing with trading card transactions, and we''re committed to maintaining the highest standards.

2. Performance Optimization
Our development team has been working tirelessly to optimize the platform''s performance. We''ve reduced page load times by 40% and improved the overall user experience through better caching strategies and database query optimization.

3. User Interface Refinements
Based on feedback from our internal testing team, we''ve made several UI/UX improvements that make the platform more intuitive and user-friendly. These changes include simplified navigation, improved mobile layouts, and enhanced visual feedback for user actions.

4. Beta Testing Preparation
We''re in the final stages of preparing for our beta launch. This includes setting up comprehensive monitoring systems, creating user onboarding materials, and establishing support channels for beta testers.

Technical Deep Dive - Real-time Trading System:
One of the most exciting aspects of our platform is the real-time trading system. We''ve implemented a sophisticated WebSocket-based architecture that allows users to:
- Receive instant notifications when cards they''re interested in become available
- Participate in live auctions with real-time bidding
- Chat with other users during trading sessions
- Track market prices and trends in real-time

The system is designed to handle thousands of concurrent users while maintaining sub-second response times. This required careful consideration of database design, caching strategies, and load balancing.

Community Engagement:
We''ve been actively engaging with the trading card community through social media, forums, and industry events. The response has been overwhelmingly positive, and we''ve received valuable feedback that has helped shape our development priorities.

What''s Next:
February will be focused on:
- Final beta testing preparations
- Documentation completion
- Marketing material development
- Partnership announcements

I''m excited to share that we''ve secured several key partnerships that will be announced in the coming weeks. These partnerships will significantly enhance the value proposition for our users.

As always, thank you for your continued interest and support. The trading card community''s enthusiasm for this project continues to motivate our team every day.',
            ARRAY['Online Card Show', 'Beta Launch', 'Security', 'Performance', 'Real-time Trading'],
            '2025-01-12'
        ),
        (
            'February 2025 Blog: Project Progress and Updates',
            'February has been another productive month for the Online Card Show project. We''re now in the final stretch before our beta launch, and the excitement within our team is palpable. Let me share what we''ve accomplished and what''s coming next.

Major Milestones Achieved:
1. Beta Testing Infrastructure Complete
We''ve successfully set up our comprehensive beta testing environment, including automated testing suites, performance monitoring, and user feedback collection systems. This infrastructure will be crucial for gathering real-world data and user insights.

2. Security Audit Completed
We recently completed a comprehensive security audit conducted by an independent cybersecurity firm. The results were excellent, with our platform receiving high marks for security implementation. This gives us confidence that we''re providing a safe environment for our users.

3. Mobile App Development
While our web platform has been our primary focus, we''ve also been developing native mobile applications for iOS and Android. These apps will provide users with the same functionality as the web platform, optimized for mobile use.

4. Partnership Announcements
I''m thrilled to announce that we''ve secured partnerships with several major trading card manufacturers and distributors. These partnerships will provide our users with access to exclusive cards and special promotions.

Technical Innovations:
Our development team has implemented several cutting-edge features:
- Advanced search algorithms that can identify cards based on images
- Machine learning-powered price prediction models
- Blockchain integration for secure card authenticity verification
- Advanced analytics dashboard for users to track their collection value

User Experience Improvements:
We''ve made several UX enhancements based on feedback from our internal testing:
- Simplified onboarding process for new users
- Enhanced search and filtering capabilities
- Improved notification system
- Better mobile responsiveness

Community Building:
We''ve been actively building our community through:
- Social media engagement campaigns
- Participation in trading card conventions
- Collaboration with popular trading card YouTubers and influencers
- Regular community events and challenges

Beta Launch Timeline:
We''re on track for our beta launch in March. The beta will include:
- Limited user registration (first 1,000 users)
- Full platform functionality
- Comprehensive feedback collection
- Regular updates based on user input

What to Expect in March:
- Beta launch announcement
- User registration opening
- First community trading events
- Regular feature updates based on feedback

I want to take a moment to thank our development team for their incredible dedication. The long hours and attention to detail have resulted in a platform that exceeds our initial expectations.

To our future users: We can''t wait to share this platform with you. Your feedback and engagement will be crucial in making the Online Card Show the premier destination for trading card enthusiasts.',
            ARRAY['Beta Launch', 'Security Audit', 'Mobile Apps', 'Partnerships', 'Community Building'],
            '2025-02-15'
        ),
        (
            'March 2025 Blog: Project Progress and Updates',
            'March has been an incredibly exciting month for the Online Card Show project! We''ve reached a major milestone that we''ve been working toward for over a year - our beta launch is officially live! Let me share the incredible journey and what this means for our community.

Beta Launch Success:
On March 15th, we opened our beta platform to the first 1,000 registered users. The response was overwhelming - we reached our user limit within the first 48 hours! This incredible enthusiasm from the trading card community validates our vision and motivates us to continue improving.

User Registration and Onboarding:
Our beta users represent a diverse cross-section of the trading card community:
- Collectors with decades of experience
- New enthusiasts just starting their collections
- Professional traders and dealers
- Casual collectors looking to expand their networks

The onboarding process has been smooth, with users completing their profile setup in an average of 8 minutes. Our tutorial system and guided tours have received excellent feedback.

Platform Performance:
The beta launch has provided valuable real-world performance data:
- Average page load time: 1.2 seconds
- 99.9% uptime during peak usage
- Successfully handled 500+ concurrent users
- Real-time trading system responding in under 200ms

User Feedback and Iterations:
We''ve been collecting feedback through multiple channels:
- In-app feedback forms
- User interviews
- Community forums
- Social media engagement

Based on this feedback, we''ve already implemented several improvements:
- Enhanced search functionality with better filters
- Improved mobile navigation
- Additional security features
- Better notification preferences

Community Events:
We''ve hosted several successful community events:
- Weekly trading challenges
- Card showcase competitions
- Educational webinars about card collecting
- Networking events for collectors

Technical Achievements:
Our development team has been working around the clock to address feedback and implement improvements:
- Deployed 15 hotfixes based on user feedback
- Implemented A/B testing for new features
- Enhanced monitoring and alerting systems
- Improved error handling and user messaging

Partnership Updates:
Our partnerships with major trading card companies are bearing fruit:
- Exclusive card releases for our beta users
- Special promotional events
- Educational content from industry experts
- Access to limited edition releases

What''s Next:
April will focus on:
- Expanding beta user base to 2,500 users
- Implementing advanced features based on feedback
- Preparing for full public launch
- Additional partnership announcements

Beta User Spotlight:
I want to highlight some of our amazing beta users who have been instrumental in helping us improve the platform:
- Sarah M., a collector of 20+ years who provided detailed feedback on our search functionality
- Mike R., a professional dealer who helped us optimize our trading interface
- Lisa T., a new collector who gave us insights into the beginner experience

The Road Ahead:
As we move forward, our focus remains on creating the best possible experience for our users. The beta launch has shown us that we''re on the right track, but there''s always room for improvement.

To our beta users: Thank you for your patience, feedback, and enthusiasm. You''re helping us build something truly special for the trading card community.

To those waiting to join: We''re working hard to expand our beta program and bring you on board as soon as possible.',
            ARRAY['Beta Launch', 'User Feedback', 'Community Events', 'Performance', 'Partnerships'],
            '2025-03-28'
        ),
        (
            'April Progress Update - Gearing Up for Beta',
            'April has been another month of significant progress and exciting developments for the Online Card Show project. As we continue to gather feedback from our beta users and prepare for our full public launch, I wanted to share the latest updates and what we''ve learned.

Beta Program Expansion:
We''ve successfully expanded our beta program from 1,000 to 2,500 users, and the response has been incredible. Our waitlist now contains over 5,000 eager collectors waiting to join the platform. This overwhelming interest confirms that we''re addressing a real need in the trading card community.

User Engagement Metrics:
Our beta users are highly engaged with the platform:
- Average daily active users: 1,800+
- Average session duration: 45 minutes
- 78% of users return within 24 hours
- 92% completion rate for profile setup

These metrics exceed our initial projections and demonstrate strong product-market fit.

Feature Development Based on Feedback:
User feedback has been invaluable in shaping our development priorities. Some of the most requested features we''ve implemented include:
- Advanced card condition assessment tools
- Bulk upload functionality for large collections
- Enhanced price tracking and alerts
- Improved mobile app performance
- Better integration with popular card databases

Community Building Success:
Our community events continue to grow in popularity:
- Weekly trading challenges now attract 300+ participants
- Monthly showcase competitions receive 500+ submissions
- Educational webinars average 200+ attendees
- Networking events have facilitated 150+ successful trades

Technical Improvements:
Our development team has been working tirelessly to improve platform performance and reliability:
- Reduced average page load time to 0.8 seconds
- Implemented advanced caching strategies
- Enhanced database optimization
- Improved error handling and user experience

Security Enhancements:
We''ve continued to strengthen our security measures:
- Implemented advanced fraud detection systems
- Enhanced user verification processes
- Added additional layers of encryption
- Regular security audits and penetration testing

Partnership Developments:
Our partnerships with major trading card companies continue to expand:
- Exclusive beta user access to limited edition releases
- Special promotional pricing on select products
- Collaborative marketing campaigns
- Educational content partnerships

User Success Stories:
It''s incredibly rewarding to see our users finding success on the platform:
- John D. completed his first trade within 24 hours of joining
- Maria S. connected with collectors in 12 different countries
- David L. discovered rare cards he''d been searching for years
- Sarah M. built a network of 50+ fellow collectors

What We''ve Learned:
The beta program has taught us several valuable lessons:
- Users value simplicity and intuitive design
- Community features are as important as trading functionality
- Mobile experience is crucial for user engagement
- Security and trust are top priorities for users

Looking Ahead to May:
Our focus for May will be:
- Finalizing preparations for public launch
- Implementing remaining high-priority features
- Expanding our support team
- Finalizing partnership agreements
- Preparing marketing campaigns

Public Launch Preparation:
We''re on track for our public launch in June. The launch will include:
- Open registration for all users
- Enhanced features based on beta feedback
- Comprehensive marketing campaign
- Additional partnership announcements

The Journey Continues:
As we approach our public launch, I''m reminded of how far we''ve come. What started as a simple idea has grown into a thriving community of passionate collectors.

To our beta users: Your feedback continues to shape our platform. Thank you for being part of this journey.

To our team: Your dedication and hard work are making this vision a reality.

To the trading card community: We''re building this platform for you, and we can''t wait to share it with everyone.',
            ARRAY['Beta Expansion', 'User Engagement', 'Feature Development', 'Community Building', 'Public Launch Prep'],
            '2025-04-30'
        ),
        (
            'May 2025 Blog: Project Progress and Updates',
            'May has been an incredibly productive month for the Online Card Show project. As we prepare for our public launch in June, we''ve made significant strides in several key areas. The excitement within our team and community is building, and I wanted to share the latest developments.

Public Launch Preparation:
We''re in the final stages of preparing for our public launch, scheduled for June 15th. This includes:
- Finalizing all platform features
- Completing comprehensive testing
- Preparing marketing materials
- Training our expanded support team
- Finalizing partnership agreements

The launch will mark a significant milestone in our journey and open the platform to the entire trading card community.

Platform Enhancements:
Based on extensive beta user feedback, we''ve implemented several major improvements:
- Advanced card authentication system
- Enhanced trading algorithms
- Improved mobile app performance
- Better integration with external card databases
- Advanced analytics and reporting tools

User Experience Improvements:
We''ve focused heavily on user experience based on beta feedback:
- Streamlined onboarding process (now takes 5 minutes)
- Enhanced search and filtering capabilities
- Improved notification system
- Better mobile responsiveness
- More intuitive trading interface

Community Growth:
Our community continues to expand and engage:
- Beta user base now at 3,000 active users
- Community events attracting 500+ participants
- User-generated content growing rapidly
- Strong social media presence with 15,000+ followers

Technical Achievements:
Our development team has achieved several technical milestones:
- Platform now handles 1,000+ concurrent users
- Average response time under 500ms
- 99.99% uptime during peak usage
- Successfully processed 10,000+ trades

Security and Trust:
We''ve implemented additional security measures:
- Advanced fraud detection systems
- Enhanced user verification
- Improved data protection
- Regular security audits

Partnership Updates:
Our partnerships continue to expand:
- New agreements with major card manufacturers
- Exclusive content partnerships
- Collaborative marketing initiatives
- Educational program partnerships

What''s Next:
June will be focused on:
- Public launch execution
- Marketing campaign rollout
- User support and onboarding
- Performance monitoring and optimization
- Community expansion

Launch Day Plans:
Our public launch will include:
- Open registration for all users
- Special launch day events and promotions
- Partnership announcements
- Community celebrations
- Educational content release

The Road Ahead:
As we approach our public launch, I''m incredibly proud of what our team has accomplished. We''ve built a platform that truly serves the trading card community and addresses real needs.

To our beta users: Thank you for your invaluable feedback and support. You''ve helped us create something special.

To our team: Your dedication and hard work are making this vision a reality.

To the trading card community: We''re building this platform for you, and we can''t wait to share it with everyone.

The journey continues, and the best is yet to come!',
            ARRAY['Public Launch Prep', 'Platform Enhancements', 'Community Growth', 'Technical Achievements', 'Launch Plans'],
            '2025-06-03'
        ),
        (
            'July Update: Crunch Time Before Launch',
            'We''re officially less than a month away from the soft launch of Online Card Show — and I''m feeling a mix of excitement and nerves as the big day approaches. This has been a year-long journey filled with countless hours of development, testing, and community building, and now we''re in the final stretch.

The last few weeks have been intense, to say the least. Our development team has been working around the clock to implement the final features and polish every aspect of the platform. We''ve been through multiple rounds of testing, bug fixes, and performance optimizations to ensure everything runs smoothly when we go live.

Key Final Preparations:
1. Platform Testing and Quality Assurance
We''ve completed comprehensive testing across all major browsers and devices. Our QA team has identified and resolved hundreds of edge cases, ensuring a smooth user experience for everyone. The platform now handles load testing with 2,000+ concurrent users without any performance degradation.

2. Security Finalization
Security has been our top priority from day one. We''ve completed our final security audit and implemented additional measures including advanced fraud detection, enhanced encryption, and comprehensive user verification systems. The platform is now ready to handle sensitive trading card transactions securely.

3. Support Team Training
We''ve expanded our support team to 15 members and completed extensive training on all platform features, common user questions, and troubleshooting procedures. Our support team is ready to provide excellent service to our users from day one.

4. Marketing and Launch Materials
All marketing materials are complete and ready for launch. This includes promotional videos, social media campaigns, partnership announcements, and educational content. We''ve also prepared comprehensive user guides and tutorials.

Community Building Success:
Our beta community has grown to 3,500 active users, and the engagement has been incredible. We''ve hosted successful events including:
- Monthly trading challenges with 800+ participants
- Educational webinars with industry experts
- Community showcase competitions
- Networking events for collectors

Technical Achievements:
The platform has achieved several technical milestones:
- Sub-second page load times
- 99.99% uptime during peak usage
- Real-time trading system responding in under 200ms
- Mobile app performance matching web platform
- Advanced analytics and reporting systems

Partnership Updates:
We''ve secured partnerships with major players in the trading card industry:
- Exclusive agreements with top card manufacturers
- Distribution partnerships for limited releases
- Educational content partnerships
- Marketing collaborations

Launch Day Plans:
Our soft launch on August 1st will include:
- Open registration for all users
- Special launch day promotions and events
- Partnership announcements
- Community celebrations
- Educational content release

What Makes This Platform Special:
Online Card Show isn''t just another trading platform. We''ve built something that truly serves the trading card community:
- Advanced authentication and verification systems
- Real-time trading with instant notifications
- Community features that foster connections
- Educational resources for collectors
- Secure and transparent transaction processes

The Journey So Far:
Looking back on the past year, I''m amazed at how far we''ve come. What started as a simple idea has evolved into a comprehensive platform that addresses real needs in the trading card community. The feedback from our beta users has been overwhelmingly positive, and their enthusiasm motivates us every day.

Challenges Overcome:
We''ve faced and overcome numerous challenges:
- Complex real-time trading system implementation
- Scaling infrastructure for thousands of users
- Ensuring security and trust in all transactions
- Building a community from the ground up
- Creating an intuitive user experience

Looking Forward:
As we approach launch day, I''m filled with gratitude for our incredible team, supportive community, and the opportunity to build something meaningful for trading card enthusiasts.

To our beta users: Thank you for your patience, feedback, and support. You''ve helped us create something special.

To our team: Your dedication and hard work are making this vision a reality.

To the trading card community: We''re building this platform for you, and we can''t wait to share it with everyone.

The countdown is on, and the excitement is building. August 1st will be here before we know it, and I can''t wait to see the Online Card Show platform in action, serving the community we''ve built it for.

Stay tuned for more updates as we count down to launch day!',
            ARRAY['Launch Countdown', 'Final Preparations', 'Community Success', 'Technical Achievements', 'Launch Plans'],
            '2025-07-07'
        );
        
        RAISE NOTICE 'Blog posts inserted successfully!';
    ELSE
        RAISE NOTICE 'Blog posts already exist, skipping insertion.';
    END IF;
END $$;
