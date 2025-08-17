# Portfolio Blog Backend

A Node.js/Express backend API for managing a portfolio blog system with PostgreSQL database integration.

## Features

- **Blog Post Management**: CRUD operations for blog posts
- **Comment System**: Public comments with admin moderation
- **Admin Authentication**: JWT-based admin login system
- **Database Integration**: PostgreSQL with connection pooling
- **Security**: Helmet, rate limiting, CORS protection
- **Docker Support**: Containerized deployment
- **Health Monitoring**: Built-in health check endpoints

## Tech Stack

- **Runtime**: Node.js 18+
- **Framework**: Express.js
- **Database**: PostgreSQL
- **Authentication**: JWT (JSON Web Tokens)
- **Security**: Helmet, bcryptjs, express-rate-limit
- **Containerization**: Docker & Docker Compose
- **Environment**: dotenv for configuration

## Quick Start

### Local Development

1. **Install dependencies**:
   ```bash
   npm install
   ```

2. **Set up environment variables**:
   ```bash
   cp env.example .env
   # Edit .env with your database credentials
   ```

3. **Start development server**:
   ```bash
   npm run dev
   ```

### Docker Deployment

1. **Build and run with Docker Compose**:
   ```bash
   docker-compose up -d
   ```

2. **View logs**:
   ```bash
   docker-compose logs -f
   ```

## API Endpoints

### Posts
- `GET /api/posts` - Get all posts with comment counts
- `GET /api/posts/:id` - Get specific post
- `POST /api/posts` - Create new post (admin only)
- `PUT /api/posts/:id` - Update post (admin only)
- `DELETE /api/posts/:id` - Delete post and comments (admin only)

### Comments
- `GET /api/comments/post/:postId` - Get comments for a post
- `GET /api/comments` - Get all comments (admin only)
- `POST /api/comments` - Create new comment
- `PUT /api/comments/:id/approve` - Approve/disapprove comment (admin only)
- `PUT /api/comments/:id` - Update comment (admin only)
- `DELETE /api/comments/:id` - Delete comment (admin only)

### Authentication
- `POST /api/auth/login` - Admin login
- `GET /api/auth/verify` - Verify JWT token
- `POST /api/auth/logout` - Logout (client-side)

### Health Check
- `GET /health` - System health status
- `GET /` - API information

## Database Schema

### blog_posts
- `id` (SERIAL PRIMARY KEY)
- `title` (VARCHAR)
- `content` (TEXT)
- `tags` (TEXT[])
- `published_date` (DATE)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

### comments
- `id` (SERIAL PRIMARY KEY)
- `post_id` (INTEGER, REFERENCES blog_posts)
- `author_name` (VARCHAR)
- `author_email` (VARCHAR)
- `content` (TEXT)
- `is_approved` (BOOLEAN)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_ENV` | Environment mode | `production` |
| `PORT` | Server port | `3000` |
| `DB_HOST` | Database host | `localhost` |
| `DB_PORT` | Database port | `5432` |
| `DB_NAME` | Database name | `portfolio_blog` |
| `DB_USER` | Database username | `ocs-beta-db` |
| `DB_PASSWORD` | Database password | Required |
| `JWT_SECRET` | JWT signing secret | Required |
| `ADMIN_USERNAME` | Admin username | `admin` |
| `ADMIN_PASSWORD_HASH` | Admin password hash | Required |
| `CORS_ORIGIN` | Allowed CORS origin | `https://bytesbyblinken.com` |

## Security Features

- **JWT Authentication**: Secure admin access
- **Password Hashing**: bcrypt for secure password storage
- **Rate Limiting**: Protection against abuse
- **CORS Protection**: Controlled cross-origin access
- **Helmet**: Security headers
- **Input Validation**: Request sanitization

## Deployment

### Coolify Deployment

1. **Push to GitHub**: Ensure all files are committed
2. **Connect Repository**: Link your GitHub repo in Coolify
3. **Configure Environment**: Set all required environment variables
4. **Deploy**: Coolify will automatically build and deploy

### Manual VPS Deployment

1. **Clone repository** to your VPS
2. **Set environment variables**
3. **Run database setup script**
4. **Start with PM2 or systemd**

## Monitoring

- **Health Checks**: Built-in endpoint monitoring
- **Logs**: Comprehensive error and access logging
- **Performance**: Response time monitoring
- **Database**: Connection status monitoring

## Troubleshooting

### Common Issues

1. **Database Connection Failed**
   - Verify database credentials
   - Check network connectivity
   - Ensure database is running

2. **SSL Connection Error**
   - Set `ssl: false` in database config
   - Verify database SSL settings

3. **Port Already in Use**
   - Change port in environment variables
   - Check for conflicting services

### Debug Mode

Enable debug logging by setting `NODE_ENV=development` in your environment variables.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions:
- Check the troubleshooting section
- Review the API documentation
- Check the logs for error details
