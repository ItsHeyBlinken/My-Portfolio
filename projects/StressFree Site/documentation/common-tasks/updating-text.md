# Updating Text Content

This document provides step-by-step instructions for updating text content on the Stress Free Events and Weddings website.

## Table of Contents

1. [Understanding HTML Structure](#understanding-html-structure)
2. [Updating Page Titles and Meta Descriptions](#updating-page-titles-and-meta-descriptions)
3. [Updating Headings](#updating-headings)
4. [Updating Paragraph Text](#updating-paragraph-text)
5. [Updating Lists](#updating-lists)
6. [Updating Links](#updating-links)
7. [Updating Buttons](#updating-buttons)
8. [Updating Form Labels and Placeholders](#updating-form-labels-and-placeholders)
9. [Updating Testimonials](#updating-testimonials)
10. [Updating Service Descriptions](#updating-service-descriptions)
11. [Updating Footer Content](#updating-footer-content)
12. [Best Practices](#best-practices)

## Understanding HTML Structure

Before updating text content, it's important to understand the basic HTML structure. Text content is typically contained within HTML tags such as:

- `<h1>`, `<h2>`, `<h3>`, etc. for headings
- `<p>` for paragraphs
- `<a>` for links
- `<li>` for list items
- `<span>` for inline text

When updating text, you'll need to locate these tags in the HTML files and modify the content between the opening and closing tags.

## Updating Page Titles and Meta Descriptions

Page titles appear in the browser tab and are important for SEO.

### Steps:

1. Open the HTML file for the page you want to update
2. Locate the `<title>` tag in the `<head>` section
3. Update the text between the opening and closing `<title>` tags
4. Also update the meta description for SEO purposes

### Example:

```html
<!-- Original -->
<head>
    <title>Services - Stress Free Events and Weddings</title>
    <meta name="description" content="Explore our wedding planning services in the DFW area.">
</head>

<!-- Updated -->
<head>
    <title>Wedding Planning Services - Stress Free Events and Weddings</title>
    <meta name="description" content="Comprehensive wedding planning services in the Dallas-Fort Worth area. From full-service planning to day-of coordination.">
</head>
```

## Updating Headings

Headings are used for section titles and subheadings.

### Steps:

1. Open the HTML file for the page you want to update
2. Locate the heading tag (`<h1>`, `<h2>`, `<h3>`, etc.) you want to update
3. Change the text between the opening and closing tags

### Example:

```html
<!-- Original -->
<h2>Our Wedding Planning Services</h2>

<!-- Updated -->
<h2>Comprehensive Wedding Planning Services</h2>
```

## Updating Paragraph Text

Paragraphs contain the main body text of the website.

### Steps:

1. Open the HTML file for the page you want to update
2. Locate the paragraph tag (`<p>`) you want to update
3. Change the text between the opening and closing tags

### Example:

```html
<!-- Original -->
<p>We offer comprehensive wedding planning services to make your special day stress-free.</p>

<!-- Updated -->
<p>Our team of experienced wedding planners provides comprehensive services designed to make your wedding day truly magical and completely stress-free.</p>
```

## Updating Lists

Lists are used to display items in a structured format.

### Steps:

1. Open the HTML file for the page you want to update
2. Locate the list (`<ul>` for unordered lists or `<ol>` for ordered lists)
3. Update the text within each list item (`<li>`)
4. Add or remove list items as needed

### Example:

```html
<!-- Original -->
<ul>
    <li>Full Wedding Planning</li>
    <li>Day-of Coordination</li>
    <li>Vendor Management</li>
</ul>

<!-- Updated -->
<ul>
    <li>Comprehensive Wedding Planning</li>
    <li>Partial Planning Services</li>
    <li>Day-of Coordination</li>
    <li>Vendor Selection and Management</li>
    <li>Budget Planning and Tracking</li>
</ul>
```

## Updating Links

Links connect to other pages or external websites.

### Steps:

1. Open the HTML file for the page you want to update
2. Locate the link tag (`<a>`) you want to update
3. Change the text between the opening and closing tags
4. If needed, update the `href` attribute to change where the link points to

### Example:

```html
<!-- Original -->
<a href="contact.html">Contact Us</a>

<!-- Updated text only -->
<a href="contact.html">Schedule a Consultation</a>

<!-- Updated text and link destination -->
<a href="consultation.html">Schedule a Consultation</a>
```

## Updating Buttons

Buttons are used for calls-to-action and form submissions.

### Steps:

1. Open the HTML file for the page you want to update
2. Locate the button (`<button>` or `<a class="btn">`) you want to update
3. Change the text between the opening and closing tags

### Example:

```html
<!-- Original button element -->
<button type="submit">Send Message</button>

<!-- Updated button element -->
<button type="submit">Submit Inquiry</button>

<!-- Original link styled as button -->
<a href="contact.html" class="btn btn-primary">Book Now</a>

<!-- Updated link styled as button -->
<a href="contact.html" class="btn btn-primary">Schedule Consultation</a>
```

## Updating Form Labels and Placeholders

Forms include labels and placeholders to guide users.

### Steps:

1. Open the HTML file containing the form
2. Locate the form labels (`<label>`) and input fields
3. Update the text within the labels
4. Update the `placeholder` attributes in the input fields

### Example:

```html
<!-- Original -->
<div class="form-group">
    <label for="name">Name</label>
    <input type="text" id="name" name="name" placeholder="Enter your name" required>
</div>

<!-- Updated -->
<div class="form-group">
    <label for="name">Full Name</label>
    <input type="text" id="name" name="name" placeholder="Enter your full name" required>
</div>
```

## Updating Testimonials

Testimonials showcase client feedback.

### Steps:

1. Open the HTML file containing the testimonials
2. Locate the testimonial section
3. Update the testimonial text, client name, and other details

### Example:

```html
<!-- Original -->
<div class="testimonial" data-aos="fade-up">
    <div class="testimonial-content">
        <p>"Working with Stress Free Events was amazing. They made our wedding day perfect!"</p>
    </div>
    <div class="testimonial-author">
        <h4>Emily & David</h4>
        <p>Married May 2023</p>
    </div>
</div>

<!-- Updated -->
<div class="testimonial" data-aos="fade-up">
    <div class="testimonial-content">
        <p>"The team at Stress Free Events truly lived up to their name. Our wedding day was absolutely perfect, and we didn't have to worry about a single detail. They exceeded all our expectations!"</p>
    </div>
    <div class="testimonial-author">
        <h4>Jennifer & Michael</h4>
        <p>Married June 2025</p>
    </div>
</div>
```

## Updating Service Descriptions

Service descriptions provide details about the services offered.

### Steps:

1. Open the `services.html` file
2. Locate the service card or section you want to update
3. Update the heading, description, and any other details

### Example:

```html
<!-- Original -->
<div class="service-card" data-aos="fade-up">
    <div class="service-icon">
        <i class="fas fa-calendar-check"></i>
    </div>
    <div class="service-content">
        <h3>Full Wedding Planning</h3>
        <p>Our comprehensive planning service covers every aspect of your wedding from start to finish.</p>
    </div>
</div>

<!-- Updated -->
<div class="service-card" data-aos="fade-up">
    <div class="service-icon">
        <i class="fas fa-calendar-check"></i>
    </div>
    <div class="service-content">
        <h3>Comprehensive Wedding Planning</h3>
        <p>Our signature full-service planning package includes everything you need for a perfect wedding day. From venue selection and vendor management to timeline creation and day-of coordination, we handle every detail so you can enjoy the journey.</p>
    </div>
</div>
```

## Updating Footer Content

The footer appears on all pages and contains contact information and links.

### Steps:

1. Open the HTML file you want to update
2. Locate the footer section (`<footer class="site-footer">`)
3. Update the text in the footer sections (contact info, copyright, etc.)

### Example:

```html
<!-- Original -->
<div class="footer-contact">
    <h3>Contact Us</h3>
    <p><i class="fas fa-map-marker-alt"></i> Dallas-Fort Worth Area</p>
    <p><i class="fas fa-phone"></i> (555) 123-4567</p>
    <p><i class="fas fa-envelope"></i> info@stressfree-events.com</p>
</div>

<!-- Updated -->
<div class="footer-contact">
    <h3>Contact Us</h3>
    <p><i class="fas fa-map-marker-alt"></i> Dallas-Fort Worth Metroplex</p>
    <p><i class="fas fa-phone"></i> (555) 987-6543</p>
    <p><i class="fas fa-envelope"></i> hello@stressfree-events.com</p>
</div>
```

**Note**: Since the footer appears on all pages, you'll need to update it in every HTML file to maintain consistency.

## Best Practices

### 1. Maintain Consistent Tone and Style

- Keep the writing style consistent across all pages
- Use a friendly, professional tone that matches the brand
- Maintain consistent capitalization and formatting

### 2. Use Proper HTML Structure

- Keep text within appropriate HTML tags
- Don't mix content and presentation (use CSS for styling, not HTML)
- Maintain proper nesting of HTML elements

### 3. Consider SEO

- Include relevant keywords naturally in headings and content
- Write descriptive, unique meta descriptions for each page
- Use appropriate heading levels (H1, H2, H3) in a hierarchical manner

### 4. Check for Errors

- Proofread all text for spelling and grammar errors
- Check that links point to the correct destinations
- Verify that all updated content displays correctly on the website

### 5. Make Global Updates When Needed

- For information that appears on multiple pages (like contact details), update all instances
- Consider creating a spreadsheet to track where certain information appears

### 6. Test on Multiple Devices

- Check how text displays on different screen sizes
- Ensure that text doesn't overflow containers on mobile devices
- Verify that line breaks and spacing look good on all devices

## Related Documentation

- [Updating Images](updating-images.md)
- [Styling Guide](../styling-guide.md)
