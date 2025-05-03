# Header and Navigation Documentation

This document provides detailed information about the header and navigation components of the Stress Free Events and Weddings website, including their structure, styling, functionality, and how to make updates.

## Overview

The header appears at the top of every page and includes:

1. **Logo** - Links to the home page
2. **Navigation Menu** - Links to main pages
3. **Call-to-Action Button** - Links to the contact page
4. **Mobile Menu Toggle** - For responsive design

## HTML Structure

```html
<header class="site-header">
    <div class="container">
        <div class="logo-container">
            <a href="index.html"><img src="./Current Docs/Assets/newlogo.png" alt="Stress Free Logo" class="logo"></a>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="index.html" class="active">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="services.html">Services</a></li>
                <li><a href="gallery.html">Gallery</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="contact.html">Contact</a></li>
            </ul>
        </nav>
        <div class="header-cta">
            <a href="contact.html" class="btn btn-primary">Book Consultation</a>
        </div>
        <button class="mobile-menu-toggle">
            <span class="hamburger"></span>
        </button>
    </div>
</header>
```

## CSS Styles

The header and navigation are styled with the following CSS:

```css
.site-header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: var(--white);
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    z-index: 1000;
    padding: 15px 0;
    transition: all 0.3s ease;
}

.site-header .container {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo-container {
    flex: 0 0 auto;
}

.logo {
    height: 60px;
    width: auto;
}

.main-nav {
    flex: 1 1 auto;
    display: flex;
    justify-content: center;
}

.main-nav ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
}

.main-nav li {
    margin: 0 15px;
}

.main-nav a {
    color: var(--text-color);
    text-decoration: none;
    font-weight: 500;
    padding: 10px 0;
    position: relative;
    transition: color 0.3s ease;
}

.main-nav a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 2px;
    background-color: var(--primary-color);
    transition: width 0.3s ease;
}

.main-nav a:hover,
.main-nav a.active {
    color: var(--primary-color);
}

.main-nav a:hover::after,
.main-nav a.active::after {
    width: 100%;
}

.header-cta {
    flex: 0 0 auto;
    margin-left: 20px;
}

.mobile-menu-toggle {
    display: none;
    background: none;
    border: none;
    cursor: pointer;
    padding: 10px;
}

.hamburger {
    display: block;
    position: relative;
    width: 24px;
    height: 2px;
    background-color: var(--text-color);
    transition: all 0.3s ease;
}

.hamburger::before,
.hamburger::after {
    content: '';
    position: absolute;
    width: 24px;
    height: 2px;
    background-color: var(--text-color);
    transition: all 0.3s ease;
}

.hamburger::before {
    top: -8px;
}

.hamburger::after {
    bottom: -8px;
}

/* Mobile styles */
@media (max-width: 991px) {
    .main-nav {
        position: absolute;
        top: 100%;
        left: 0;
        width: 100%;
        background-color: var(--white);
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        padding: 20px 0;
        display: none;
    }
    
    .main-nav.active {
        display: block;
    }
    
    .main-nav ul {
        flex-direction: column;
        align-items: center;
    }
    
    .main-nav li {
        margin: 10px 0;
    }
    
    .mobile-menu-toggle {
        display: block;
    }
    
    .mobile-menu-toggle.active .hamburger {
        background-color: transparent;
    }
    
    .mobile-menu-toggle.active .hamburger::before {
        transform: rotate(45deg);
        top: 0;
    }
    
    .mobile-menu-toggle.active .hamburger::after {
        transform: rotate(-45deg);
        bottom: 0;
    }
    
    .header-cta {
        display: none;
    }
}
```

## JavaScript Functionality

The mobile menu toggle functionality is implemented with JavaScript:

```javascript
// Mobile Menu Toggle
const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
const mainNav = document.querySelector('.main-nav');

mobileMenuToggle.addEventListener('click', function() {
    this.classList.toggle('active');
    mainNav.classList.toggle('active');
});
```

## Making Updates

### Updating the Logo

To update the logo:

1. Prepare your new logo image (recommended size: 200px width, with transparent background)
2. Upload the image to the `Current Docs/Assets/` directory
3. Open all HTML files
4. Locate the logo image tag:
   ```html
   <img src="./Current Docs/Assets/newlogo.png" alt="Stress Free Logo" class="logo">
   ```
5. Update the `src` attribute with the path to your new logo
6. Update the `alt` attribute if needed

### Updating Navigation Links

To update the navigation menu:

1. Open all HTML files (to maintain consistency across the site)
2. Locate the navigation menu:
   ```html
   <nav class="main-nav">
       <ul>
           <li><a href="index.html" class="active">Home</a></li>
           <li><a href="about.html">About</a></li>
           <li><a href="services.html">Services</a></li>
           <li><a href="gallery.html">Gallery</a></li>
           <li><a href="blog.html">Blog</a></li>
           <li><a href="contact.html">Contact</a></li>
       </ul>
   </nav>
   ```
3. Make your changes:
   - To change link text: Edit the text between the `<a>` tags
   - To change link destination: Edit the `href` attribute
   - To add a new link: Add a new `<li><a href="page.html">Page Name</a></li>` element
   - To remove a link: Delete the corresponding `<li>` element
4. Update the `active` class on each page to highlight the current page

### Updating the Call-to-Action Button

To update the call-to-action button:

1. Open all HTML files
2. Locate the header CTA:
   ```html
   <div class="header-cta">
       <a href="contact.html" class="btn btn-primary">Book Consultation</a>
   </div>
   ```
3. To change the button text: Edit the text between the `<a>` tags
4. To change the button destination: Edit the `href` attribute
5. To change the button style: Edit the class (e.g., change `btn-primary` to `btn-light`)

## Responsive Behavior

The header and navigation are fully responsive:

- On desktop (992px and above), the navigation menu is displayed horizontally
- On mobile and tablet (below 992px), the navigation menu is hidden behind a hamburger menu
- The call-to-action button is hidden on mobile
- The logo remains visible at all screen sizes, but may be smaller on mobile

## Troubleshooting

### Common Issues

1. **Navigation menu not displaying correctly on mobile**
   - Check that the JavaScript for the mobile menu toggle is working
   - Verify that the CSS media queries are correct
   - Ensure that the HTML structure matches the expected structure for the JavaScript selectors

2. **Active page not highlighted**
   - Make sure the `active` class is added to the correct navigation link on each page
   - Check that the CSS for the `active` class is defined correctly

3. **Logo too large or small**
   - Adjust the CSS for the `.logo` class to change the size
   - Prepare a properly sized logo image

## Related Documentation

- [Updating Navigation](../common-tasks/updating-navigation.md)
- [Adding New Pages](../common-tasks/adding-pages.md)
