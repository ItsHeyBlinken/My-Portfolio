# Troubleshooting Guide

This document provides solutions to common issues you might encounter when maintaining the Stress Free Events and Weddings website.

## Table of Contents

1. [Display Issues](#display-issues)
2. [Image Issues](#image-issues)
3. [Navigation Issues](#navigation-issues)
4. [Form Issues](#form-issues)
5. [Gallery Issues](#gallery-issues)
6. [Mobile Responsiveness Issues](#mobile-responsiveness-issues)
7. [Performance Issues](#performance-issues)

## Display Issues

### Issue: Text or elements are not displaying correctly

**Possible causes and solutions:**

1. **CSS not loading**
   - Check that the `styles.css` file is properly linked in the HTML
   - Verify that the file path is correct
   - Try clearing your browser cache

2. **HTML structure issues**
   - Check for unclosed HTML tags
   - Validate your HTML using [W3C Validator](https://validator.w3.org/)

3. **CSS conflicts**
   - Check for duplicate CSS rules
   - Use browser developer tools to inspect the element and see which CSS rules are being applied

4. **Font not loading**
   - Verify that the Google Fonts link is correct
   - Check if the font family name is spelled correctly in the CSS

### Issue: Layout breaks on certain screen sizes

**Possible causes and solutions:**

1. **Missing or incorrect media queries**
   - Check the responsive CSS rules in the stylesheet
   - Add appropriate media queries for the affected screen sizes

2. **Fixed dimensions instead of responsive units**
   - Replace fixed pixel values with responsive units (%, rem, em, vh, vw)
   - Use max-width instead of fixed width for containers

3. **Overflow issues**
   - Add `overflow: hidden` to the parent container
   - Check for elements with fixed widths that exceed their containers

## Image Issues

### Issue: Images not displaying

**Possible causes and solutions:**

1. **Incorrect file path**
   - Verify that the image path in the `src` attribute is correct
   - Check for typos in the filename or directory name
   - Remember that paths are case-sensitive on some servers

2. **Image file missing or corrupted**
   - Confirm that the image file exists in the specified location
   - Try re-uploading the image

3. **Image format not supported**
   - Use web-standard formats (JPG, PNG, GIF, WebP)
   - Avoid using HEIC, TIFF, or other non-web formats

### Issue: Images look pixelated or blurry

**Possible causes and solutions:**

1. **Low-resolution images**
   - Use higher resolution images (but optimize them for web)
   - Avoid scaling small images to larger sizes

2. **Over-compression**
   - Re-export images with higher quality settings
   - Use appropriate compression tools that maintain quality

3. **Incorrect display size**
   - Set the correct dimensions in the HTML or CSS
   - Use the `srcset` attribute for responsive images

### Issue: Images load slowly

**Possible causes and solutions:**

1. **Large file sizes**
   - Compress images using tools like [TinyPNG](https://tinypng.com/) or [Squoosh](https://squoosh.app/)
   - Resize images to the actual dimensions needed

2. **Too many images**
   - Consider lazy loading images with the `loading="lazy"` attribute
   - Only load essential images initially

3. **Image format**
   - Use WebP format for better compression when possible
   - Provide fallbacks for browsers that don't support WebP

## Navigation Issues

### Issue: Navigation links not working

**Possible causes and solutions:**

1. **Incorrect href attribute**
   - Check that the link paths are correct
   - Verify that the target pages exist

2. **JavaScript errors**
   - Check the browser console for JavaScript errors
   - Ensure that any JavaScript related to navigation is working

3. **Mobile menu issues**
   - Test the mobile menu toggle functionality
   - Check for conflicts with other scripts

### Issue: Active state not showing on current page

**Possible causes and solutions:**

1. **Missing active class**
   - Add the `active` class to the current page's navigation link
   - Implement JavaScript to automatically add the active class based on the current URL

2. **CSS issues**
   - Check that the CSS for the `.active` class is defined correctly
   - Verify that the styles are not being overridden

## Form Issues

### Issue: Form not submitting

**Possible causes and solutions:**

1. **Missing or incorrect form action**
   - Check that the `action` attribute points to the correct endpoint
   - Verify that the form method (`GET` or `POST`) is appropriate

2. **JavaScript validation errors**
   - Check the browser console for JavaScript errors
   - Test the form validation functions

3. **Required fields**
   - Ensure that all required fields have the `required` attribute
   - Check that the validation messages are displaying correctly

### Issue: Form validation not working

**Possible causes and solutions:**

1. **Missing validation attributes**
   - Add appropriate validation attributes (`required`, `pattern`, `min`, `max`, etc.)
   - Implement custom validation with JavaScript if needed

2. **JavaScript errors**
   - Check the browser console for JavaScript errors
   - Verify that validation scripts are loaded and running

## Gallery Issues

### Issue: Gallery not displaying correctly

**Possible causes and solutions:**

1. **Swiper.js not loaded**
   - Check that the Swiper.js library is properly linked
   - Verify that the initialization code is correct

2. **Missing or incorrect CSS**
   - Ensure that the Swiper CSS is loaded
   - Check for custom gallery styles that might be missing

3. **JavaScript errors**
   - Check the browser console for JavaScript errors
   - Verify that the Swiper initialization code is correct

### Issue: Gallery filtering not working

**Possible causes and solutions:**

1. **Incorrect data attributes**
   - Check that the `data-category` attributes on gallery items match the `data-filter` attributes on filter buttons
   - Verify that the JavaScript selector is targeting the correct elements

2. **JavaScript errors**
   - Check the browser console for JavaScript errors
   - Test the filtering function step by step

### Issue: Gallery images not loading

**Possible causes and solutions:**

1. **Incorrect image paths**
   - Verify that the image paths are correct
   - Check for typos in the filenames or directory names

2. **Missing images**
   - Confirm that all referenced images exist in the specified locations
   - Upload any missing images

## Mobile Responsiveness Issues

### Issue: Content overflows on mobile

**Possible causes and solutions:**

1. **Fixed widths**
   - Replace fixed widths with responsive units (%, rem, vw)
   - Add `max-width: 100%` to images and other media

2. **Missing viewport meta tag**
   - Ensure the viewport meta tag is present in the head section:
     ```html
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     ```

3. **Horizontal scrolling**
   - Check for elements that extend beyond the viewport width
   - Use `overflow-x: hidden` on the body if necessary

### Issue: Text too small or large on mobile

**Possible causes and solutions:**

1. **Fixed font sizes**
   - Use relative units (rem, em) for font sizes
   - Implement responsive typography with media queries

2. **Viewport settings**
   - Check that the viewport meta tag is correctly set
   - Avoid user-scalable=no unless absolutely necessary

### Issue: Touch targets too small

**Possible causes and solutions:**

1. **Small buttons or links**
   - Increase the size of buttons and links on mobile
   - Ensure touch targets are at least 44×44 pixels

2. **Crowded elements**
   - Add more spacing between interactive elements
   - Simplify the mobile layout if necessary

## Performance Issues

### Issue: Slow page loading

**Possible causes and solutions:**

1. **Large images**
   - Optimize and compress all images
   - Use responsive images with appropriate sizes

2. **Too many external resources**
   - Minimize the use of external scripts and stylesheets
   - Combine and minify CSS and JavaScript files

3. **Render-blocking resources**
   - Load non-critical CSS asynchronously
   - Move JavaScript to the end of the document or use `defer` attribute

### Issue: Animations are choppy

**Possible causes and solutions:**

1. **Complex animations**
   - Simplify animations, especially on mobile
   - Use CSS properties that trigger GPU acceleration (transform, opacity)

2. **Too many animated elements**
   - Reduce the number of simultaneously animated elements
   - Stagger animations to distribute the load

3. **JavaScript performance**
   - Optimize JavaScript code that controls animations
   - Use requestAnimationFrame for smoother animations

## Browser Compatibility Issues

### Issue: Website looks different in different browsers

**Possible causes and solutions:**

1. **Missing vendor prefixes**
   - Add appropriate vendor prefixes for CSS properties
   - Consider using Autoprefixer to handle this automatically

2. **Unsupported features**
   - Check browser compatibility for used features on [Can I Use](https://caniuse.com/)
   - Provide fallbacks for unsupported features

3. **CSS reset inconsistencies**
   - Use a CSS reset or normalize.css to create a consistent baseline
   - Test in multiple browsers and fix specific issues

## Getting Additional Help

If you encounter issues not covered in this troubleshooting guide:

1. **Search online**
   - Search for the specific error message or issue description
   - Check Stack Overflow or web development forums

2. **Browser developer tools**
   - Use the browser's developer tools (F12 or Right-click > Inspect)
   - Check the Console tab for JavaScript errors
   - Use the Elements tab to inspect HTML and CSS

3. **Validate your code**
   - Use the [W3C HTML Validator](https://validator.w3.org/)
   - Use the [W3C CSS Validator](https://jigsaw.w3.org/css-validator/)

4. **Contact a web developer**
   - If you can't resolve the issue, consider contacting a professional web developer for assistance
