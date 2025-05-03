# Website Overview

This document provides a high-level overview of the Stress Free Events and Weddings website, including its structure, technologies used, and file organization.

## Site Structure

The website consists of the following main pages:

1. **Home Page** (`index.html`)
   - Main landing page with hero section, services overview, testimonials, and call-to-action
   
2. **About Page** (`about.html`)
   - Information about the company, team members, and mission statement
   
3. **Services Page** (`services.html`)
   - Detailed information about wedding planning services offered
   
4. **Gallery Pages**
   - Main Gallery Page (`gallery.html`) - Overview of all photo categories
   - Category Pages:
     - Ceremonies (`gallery-ceremony.html`)
     - Receptions (`gallery-reception.html`)
     - Decor (`gallery-decor.html`)
     - Details (`gallery-details.html`)
   
5. **Blog Page** (`blog.html`)
   - Wedding planning tips and articles
   
6. **Contact Page** (`contact.html`)
   - Contact form and information

## Technologies Used

The website is built using standard web technologies:

- **HTML5** - For structure and content
- **CSS3** - For styling and animations
- **JavaScript** - For interactivity and dynamic elements
- **External Libraries**:
  - AOS (Animate On Scroll) - For scroll animations
  - Swiper - For image sliders and carousels
  - Font Awesome - For icons

No server-side technologies or databases are used, making this a static website that's easy to host and maintain.

## File Organization

The website files are organized as follows:

```
website-root/
│
├── index.html                  # Home page
├── about.html                  # About page
├── services.html               # Services page
├── gallery.html                # Main gallery page
├── gallery-ceremony.html       # Ceremony gallery page
├── gallery-reception.html      # Reception gallery page
├── gallery-decor.html          # Decor gallery page
├── gallery-details.html        # Details gallery page
├── blog.html                   # Blog page
├── contact.html                # Contact page
│
├── styles.css                  # Main stylesheet
├── script.js                   # Main JavaScript file
│
├── Current Docs/               # Assets directory
│   └── Assets/                 # Contains logos and other assets
│       └── newlogo.png         # Company logo
│
├── images/                     # Image directory (recommended structure)
│   ├── hero/                   # Hero section images
│   ├── about/                  # About page images
│   ├── services/               # Services page images
│   ├── gallery/                # Gallery images
│   ├── blog/                   # Blog images
│   └── team/                   # Team member images
│
└── documentation/              # This documentation
```

## Responsive Design

The website is fully responsive and designed to work well on all device sizes:

- **Desktop** (1200px and above)
- **Tablet** (768px to 1199px)
- **Mobile** (below 768px)

The responsive design is implemented using:

- CSS media queries
- Flexible grid layouts
- Relative units (rem, em, %)
- Viewport meta tag

## Browser Compatibility

The website is compatible with all modern browsers:

- Chrome (latest 2 versions)
- Firefox (latest 2 versions)
- Safari (latest 2 versions)
- Edge (latest 2 versions)

Internet Explorer is not supported as it has been deprecated by Microsoft.

## Performance Considerations

To maintain good performance:

1. Images are optimized for web (compressed JPG/PNG/WebP formats)
2. External scripts are loaded at the end of the document
3. CSS is minified in production
4. Animations are optimized to avoid layout thrashing

## Next Steps

For more detailed information about specific pages or components, please refer to the relevant documentation sections:

- [Page-Specific Documentation](page-specific/README.md)
- [Component Documentation](components/README.md)
- [Common Tasks](common-tasks/README.md)
