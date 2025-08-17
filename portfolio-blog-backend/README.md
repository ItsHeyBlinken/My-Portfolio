# Portfolio Blog Backend

A Node.js/Express backend API for managing a portfolio blog system with PostgreSQL database integration.

## Features

- ✅ **Blog Posts Management** - Create, read, update, delete blog posts
- ✅ **Comment System** - Public comments with admin moderation
- ✅ **Admin Authentication** - JWT-based secure admin access
- ✅ **PostgreSQL Integration** - Robust database backend
- ✅ **Security Features** - Rate limiting, CORS, helmet
- ✅ **Docker Ready** - Easy deployment with Coolify

## Tech Stack

- **Backend**: Node.js, Express.js
- **Database**: PostgreSQL
- **Authentication**: JWT (JSON Web Tokens)
- **Security**: bcryptjs, helmet, rate limiting
- **Containerization**: Docker, Docker Compose

## Quick Start

### Prerequisites

- Node.js 18+ installed
- PostgreSQL database running
- Docker (for containerized deployment)

### Local Development

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd portfolio-blog-backend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   ```bash
   cp env.example .env
   # Edit .env with your database credentials
   ```

4. **Start the development server**
   ```bash
   npm run dev
   ```

5. **Test the API**
   ```bash
   curl http://localhost:3000/health
   ```

## API Endpoints

### Blog Posts

- `GET /api/posts` - Get all blog posts
- `GET /api/posts/:id` - Get specific post with comments
- `POST /api/posts` - Create new post (admin only)
- `PUT /api/posts/:id` - Update post (admin only)
- `DELETE /api/posts/:id` - Delete post (admin only)

### Comments

- `GET /api/comments/post/:postId` - Get comments for a post
- `POST /api/comments` - Add new comment (public)
- `GET /api/comments/admin` - Get all comments for moderation (admin only)
- `PUT /api/comments/:id/approve` - Approve/disapprove comment (admin only)
- `DELETE /api/comments/:id` - Delete comment (admin only)

### Authentication

- `POST /api/auth/login` - Admin login
- `GET /api/auth/verify` - Verify JWT token
- `POST /api/auth/logout` - Logout (client-side)

## Database Schema

### Blog Posts Table
```sql
CREATE TABLE blog_posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_date DATE NOT NULL,
    tags TEXT[],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Comments Table
```sql
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES blog_posts(id) ON DELETE CASCADE,
    author_name VARCHAR(100) NOT NULL,
    author_email VARCHAR(255),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_approved BOOLEAN DEFAULT true
);
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_ENV` | Environment mode | `production` |
| `PORT` | Server port | `3000` |
| `DB_HOST` | Database host | `168.231.66.214` |
| `DB_PORT` | Database port | `5432` |
| `DB_NAME` | Database name | `portfolio_blog` |
| `DB_USER` | Database username | `ocs-beta-db` |
| `DB_PASSWORD` | Database password | Required |
| `JWT_SECRET` | JWT signing secret | Required |
| `ADMIN_USERNAME` | Admin username | `admin` |
| `ADMIN_PASSWORD_HASH` | Admin password hash | Required |

## Docker Deployment

### Build and Run
```bash
# Build the image
docker build -t portfolio-blog-backend .

# Run with docker-compose
docker-compose up -d
```

### Environment Setup
1. Copy `env.example` to `.env`
2. Update database credentials
3. Set secure JWT secret
4. Update admin credentials

## Coolify Deployment

### Step 1: Create GitHub Repository
1. Push this code to a new GitHub repository
2. Ensure repository is public or Coolify has access

### Step 2: Coolify Dashboard Setup
1. **Create New Service**
   - Service Type: `Application`
   - Source: `GitHub`
   - Repository: Select your portfolio-blog-backend repo

2. **Build Configuration**
   - Build Pack: `Docker`
   - Dockerfile Path: `./Dockerfile`
   - Port: `3000`

3. **Environment Variables**
   - Add all variables from `.env` file
   - Ensure database credentials are correct

4. **Deploy**
   - Click "Deploy" button
   - Monitor build logs
   - Verify health check passes

### Step 3: Update Portfolio
1. Update your portfolio's `blog.html` with new API endpoints
2. Test blog functionality
3. Verify admin access works

## Security Features

- **Rate Limiting**: 100 requests per 15 minutes per IP
- **CORS Protection**: Configured for your domains
- **Helmet**: Security headers
- **JWT Authentication**: Secure admin access
- **Input Validation**: Content length and format checks
- **SQL Injection Protection**: Parameterized queries

## Monitoring

### Health Check
```bash
curl http://your-domain:3000/health
```

### Logs
```bash
# Docker logs
docker logs portfolio-blog-backend

# Coolify logs
# Check in Coolify dashboard
```

## Troubleshooting

### Common Issues

1. **Database Connection Failed**
   - Verify database credentials
   - Check firewall settings
   - Ensure PostgreSQL is running

2. **Port Already in Use**
   - Change port in environment variables
   - Update docker-compose.yml

3. **JWT Token Issues**
   - Verify JWT_SECRET is set
   - Check token expiration
   - Ensure proper Authorization header

### Support

For issues or questions:
- Check logs for error messages
- Verify environment variables
- Test database connection
- Review API documentation

## License

MIT License - see LICENSE file for details

## Author

Chris Hall (BytesByBlinken)
