# Footer Documentation

This document provides detailed information about the footer component of the Stress Free Events and Weddings website, including its structure, styling, functionality, and how to make updates.

## Overview

The footer appears at the bottom of every page and includes:

1. **Logo** - Company logo
2. **Quick Links** - Navigation links to main pages
3. **Contact Information** - Address, phone, and email
4. **Social Media Links** - Links to social media profiles
5. **Copyright Information** - Copyright notice and year

## HTML Structure

```html
<footer class="site-footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-logo">
                <img src="./Current Docs/Assets/newlogo.png" alt="Stress Free Logo" class="logo">
                <p>Making your special day truly stress-free</p>
            </div>
            <div class="footer-links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="services.html">Services</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </div>
            <div class="footer-contact">
                <h3>Contact Us</h3>
                <p><i class="fas fa-map-marker-alt"></i> Dallas-Fort Worth Area</p>
                <p><i class="fas fa-phone"></i> (555) 123-4567</p>
                <p><i class="fas fa-envelope"></i> info@stressfree-events.com</p>
            </div>
            <div class="footer-social">
                <h3>Follow Us</h3>
                <div class="social-icons">
                    <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                    <a href="#" aria-label="Pinterest"><i class="fab fa-pinterest-p"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Stress-Free Events and Weddings. All Rights Reserved.</p>
        </div>
    </div>
</footer>
```

## CSS Styles

The footer is styled with the following CSS:

```css
.site-footer {
    background-color: var(--dark-bg);
    color: var(--white);
    padding: 60px 0 20px;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 30px;
    margin-bottom: 40px;
}

.footer-logo {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.footer-logo .logo {
    height: 60px;
    width: auto;
    margin-bottom: 15px;
}

.footer-logo p {
    font-size: 0.9rem;
    opacity: 0.8;
}

.footer-links h3,
.footer-contact h3,
.footer-social h3 {
    color: var(--white);
    font-size: 1.2rem;
    margin-bottom: 20px;
    font-weight: 600;
}

.footer-links ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.footer-links li {
    margin-bottom: 10px;
}

.footer-links a {
    color: var(--white);
    text-decoration: none;
    opacity: 0.8;
    transition: opacity 0.3s ease;
}

.footer-links a:hover {
    opacity: 1;
    color: var(--primary-color);
}

.footer-contact p {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    opacity: 0.8;
}

.footer-contact i {
    margin-right: 10px;
    color: var(--primary-color);
}

.social-icons {
    display: flex;
    gap: 15px;
}

.social-icons a {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    color: var(--white);
    text-decoration: none;
    transition: all 0.3s ease;
}

.social-icons a:hover {
    background-color: var(--primary-color);
    transform: translateY(-3px);
}

.footer-bottom {
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    padding-top: 20px;
    text-align: center;
}

.footer-bottom p {
    font-size: 0.9rem;
    opacity: 0.7;
    margin: 0;
}

@media (max-width: 768px) {
    .footer-content {
        grid-template-columns: 1fr;
        text-align: center;
    }
    
    .footer-logo {
        align-items: center;
    }
    
    .footer-contact p {
        justify-content: center;
    }
    
    .social-icons {
        justify-content: center;
    }
}
```

## Making Updates

### Updating the Logo

To update the logo in the footer:

1. Prepare your new logo image (recommended size: 200px width, with transparent background)
2. Upload the image to the `Current Docs/Assets/` directory
3. Open all HTML files
4. Locate the footer logo image tag:
   ```html
   <img src="./Current Docs/Assets/newlogo.png" alt="Stress Free Logo" class="logo">
   ```
5. Update the `src` attribute with the path to your new logo
6. Update the `alt` attribute if needed

### Updating the Tagline

To update the tagline below the logo:

1. Open all HTML files
2. Locate the paragraph below the logo:
   ```html
   <p>Making your special day truly stress-free</p>
   ```
3. Edit the text within the `<p>` tags

### Updating Quick Links

To update the quick links in the footer:

1. Open all HTML files
2. Locate the footer links section:
   ```html
   <div class="footer-links">
       <h3>Quick Links</h3>
       <ul>
           <li><a href="index.html">Home</a></li>
           <li><a href="about.html">About Us</a></li>
           <li><a href="services.html">Services</a></li>
           <li><a href="gallery.html">Gallery</a></li>
           <li><a href="blog.html">Blog</a></li>
           <li><a href="contact.html">Contact</a></li>
       </ul>
   </div>
   ```
3. Make your changes:
   - To change link text: Edit the text between the `<a>` tags
   - To change link destination: Edit the `href` attribute
   - To add a new link: Add a new `<li><a href="page.html">Page Name</a></li>` element
   - To remove a link: Delete the corresponding `<li>` element

### Updating Contact Information

To update the contact information:

1. Open all HTML files
2. Locate the footer contact section:
   ```html
   <div class="footer-contact">
       <h3>Contact Us</h3>
       <p><i class="fas fa-map-marker-alt"></i> Dallas-Fort Worth Area</p>
       <p><i class="fas fa-phone"></i> (555) 123-4567</p>
       <p><i class="fas fa-envelope"></i> info@stressfree-events.com</p>
   </div>
   ```
3. Edit the text after each icon to update the address, phone number, or email

### Updating Social Media Links

To update the social media links:

1. Open all HTML files
2. Locate the footer social section:
   ```html
   <div class="footer-social">
       <h3>Follow Us</h3>
       <div class="social-icons">
           <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
           <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
           <a href="#" aria-label="Pinterest"><i class="fab fa-pinterest-p"></i></a>
       </div>
   </div>
   ```
3. To update a link destination: Replace the `#` in the `href` attribute with the actual URL of your social media profile
4. To add a new social media link: Copy an existing link and change the icon class and URL
5. To remove a social media link: Delete the corresponding `<a>` element

### Updating Copyright Information

To update the copyright information:

1. Open all HTML files
2. Locate the footer bottom section:
   ```html
   <div class="footer-bottom">
       <p>&copy; 2025 Stress-Free Events and Weddings. All Rights Reserved.</p>
   </div>
   ```
3. Edit the text within the `<p>` tags, making sure to update the year and company name as needed

## Responsive Behavior

The footer is fully responsive:

- On desktop, the footer sections are displayed in a grid with multiple columns
- On mobile (below 768px), the footer sections stack vertically and are centered
- The logo, links, contact information, and social icons adjust their layout for different screen sizes

## Troubleshooting

### Common Issues

1. **Footer not displaying at the bottom of the page**
   - Make sure the page has enough content to push the footer down
   - Check that the CSS for the page layout is correct
   - Consider adding `min-height: 100vh` to the body and using flexbox to push the footer down

2. **Social icons not displaying correctly**
   - Verify that Font Awesome is properly loaded
   - Check that the icon class names are correct
   - Ensure that the CSS for the social icons is defined correctly

3. **Responsive layout issues**
   - Check the media queries in the CSS
   - Test on different devices and screen sizes
   - Adjust the grid breakpoints if needed

## Related Documentation

- [Updating Footer](../common-tasks/updating-footer.md)
- [Styling Guide](../styling-guide.md)
