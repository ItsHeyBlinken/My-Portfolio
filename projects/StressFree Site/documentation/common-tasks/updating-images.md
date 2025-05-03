# Updating Images

This document provides step-by-step instructions for updating images on the Stress Free Events and Weddings website.

## Table of Contents

1. [Image Preparation](#image-preparation)
2. [Updating Hero Images](#updating-hero-images)
3. [Updating Content Images](#updating-content-images)
4. [Updating Gallery Images](#updating-gallery-images)
5. [Updating Team Member Photos](#updating-team-member-photos)
6. [Updating Logo](#updating-logo)
7. [Image Optimization Tips](#image-optimization-tips)

## Image Preparation

Before adding images to the website, prepare them properly:

1. **Choose high-quality images** that represent your brand well
2. **Resize images** to the appropriate dimensions (see recommendations below)
3. **Compress images** to reduce file size without sacrificing quality
4. **Use descriptive filenames** (e.g., `outdoor-wedding-ceremony.jpg` instead of `IMG_1234.jpg`)
5. **Prepare different sizes** for responsive design if needed

### Recommended Image Dimensions

| Image Type | Recommended Width | Recommended Height | Notes |
|------------|------------------|-------------------|-------|
| Hero Images | 1920px | 1080px | 16:9 aspect ratio |
| Content Images | 800px-1200px | Varies | Maintain aspect ratio |
| Gallery Thumbnails | 600px | 400px | 3:2 aspect ratio |
| Gallery Full Size | 1600px | 1067px | 3:2 aspect ratio |
| Team Photos | 400px | 400px | 1:1 aspect ratio (square) |
| Logo | 200px | Varies | Maintain aspect ratio |

## Updating Hero Images

Hero images are the large banner images at the top of each page.

### Steps:

1. Prepare your new hero image (1920px × 1080px recommended)
2. Upload the image to your website's images directory (e.g., `images/hero/`)
3. Open the HTML file for the page you want to update
4. Locate the hero section CSS in the `<style>` tag or in the CSS file
5. Update the `background-image` property with the path to your new image

### Example:

```html
<!-- Original -->
<style>
    .hero-section {
        background-image: url('images/hero/wedding-hero.jpg');
    }
</style>

<!-- Updated -->
<style>
    .hero-section {
        background-image: url('images/hero/new-wedding-hero.jpg');
    }
</style>
```

Or in the CSS file:

```css
/* Original */
.hero-section {
    background-image: url('../images/hero/wedding-hero.jpg');
}

/* Updated */
.hero-section {
    background-image: url('../images/hero/new-wedding-hero.jpg');
}
```

## Updating Content Images

Content images are the images used within the content sections of the pages.

### Steps:

1. Prepare your new content image (800px-1200px width recommended)
2. Upload the image to your website's images directory (e.g., `images/content/`)
3. Open the HTML file for the page you want to update
4. Locate the `<img>` tag for the image you want to replace
5. Update the `src` attribute with the path to your new image
6. Update the `alt` attribute with a descriptive text for the new image

### Example:

```html
<!-- Original -->
<img src="images/content/wedding-planning.jpg" alt="Wedding Planning Session" class="content-image">

<!-- Updated -->
<img src="images/content/new-wedding-planning.jpg" alt="Couple Meeting with Wedding Planner" class="content-image">
```

## Updating Gallery Images

For detailed instructions on updating gallery images, refer to the [Gallery System](../components/gallery-system.md) documentation.

### Quick Steps for Main Gallery Page:

1. Prepare your new gallery thumbnail image (600px width recommended)
2. Upload the image to your website's images directory (e.g., `images/gallery/`)
3. Open the `gallery.html` file
4. Locate the gallery card you want to update
5. Update the `src` attribute of the `<img>` tag with the path to your new image

### Example:

```html
<!-- Original -->
<img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Wedding Ceremony">

<!-- Updated -->
<img src="images/gallery/ceremony-thumbnail.jpg" alt="Wedding Ceremony">
```

### Quick Steps for Individual Gallery Pages:

1. Prepare your new gallery image (1600px width recommended) and thumbnail (300px width recommended)
2. Upload the images to your website's images directory (e.g., `images/gallery/`)
3. Open the gallery page file (e.g., `gallery-ceremony.html`)
4. Locate the slide you want to update
5. Update the `src` attributes of the main image and the corresponding thumbnail

### Example:

```html
<!-- Original Main Image -->
<div class="swiper-slide">
    <div class="gallery-slide">
        <img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1600&q=80" alt="Wedding Ceremony">
        <div class="gallery-slide-info">
            <h3>Elegant Outdoor Ceremony</h3>
            <p>A beautiful garden wedding ceremony with stunning floral arrangements</p>
        </div>
    </div>
</div>

<!-- Updated Main Image -->
<div class="swiper-slide">
    <div class="gallery-slide">
        <img src="images/gallery/ceremony-1.jpg" alt="Wedding Ceremony">
        <div class="gallery-slide-info">
            <h3>Elegant Outdoor Ceremony</h3>
            <p>A beautiful garden wedding ceremony with stunning floral arrangements</p>
        </div>
    </div>
</div>

<!-- Original Thumbnail -->
<div class="swiper-slide">
    <img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=300&q=80" alt="Wedding Ceremony Thumbnail">
</div>

<!-- Updated Thumbnail -->
<div class="swiper-slide">
    <img src="images/gallery/ceremony-1-thumb.jpg" alt="Wedding Ceremony Thumbnail">
</div>
```

## Updating Team Member Photos

Team member photos are used on the About page.

### Steps:

1. Prepare your new team member photo (400px × 400px square recommended)
2. Upload the image to your website's images directory (e.g., `images/team/`)
3. Open the `about.html` file
4. Locate the team member section
5. Update the `src` attribute of the `<img>` tag with the path to your new image

### Example:

```html
<!-- Original -->
<div class="team-member" data-aos="fade-up">
    <div class="team-member-image">
        <img src="images/team/jane-doe.jpg" alt="Jane Doe - Wedding Planner">
    </div>
    <div class="team-member-info">
        <h3>Jane Doe</h3>
        <p class="team-member-role">Wedding Planner</p>
        <p>Jane has over 10 years of experience planning beautiful weddings...</p>
    </div>
</div>

<!-- Updated -->
<div class="team-member" data-aos="fade-up">
    <div class="team-member-image">
        <img src="images/team/jane-smith.jpg" alt="Jane Smith - Wedding Planner">
    </div>
    <div class="team-member-info">
        <h3>Jane Smith</h3>
        <p class="team-member-role">Wedding Planner</p>
        <p>Jane has over 10 years of experience planning beautiful weddings...</p>
    </div>
</div>
```

## Updating Logo

The logo appears in the header and footer of all pages.

### Steps:

1. Prepare your new logo (200px width recommended, with transparent background)
2. Upload the logo to your website's assets directory (e.g., `Current Docs/Assets/`)
3. Open all HTML files or the header and footer component files
4. Locate the logo `<img>` tags in the header and footer
5. Update the `src` attribute with the path to your new logo

### Example:

```html
<!-- Original Header Logo -->
<div class="logo-container">
    <a href="index.html"><img src="./Current Docs/Assets/newlogo.png" alt="Stress Free Logo" class="logo"></a>
</div>

<!-- Updated Header Logo -->
<div class="logo-container">
    <a href="index.html"><img src="./Current Docs/Assets/updated-logo.png" alt="Stress Free Logo" class="logo"></a>
</div>

<!-- Original Footer Logo -->
<div class="footer-logo">
    <img src="./Current Docs/Assets/newlogo.png" alt="Stress Free Logo" class="logo">
    <p>Making your special day truly stress-free</p>
</div>

<!-- Updated Footer Logo -->
<div class="footer-logo">
    <img src="./Current Docs/Assets/updated-logo.png" alt="Stress Free Logo" class="logo">
    <p>Making your special day truly stress-free</p>
</div>
```

## Image Optimization Tips

To ensure fast loading times and good user experience:

1. **Use appropriate file formats**:
   - JPG: For photographs and complex images with many colors
   - PNG: For images that need transparency
   - SVG: For logos and icons that need to scale
   - WebP: Modern format with better compression (use with fallbacks)

2. **Compress images**:
   - Use tools like [TinyPNG](https://tinypng.com/), [Squoosh](https://squoosh.app/), or [ImageOptim](https://imageoptim.com/)
   - Aim for a balance between quality and file size
   - For web images, a quality setting of 70-80% is usually sufficient

3. **Use responsive images**:
   - Consider using the `srcset` attribute for responsive images
   - Provide multiple sizes for different screen resolutions

4. **Lazy loading**:
   - Add the `loading="lazy"` attribute to images that are below the fold
   - This delays loading images until they are about to be viewed

5. **Descriptive alt text**:
   - Always include descriptive alt text for accessibility
   - Describe the content and purpose of the image

### Example of Responsive Images:

```html
<img src="images/gallery/ceremony-small.jpg" 
     srcset="images/gallery/ceremony-small.jpg 600w,
             images/gallery/ceremony-medium.jpg 1200w,
             images/gallery/ceremony-large.jpg 1800w"
     sizes="(max-width: 600px) 100vw, (max-width: 1200px) 50vw, 33vw"
     alt="Wedding Ceremony"
     loading="lazy">
```

## Related Documentation

- [Gallery System](../components/gallery-system.md)
- [Adding New Pages](adding-pages.md)
