# Home Page Documentation

This document provides detailed information about the home page (`index.html`) of the Stress Free Events and Weddings website, including its structure, components, and how to make updates.

## Page Structure

The home page consists of the following sections:

1. **Header** - Logo, navigation menu, and call-to-action button
2. **Hero Section** - Large banner with headline, subheading, and call-to-action
3. **About Section** - Brief introduction to the company
4. **Services Section** - Overview of wedding planning services
5. **Why Choose Us Section** - Key benefits of choosing the company
6. **Gallery Preview** - Preview of the wedding gallery
7. **Testimonials Section** - Client testimonials
8. **CTA Section** - Call-to-action to contact the company
9. **Footer** - Logo, quick links, contact information, social media links, and copyright

## Key Components

### Hero Section

The hero section is the first thing visitors see when they land on the website. It features a large background image, a headline, a subheading, and a call-to-action button.

```html
<section class="hero-section">
    <div class="hero-content">
        <h1 data-aos="fade-up">Creating Stress-Free Wedding Experiences</h1>
        <p class="lead" data-aos="fade-up" data-aos-delay="100">Let us handle the details so you can enjoy every moment of your special day</p>
        <div class="hero-buttons" data-aos="fade-up" data-aos-delay="200">
            <a href="services.html" class="btn btn-primary">Our Services</a>
            <a href="contact.html" class="btn btn-light">Contact Us</a>
        </div>
    </div>
</section>
```

#### Updating the Hero Section

To update the hero section:

1. **Change the headline**: Edit the text within the `<h1>` tags
2. **Change the subheading**: Edit the text within the `<p class="lead">` tags
3. **Change the buttons**: Edit the text within the `<a>` tags
4. **Change the background image**: Update the CSS for the `.hero-section` class in the stylesheet or inline style

### About Section

The about section provides a brief introduction to the company and its mission.

```html
<section class="about-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6" data-aos="fade-right">
                <div class="about-image">
                    <img src="path/to/image.jpg" alt="About Stress Free Events and Weddings">
                </div>
            </div>
            <div class="col-md-6" data-aos="fade-left">
                <div class="about-content">
                    <h2>About Stress Free Events and Weddings</h2>
                    <p>We are a dedicated team of wedding planners serving the Dallas-Fort Worth area. With years of experience and a passion for creating beautiful celebrations, we take the stress out of wedding planning.</p>
                    <p>Our mission is to make your wedding day truly magical while ensuring you enjoy every moment of the journey.</p>
                    <a href="about.html" class="btn btn-primary">Learn More About Us</a>
                </div>
            </div>
        </div>
    </div>
</section>
```

#### Updating the About Section

To update the about section:

1. **Change the image**: Update the `src` attribute of the `<img>` tag
2. **Change the heading**: Edit the text within the `<h2>` tags
3. **Change the paragraphs**: Edit the text within the `<p>` tags
4. **Change the button**: Edit the text within the `<a>` tag

### Services Section

The services section showcases the main wedding planning services offered by the company.

```html
<section class="services-section">
    <div class="container">
        <div class="section-header text-center" data-aos="fade-up">
            <h2>Our Wedding Planning Services</h2>
            <p>Comprehensive services to make your wedding day perfect</p>
        </div>
        <div class="services-container">
            <div class="service-card" data-aos="fade-up">
                <div class="service-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="service-content">
                    <h3>Full Wedding Planning</h3>
                    <p>Our comprehensive planning service covers every aspect of your wedding from start to finish.</p>
                </div>
            </div>
            <!-- More service cards -->
        </div>
        <div class="text-center" data-aos="fade-up">
            <a href="services.html" class="btn btn-primary">View All Services</a>
        </div>
    </div>
</section>
```

#### Updating the Services Section

To update the services section:

1. **Change the section heading**: Edit the text within the `<h2>` tags
2. **Change the section subheading**: Edit the text within the `<p>` tags in the section-header
3. **Change service cards**: For each service card:
   - Update the icon by changing the class of the `<i>` tag
   - Edit the service title within the `<h3>` tags
   - Edit the service description within the `<p>` tags
4. **Add or remove service cards**: Copy an existing service card and modify it, or remove a card
5. **Change the button**: Edit the text within the `<a>` tag

### Testimonials Section

The testimonials section displays feedback from satisfied clients.

```html
<section class="testimonials-section">
    <div class="container">
        <div class="section-header text-center" data-aos="fade-up">
            <h2>What Our Clients Say</h2>
            <p>Hear from couples who had a stress-free wedding experience</p>
        </div>
        <div class="testimonials-container">
            <div class="testimonial" data-aos="fade-up">
                <div class="testimonial-content">
                    <p>"Working with Stress Free Events was amazing. They made our wedding day perfect!"</p>
                </div>
                <div class="testimonial-author">
                    <h4>Emily & David</h4>
                    <p>Married May 2023</p>
                </div>
            </div>
            <!-- More testimonials -->
        </div>
    </div>
</section>
```

#### Updating the Testimonials Section

To update the testimonials section:

1. **Change the section heading**: Edit the text within the `<h2>` tags
2. **Change the section subheading**: Edit the text within the `<p>` tags in the section-header
3. **Change testimonials**: For each testimonial:
   - Edit the testimonial text within the `<p>` tags in the testimonial-content
   - Edit the client name within the `<h4>` tags
   - Edit the additional information within the `<p>` tags in the testimonial-author
4. **Add or remove testimonials**: Copy an existing testimonial and modify it, or remove a testimonial

### CTA Section

The call-to-action section encourages visitors to contact the company.

```html
<section class="cta-section">
    <div class="container">
        <div class="cta-content" data-aos="fade-up">
            <h2>Ready to Create Your Dream Wedding?</h2>
            <p>Contact us today to schedule a complimentary consultation and learn how we can help make your wedding day truly stress-free.</p>
            <a href="contact.html" class="btn btn-light">Book Your Consultation</a>
        </div>
    </div>
</section>
```

#### Updating the CTA Section

To update the CTA section:

1. **Change the heading**: Edit the text within the `<h2>` tags
2. **Change the paragraph**: Edit the text within the `<p>` tags
3. **Change the button**: Edit the text within the `<a>` tag

## JavaScript Functionality

The home page uses the following JavaScript functionality:

1. **AOS (Animate On Scroll)**: For scroll animations
2. **Mobile Menu Toggle**: For the responsive navigation menu

```javascript
// Initialize AOS
AOS.init({
    duration: 800,
    easing: 'ease',
    once: true
});

// Mobile Menu Toggle
const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
const mainNav = document.querySelector('.main-nav');

mobileMenuToggle.addEventListener('click', function() {
    this.classList.toggle('active');
    mainNav.classList.toggle('active');
});
```

## Making Updates

### Updating Text Content

To update text content on the home page, follow these steps:

1. Open the `index.html` file in a code editor
2. Locate the section you want to update
3. Edit the text within the appropriate HTML tags
4. Save the file and test the changes

For detailed instructions on updating text content, refer to the [Updating Text Content](../common-tasks/updating-text.md) guide.

### Updating Images

To update images on the home page, follow these steps:

1. Prepare your new image with appropriate dimensions and optimization
2. Upload the image to your website's images directory
3. Open the `index.html` file in a code editor
4. Locate the image you want to update
5. Update the `src` attribute with the path to your new image
6. Save the file and test the changes

For detailed instructions on updating images, refer to the [Updating Images](../common-tasks/updating-images.md) guide.

### Adding or Removing Sections

To add a new section to the home page:

1. Decide where the new section should be placed
2. Copy the structure of a similar existing section
3. Modify the content and styling as needed
4. Add appropriate AOS attributes for animations

To remove a section from the home page:

1. Locate the section you want to remove
2. Delete the entire section's HTML code
3. Make sure you don't leave any unclosed tags or broken references

## Responsive Behavior

The home page is fully responsive and adapts to different screen sizes:

- On desktop, sections display in a multi-column layout
- On tablets, some sections adjust to a narrower layout
- On mobile, sections stack vertically and the navigation menu collapses into a hamburger menu

## Related Documentation

- [Header and Navigation](../components/header-navigation.md)
- [Footer](../components/footer.md)
- [Updating Text Content](../common-tasks/updating-text.md)
- [Updating Images](../common-tasks/updating-images.md)
