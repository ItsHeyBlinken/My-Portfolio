# Gallery System Documentation

This document provides detailed information about the gallery system used on the Stress Free Events and Weddings website, including its structure, functionality, and how to make updates.

## Overview

The gallery system consists of two main components:

1. **Main Gallery Page** with category cards
2. **Individual Gallery Pages** with image sliders

The system uses a combination of CSS Grid for the gallery layout and Swiper.js for the image sliders.

## Main Gallery Page Components

### Gallery Categories

The gallery categories are implemented as filter buttons that allow users to filter the gallery cards by category:

```html
<div class="gallery-categories" data-aos="fade-up">
    <div class="category-tabs">
        <button class="category-tab active" data-filter="all">All Photos</button>
        <button class="category-tab" data-filter="ceremony">Ceremonies</button>
        <button class="category-tab" data-filter="reception">Receptions</button>
        <button class="category-tab" data-filter="decor">Decor</button>
        <button class="category-tab" data-filter="details">Details</button>
    </div>
</div>
```

### Gallery Grid

The gallery grid is a CSS Grid layout that contains the gallery cards:

```html
<div class="modern-gallery" id="gallery">
    <!-- Gallery cards go here -->
</div>
```

### Gallery Card

Each gallery card represents a category and links to its respective gallery page:

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

## Individual Gallery Page Components

### Gallery Categories Navigation

The categories navigation allows users to switch between different gallery categories:

```html
<div class="gallery-categories-nav" data-aos="fade-up">
    <a href="gallery-ceremony.html" class="category-link active">Ceremonies</a>
    <a href="gallery-reception.html" class="category-link">Receptions</a>
    <a href="gallery-decor.html" class="category-link">Decor</a>
    <a href="gallery-details.html" class="category-link">Details</a>
</div>
```

### Main Slider

The main slider displays the large images:

```html
<div class="gallery-slider-container" data-aos="fade-up">
    <div class="swiper main-swiper">
        <div class="swiper-wrapper">
            <!-- Slides go here -->
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
</div>
```

### Thumbnail Slider

The thumbnail slider displays small thumbnails for navigation:

```html
<div class="gallery-thumbnails" data-aos="fade-up">
    <div class="swiper thumbnail-swiper">
        <div class="swiper-wrapper">
            <!-- Thumbnails go here -->
        </div>
    </div>
</div>
```

## CSS Styles

### Main Gallery Page Styles

```css
.gallery-categories {
    margin-bottom: 40px;
}

.category-tabs {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 30px;
}

.category-tab {
    background-color: transparent;
    border: none;
    color: var(--text-color);
    padding: 10px 20px;
    border-radius: 30px;
    cursor: pointer;
    transition: all 0.3s ease;
    font-weight: 500;
    position: relative;
    overflow: hidden;
    z-index: 1;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.modern-gallery {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 30px;
}

.gallery-card {
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    background-color: var(--white);
}
```

### Individual Gallery Page Styles

```css
.gallery-slider-container {
    position: relative;
    padding: 0 50px;
    margin-bottom: 50px;
}

.swiper {
    width: 100%;
    height: 600px;
}

.gallery-slide {
    width: 100%;
    height: 100%;
    position: relative;
    overflow: hidden;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.gallery-thumbnails {
    margin-top: 20px;
    padding: 0 50px;
}

.thumbnail-swiper {
    height: 100px;
}
```

## JavaScript Functionality

### Gallery Filtering

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

### Swiper Initialization

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

### Adding a New Gallery Category

1. Create a new HTML file (e.g., `gallery-newcategory.html`) by copying one of the existing gallery pages
2. Update the page title, meta description, and hero section content
3. Update the active category in the navigation
4. Replace all the images, titles, and descriptions
5. Add a new card to the main gallery page (`gallery.html`) that links to your new category page
6. Update the category tabs in all gallery pages to include the new category

### Updating Gallery Images

#### Main Gallery Page

To update a thumbnail image on the main gallery page:

```html
<!-- Original -->
<img src="https://images.unsplash.com/photo-1519741497674-611481863552?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80" alt="Wedding Ceremony">

<!-- Updated -->
<img src="path/to/your/new-image.jpg" alt="Wedding Ceremony">
```

#### Individual Gallery Pages

To update an image in the slider:

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

Don't forget to also update the corresponding thumbnail:

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

### Adding a New Slide

To add a new slide to an individual gallery page:

1. Locate the `swiper-wrapper` section in the main slider
2. Copy an existing slide structure
3. Paste it where you want the new slide to appear
4. Update the image source, title, and description
5. Add a corresponding thumbnail in the thumbnail slider section

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

## Troubleshooting

### Common Issues

1. **Images not displaying**: Check that the image paths are correct and that the images exist in the specified location.

2. **Slider not working**: Make sure that the Swiper.js library is properly loaded and that the initialization code is correct.

3. **Filtering not working**: Check that the data-category attributes on the gallery cards match the data-filter attributes on the filter buttons.

4. **Responsive issues**: Check the CSS media queries and make sure that the responsive styles are properly applied.

## Related Documentation

- [Gallery Pages](../page-specific/gallery-pages.md)
- [Updating Images](../common-tasks/updating-images.md)
