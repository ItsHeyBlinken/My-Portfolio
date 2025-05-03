# Gallery Update Instructions

This document provides step-by-step instructions on how to update and change photos in the gallery section of the Stress Free Events and Weddings website.

## Table of Contents

1. [Understanding the Gallery Structure](#understanding-the-gallery-structure)
2. [Updating Main Gallery Page Photos](#updating-main-gallery-page-photos)
3. [Updating Individual Gallery Page Photos](#updating-individual-gallery-page-photos)
4. [Image Size Recommendations](#image-size-recommendations)
5. [Adding New Gallery Categories](#adding-new-gallery-categories)

## Understanding the Gallery Structure

The website has a two-level gallery structure:

1. **Main Gallery Page** (`gallery.html`): Shows category cards that link to individual gallery pages
2. **Individual Gallery Pages**: Separate pages for each category with a slider/carousel
   - `gallery-ceremony.html`: Wedding ceremonies gallery
   - `gallery-reception.html`: Wedding receptions gallery
   - `gallery-decor.html`: Wedding decor gallery
   - `gallery-details.html`: Wedding details gallery

## Updating Main Gallery Page Photos

To update the thumbnail images on the main gallery page:

1. Open the `gallery.html` file in a code editor
2. Locate the gallery card section you want to update (look for `<!-- Gallery Item # -->` comments)
3. Find the `<img>` tag within the card
4. Replace the `src` attribute with the URL of your new image

Example:

```html
<!-- Original -->
<img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Wedding Ceremony">

<!-- Updated -->
<img src="path/to/your/new-image.jpg" alt="Wedding Ceremony">
```

**Note**: For best results, maintain the same aspect ratio as the original images. The recommended size for thumbnail images is 600px width.

## Updating Individual Gallery Page Photos

To update the photos in the individual gallery pages (with the slider):

1. Open the specific gallery page file (e.g., `gallery-ceremony.html`)
2. Locate the slider section (look for `<!-- Main Swiper -->`)
3. Find the slide you want to update (look for `<!-- Slide # -->` comments)
4. Update both the main image and the thumbnail image:

### Main Image Update

```html
<!-- Original -->
<div class="swiper-slide">
    <div class="gallery-slide">
        <img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1600&q=80" alt="Wedding Ceremony">
        <div class="gallery-slide-info">
            <h3>Elegant Outdoor Ceremony</h3>
            <p>A beautiful garden wedding ceremony with stunning floral arrangements</p>
        </div>
    </div>
</div>

<!-- Updated -->
<div class="swiper-slide">
    <div class="gallery-slide">
        <img src="path/to/your/new-image.jpg" alt="Wedding Ceremony">
        <div class="gallery-slide-info">
            <h3>Your New Title</h3>
            <p>Your new description</p>
        </div>
    </div>
</div>
```

### Thumbnail Image Update

Don't forget to also update the corresponding thumbnail in the thumbnail slider section:

```html
<!-- Original -->
<div class="swiper-slide">
    <img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=300&q=80" alt="Wedding Ceremony Thumbnail">
</div>

<!-- Updated -->
<div class="swiper-slide">
    <img src="path/to/your/new-image-thumbnail.jpg" alt="Wedding Ceremony Thumbnail">
</div>
```

## Adding a New Slide

To add a new slide to an individual gallery page:

1. Locate the `swiper-wrapper` section in the main slider
2. Copy an existing slide structure
3. Paste it where you want the new slide to appear
4. Update the image source, title, and description
5. Add a corresponding thumbnail in the thumbnail slider section

Example of adding a new slide:

```html
<!-- Add this after an existing slide -->
<div class="swiper-slide">
    <div class="gallery-slide">
        <img src="path/to/your/new-image.jpg" alt="New Wedding Photo">
        <div class="gallery-slide-info">
            <h3>Your New Photo Title</h3>
            <p>Description of your new photo</p>
        </div>
    </div>
</div>
```

And add the corresponding thumbnail:

```html
<!-- Add this in the thumbnail-swiper section -->
<div class="swiper-slide">
    <img src="path/to/your/new-image-thumbnail.jpg" alt="New Wedding Photo Thumbnail">
</div>
```

## Image Size Recommendations

For optimal performance and appearance:

1. **Main Gallery Thumbnails**:
   - Width: 600px
   - Height: Maintain aspect ratio (approximately 400px for 3:2 ratio)
   - Format: JPG or WebP
   - Quality: 80% (good balance between quality and file size)

2. **Slider Main Images**:
   - Width: 1600px
   - Height: Maintain aspect ratio (approximately 1067px for 3:2 ratio)
   - Format: JPG or WebP
   - Quality: 80%

3. **Slider Thumbnails**:
   - Width: 300px
   - Height: Maintain aspect ratio
   - Format: JPG or WebP
   - Quality: 80%

4. **Hero Background Images**:
   - Width: 1920px
   - Height: Approximately 1080px
   - Format: JPG or WebP
   - Quality: 80%

## Adding New Gallery Categories

To add a completely new gallery category:

1. Create a new HTML file (e.g., `gallery-newcategory.html`) by copying one of the existing gallery pages
2. Update the page title, meta description, and hero section content
3. Update the active category in the navigation
4. Replace all the images, titles, and descriptions
5. Add a new card to the main gallery page (`gallery.html`) that links to your new category page

Example of adding a new category card to the main gallery page:

```html
<!-- New Gallery Item -->
<div class="gallery-card" data-category="newcategory" data-aos="fade-up" data-aos-delay="700">
    <a href="gallery-newcategory.html">
        <div class="card-image">
            <img src="path/to/your/new-category-image.jpg" alt="New Category">
            <div class="card-overlay">
                <span class="view-btn"><i class="fas fa-images"></i> View Gallery</span>
            </div>
        </div>
        <div class="card-info">
            <h3>New Category Name</h3>
            <span class="card-category">New Category</span>
        </div>
    </a>
</div>
```

Also, update the category tabs in the main gallery page and all individual gallery pages to include your new category:

```html
<div class="category-tabs">
    <button class="category-tab active" data-filter="all">All Photos</button>
    <button class="category-tab" data-filter="ceremony">Ceremonies</button>
    <button class="category-tab" data-filter="reception">Receptions</button>
    <button class="category-tab" data-filter="decor">Decor</button>
    <button class="category-tab" data-filter="details">Details</button>
    <button class="category-tab" data-filter="newcategory">New Category</button>
</div>
```

## Using Your Own Images Instead of Unsplash

If you want to use your own images instead of Unsplash links:

1. Create an `images` folder in your website directory if it doesn't exist already
2. Create a subfolder for gallery images (e.g., `images/gallery`)
3. Upload your images to this folder
4. Update the image paths in the HTML files to point to your local images

Example:

```html
<!-- From Unsplash -->
<img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Wedding Ceremony">

<!-- To local image -->
<img src="images/gallery/ceremony-1.jpg" alt="Wedding Ceremony">
```

---

For any additional help or questions about updating the gallery, please contact your web developer.
