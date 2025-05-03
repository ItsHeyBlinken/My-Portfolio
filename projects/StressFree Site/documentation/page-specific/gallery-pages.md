# Gallery Pages Documentation

This document provides detailed information about the gallery pages of the Stress Free Events and Weddings website, including their structure, components, and how to make updates.

## Overview

The gallery section consists of five pages:

1. **Main Gallery Page** (`gallery.html`) - Shows category cards that link to individual gallery pages
2. **Individual Gallery Pages**:
   - `gallery-ceremony.html` - Wedding ceremonies gallery
   - `gallery-reception.html` - Wedding receptions gallery
   - `gallery-decor.html` - Wedding decor gallery
   - `gallery-details.html` - Wedding details gallery

## Main Gallery Page (`gallery.html`)

### Page Structure

The main gallery page includes:

1. **Header** - Standard site header
2. **Gallery Hero Section** - Large banner with title and description
3. **Gallery Categories Section** - Filter tabs and gallery cards
4. **Testimonials Section** - Client testimonials
5. **CTA Section** - Call-to-action
6. **Footer** - Standard site footer

### Key Components

#### Gallery Hero Section

```html
<section class="gallery-hero">
    <div class="gallery-hero-content" data-aos="fade-up">
        <h1>Our Wedding Gallery</h1>
        <p class="lead">Browse through our beautiful collection of wedding photos</p>
    </div>
</section>
```

#### Gallery Categories Section

```html
<section class="gallery-section">
    <div class="container">
        <div class="section-header text-center" data-aos="fade-up">
            <h2>Wedding Photo Gallery</h2>
            <p>Browse our collection of beautiful wedding moments</p>
        </div>

        <div class="gallery-categories" data-aos="fade-up">
            <div class="category-tabs">
                <button class="category-tab active" data-filter="all">All Photos</button>
                <button class="category-tab" data-filter="ceremony">Ceremonies</button>
                <button class="category-tab" data-filter="reception">Receptions</button>
                <button class="category-tab" data-filter="decor">Decor</button>
                <button class="category-tab" data-filter="details">Details</button>
            </div>
        </div>

        <div class="modern-gallery" id="gallery">
            <!-- Gallery cards go here -->
        </div>
    </div>
</section>
```

#### Gallery Card

```html
<div class="gallery-card" data-category="ceremony" data-aos="fade-up" data-aos-delay="100">
    <a href="gallery-ceremony.html">
        <div class="card-image">
            <img src="path/to/image.jpg" alt="Wedding Ceremony">
            <div class="card-overlay">
                <span class="view-btn"><i class="fas fa-images"></i> View Gallery</span>
            </div>
        </div>
        <div class="card-info">
            <h3>Wedding Ceremonies</h3>
            <span class="card-category">Ceremony</span>
        </div>
    </a>
</div>
```

## Individual Gallery Pages

### Page Structure

Each individual gallery page includes:

1. **Header** - Standard site header
2. **Gallery Hero Section** - Large banner with category title
3. **Gallery Detail Section** - Category navigation and image slider
4. **CTA Section** - Call-to-action
5. **Footer** - Standard site footer

### Key Components

#### Gallery Hero Section

```html
<section class="gallery-hero">
    <div class="gallery-hero-content" data-aos="fade-up">
        <h1>Wedding Ceremonies</h1>
        <p class="lead">Browse through our beautiful collection of wedding ceremonies</p>
    </div>
</section>
```

#### Gallery Categories Navigation

```html
<div class="gallery-categories-nav" data-aos="fade-up">
    <a href="gallery-ceremony.html" class="category-link active">Ceremonies</a>
    <a href="gallery-reception.html" class="category-link">Receptions</a>
    <a href="gallery-decor.html" class="category-link">Decor</a>
    <a href="gallery-details.html" class="category-link">Details</a>
</div>
```

#### Gallery Slider

```html
<div class="gallery-slider-container" data-aos="fade-up">
    <!-- Main Swiper -->
    <div class="swiper main-swiper">
        <div class="swiper-wrapper">
            <!-- Slides go here -->
        </div>
        <!-- Navigation buttons -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <!-- Pagination -->
        <div class="swiper-pagination"></div>
    </div>
</div>
```

#### Gallery Slide

```html
<div class="swiper-slide">
    <div class="gallery-slide">
        <img src="path/to/image.jpg" alt="Wedding Ceremony">
        <div class="gallery-slide-info">
            <h3>Elegant Outdoor Ceremony</h3>
            <p>A beautiful garden wedding ceremony with stunning floral arrangements</p>
        </div>
    </div>
</div>
```

#### Thumbnails

```html
<div class="gallery-thumbnails" data-aos="fade-up">
    <div class="swiper thumbnail-swiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="path/to/thumbnail.jpg" alt="Wedding Ceremony Thumbnail">
            </div>
            <!-- More thumbnails -->
        </div>
    </div>
</div>
```

## JavaScript Functionality

The gallery pages use the following JavaScript functionality:

### Main Gallery Page

```javascript
// Gallery Filter
const filterButtons = document.querySelectorAll('.category-tab');
const galleryItems = document.querySelectorAll('.gallery-card');

filterButtons.forEach(button => {
    button.addEventListener('click', function() {
        // Remove active class from all buttons
        filterButtons.forEach(btn => btn.classList.remove('active'));

        // Add active class to clicked button
        this.classList.add('active');

        // Get filter value
        const filterValue = this.getAttribute('data-filter');

        // Filter gallery items
        galleryItems.forEach(item => {
            if (filterValue === 'all' || item.getAttribute('data-category') === filterValue) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    });
});
```

### Individual Gallery Pages

```javascript
// Initialize Swiper
const thumbsSwiper = new Swiper('.thumbnail-swiper', {
    spaceBetween: 10,
    slidesPerView: 4,
    freeMode: true,
    watchSlidesProgress: true,
    breakpoints: {
        320: {
            slidesPerView: 3,
        },
        576: {
            slidesPerView: 4,
        },
        768: {
            slidesPerView: 5,
        },
        992: {
            slidesPerView: 6,
        }
    }
});

const mainSwiper = new Swiper('.main-swiper', {
    spaceBetween: 10,
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    thumbs: {
        swiper: thumbsSwiper,
    },
    effect: 'fade',
    fadeEffect: {
        crossFade: true
    },
    autoplay: {
        delay: 5000,
        disableOnInteraction: false,
    },
});
```

## Making Updates

### Updating Gallery Categories

To add a new gallery category:

1. Create a new HTML file (e.g., `gallery-newcategory.html`) by copying one of the existing gallery pages
2. Update the page title, meta description, and hero section content
3. Update the active category in the navigation
4. Replace all the images, titles, and descriptions
5. Add a new card to the main gallery page (`gallery.html`) that links to your new category page
6. Update the category tabs in all gallery pages to include the new category

### Updating Gallery Images

For detailed instructions on updating gallery images, refer to the [Gallery System](../components/gallery-system.md) documentation.

## Responsive Behavior

The gallery pages are fully responsive:

- On desktop, the gallery cards display in a 3-4 column grid
- On tablets, they display in a 2-3 column grid
- On mobile, they display in a single column

The gallery sliders adjust their height based on the screen size, and the thumbnail navigation becomes scrollable on smaller screens.

## Related Documentation

- [Gallery System Component](../components/gallery-system.md)
- [Updating Images](../common-tasks/updating-images.md)
