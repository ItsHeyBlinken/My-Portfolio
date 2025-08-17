# My Portfolio - Full Stack Portfolio Site

A modern portfolio website with a dynamic blog system, built with HTML/CSS/JavaScript frontend and Node.js/Express backend.

## 🏗️ Project Structure

```
My-Portfolio/
├── frontend/                    # Static portfolio site
│   ├── index.html              # Main portfolio page
│   ├── blog.html               # Blog page with admin panel
│   ├── styles.css              # Main stylesheet
│   ├── images/                 # Portfolio images
│   └── projects/               # Project showcase
├── backend/                     # Node.js API server
│   ├── src/                    # Source code
│   │   ├── server.js           # Main server file
│   │   ├── config/             # Configuration files
│   │   ├── routes/             # API route handlers
│   │   └── middleware/         # Custom middleware
│   ├── package.json            # Node.js dependencies
│   ├── Dockerfile              # Docker configuration
│   └── env.example            # Environment variables template
├── docker-compose.yml          # Local development setup
└── README.md                   # This file
```

## ✨ Features

### Frontend
- **Modern Design**: Clean, responsive portfolio layout
- **Project Showcase**: Interactive project tiles with filtering
- **Skills Section**: Animated progress bars for technical skills
- **Dark/Light Theme**: User preference toggle
- **Blog Integration**: Dynamic blog post loading
- **Admin Panel**: Built-in content management system

### Backend
- **RESTful API**: Full CRUD operations for blog posts
- **Comment System**: Public comments with admin moderation
- **Authentication**: JWT-based admin login
- **Database**: PostgreSQL with connection pooling
- **Security**: Helmet, rate limiting, CORS protection
- **Docker**: Containerized deployment ready

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- PostgreSQL database
- Docker & Docker Compose (optional)

### Local Development

1. **Clone the repository**:
   ```bash
   git clone <your-repo-url>
   cd My-Portfolio
   ```

2. **Set up the backend**:
   ```bash
   cd backend
   npm install
   cp env.example .env
   # Edit .env with your database credentials
   ```

3. **Start the backend**:
   ```bash
   npm run dev
   ```

4. **Open the frontend**:
   - Open `index.html` in your browser
   - Or serve with a local server

### Docker Development

1. **Start all services**:
   ```bash
   docker-compose up -d
   ```

2. **View logs**:
   ```bash
   docker-compose logs -f backend
   ```

## 🌐 Deployment

### Coolify Deployment

1. **Push to GitHub**: Ensure all files are committed
2. **Connect Repository**: Link your GitHub repo in Coolify
3. **Configure Build**: Set build context to `./backend`
4. **Set Environment Variables**: Use the variables from `backend/env.example`
5. **Deploy**: Coolify will automatically build and deploy

### Environment Variables

Required environment variables for production:

```bash
# Database
DATABASE_URL=postgres://user:password@host:port/database
DB_SSL_MODE=disable

# Server
NODE_ENV=production
PORT=3000

# Security
JWT_SECRET=your-secret-key
ADMIN_USERNAME=admin
ADMIN_PASSWORD_HASH=bcrypt-hash

# CORS
CORS_ORIGIN=https://yourdomain.com
```

## 📚 API Endpoints

### Blog Posts
- `GET /api/posts` - Get all posts
- `GET /api/posts/:id` - Get specific post
- `POST /api/posts` - Create new post (admin)
- `PUT /api/posts/:id` - Update post (admin)
- `DELETE /api/posts/:id` - Delete post (admin)

### Comments
- `GET /api/comments/post/:postId` - Get post comments
- `POST /api/comments` - Create new comment
- `PUT /api/comments/:id/approve` - Approve comment (admin)

### Authentication
- `POST /api/auth/login` - Admin login
- `GET /api/auth/verify` - Verify token
- `POST /api/auth/logout` - Logout

### Health Check
- `GET /health` - System status
- `GET /` - API information

## 🛠️ Development

### Adding New Features

1. **Frontend**: Edit HTML/CSS/JS files in the root directory
2. **Backend**: Add routes in `backend/src/routes/`
3. **Database**: Update schema in `backend/database-setup.sql`

### Testing

- **Backend**: Test API endpoints with tools like Postman
- **Frontend**: Test in multiple browsers and devices
- **Integration**: Test frontend-backend communication

## 🔧 Troubleshooting

### Common Issues

1. **Database Connection Failed**
   - Verify DATABASE_URL format
   - Check network connectivity
   - Ensure database is running

2. **CORS Errors**
   - Verify CORS_ORIGIN setting
   - Check frontend domain matches

3. **Healthcheck Failing**
   - Check backend logs
   - Verify port configuration
   - Consider disabling healthcheck in Coolify

### Debug Mode

Enable debug logging by setting `NODE_ENV=development` in your environment variables.

## 📝 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📞 Support

For support and questions:
- Check the troubleshooting section
- Review the API documentation
- Check the backend logs
- Open an issue on GitHub
