# Styling Guide

This document provides information about the styling of the Stress Free Events and Weddings website, including the color scheme, typography, CSS variables, and responsive design principles.

## Table of Contents

1. [Color Scheme](#color-scheme)
2. [Typography](#typography)
3. [CSS Variables](#css-variables)
4. [Spacing and Layout](#spacing-and-layout)
5. [Responsive Design](#responsive-design)
6. [Animation and Transitions](#animation-and-transitions)
7. [Component Styling](#component-styling)

## Color Scheme

The website uses a soft, elegant color palette that conveys a sense of romance, sophistication, and tranquility.

### Primary Colors

- **Primary Color**: `#d8b4e2` (Soft Lavender)
- **Secondary Color**: `#f5e1da` (Soft Peach)
- **Accent Color**: `#b8d8be` (Soft Sage Green)

### Neutral Colors

- **White**: `#ffffff`
- **Light Background**: `#f9f9f9`
- **Text Color**: `#333333`
- **Dark Background**: `#2c2c2c`

### Functional Colors

- **Success**: `#4caf50` (Green)
- **Error**: `#f44336` (Red)
- **Warning**: `#ff9800` (Orange)
- **Info**: `#2196f3` (Blue)

## Typography

The website uses a combination of serif and sans-serif fonts to create an elegant and readable design.

### Font Families

- **Headings**: 'Playfair Display', serif
- **Body Text**: 'Montserrat', sans-serif
- **Accent Text**: 'Cormorant Garamond', serif

### Font Sizes

- **Base Font Size**: 16px
- **H1**: 2.5rem (40px)
- **H2**: 2rem (32px)
- **H3**: 1.5rem (24px)
- **H4**: 1.25rem (20px)
- **Small Text**: 0.875rem (14px)

### Font Weights

- **Regular**: 400
- **Medium**: 500
- **Semi-Bold**: 600
- **Bold**: 700

### Line Heights

- **Headings**: 1.2
- **Body Text**: 1.6
- **Buttons and Links**: 1.4

## CSS Variables

The website uses CSS variables (custom properties) to maintain consistent styling throughout the site. These variables are defined in the `:root` selector in the `styles.css` file.

```css
:root {
    /* Colors */
    --primary-color: #d8b4e2;
    --secondary-color: #f5e1da;
    --accent-color: #b8d8be;
    --white: #ffffff;
    --light-bg: #f9f9f9;
    --text-color: #333333;
    --dark-bg: #2c2c2c;
    
    /* Typography */
    --heading-font: 'Playfair Display', serif;
    --body-font: 'Montserrat', sans-serif;
    --accent-font: 'Cormorant Garamond', serif;
    
    /* Spacing */
    --spacing-xs: 0.5rem;
    --spacing-sm: 1rem;
    --spacing-md: 2rem;
    --spacing-lg: 4rem;
    --spacing-xl: 8rem;
    
    /* Other */
    --border-radius: 8px;
    --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    --transition: all 0.3s ease;
}
```

### Using CSS Variables

To use these variables in your CSS:

```css
.element {
    color: var(--primary-color);
    font-family: var(--heading-font);
    margin-bottom: var(--spacing-md);
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
    transition: var(--transition);
}
```

## Spacing and Layout

The website uses a consistent spacing system to maintain visual harmony.

### Spacing Variables

- **Extra Small**: `--spacing-xs` (0.5rem / 8px)
- **Small**: `--spacing-sm` (1rem / 16px)
- **Medium**: `--spacing-md` (2rem / 32px)
- **Large**: `--spacing-lg` (4rem / 64px)
- **Extra Large**: `--spacing-xl` (8rem / 128px)

### Container

The website uses a container class to maintain consistent width and padding:

```css
.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 var(--spacing-sm);
}
```

### Grid System

The website uses CSS Grid and Flexbox for layout:

```css
/* Example of a grid layout */
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: var(--spacing-md);
}

/* Example of a flex layout */
.flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
}
```

## Responsive Design

The website is fully responsive and adapts to different screen sizes using media queries.

### Breakpoints

- **Mobile**: Below 576px
- **Tablet**: 576px to 991px
- **Desktop**: 992px and above

### Media Queries

```css
/* Mobile styles */
@media (max-width: 575px) {
    /* Mobile-specific styles */
}

/* Tablet styles */
@media (min-width: 576px) and (max-width: 991px) {
    /* Tablet-specific styles */
}

/* Desktop styles */
@media (min-width: 992px) {
    /* Desktop-specific styles */
}
```

### Responsive Typography

Font sizes adjust based on screen size:

```css
/* Base font size */
html {
    font-size: 16px;
}

/* Smaller font size on mobile */
@media (max-width: 575px) {
    html {
        font-size: 14px;
    }
}

/* Larger font size on large screens */
@media (min-width: 1400px) {
    html {
        font-size: 18px;
    }
}
```

## Animation and Transitions

The website uses subtle animations and transitions to enhance the user experience.

### Transitions

All interactive elements have smooth transitions:

```css
.button,
.nav-link,
.card {
    transition: var(--transition);
}
```

### AOS Animations

The website uses the AOS (Animate On Scroll) library for scroll-triggered animations:

```html
<div data-aos="fade-up" data-aos-delay="100">
    <!-- Content to animate -->
</div>
```

Common AOS animations used:
- `fade-up`
- `fade-down`
- `fade-left`
- `fade-right`
- `zoom-in`
- `zoom-out`

## Component Styling

### Buttons

```css
.btn {
    display: inline-block;
    padding: 12px 30px;
    border-radius: 30px;
    font-family: var(--body-font);
    font-weight: 500;
    text-decoration: none;
    text-align: center;
    cursor: pointer;
    transition: var(--transition);
}

.btn-primary {
    background-color: var(--primary-color);
    color: var(--white);
    border: 2px solid var(--primary-color);
}

.btn-primary:hover {
    background-color: transparent;
    color: var(--primary-color);
}

.btn-light {
    background-color: var(--white);
    color: var(--primary-color);
    border: 2px solid var(--white);
}

.btn-light:hover {
    background-color: transparent;
    color: var(--white);
}
```

### Cards

```css
.card {
    background-color: var(--white);
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
    overflow: hidden;
    transition: var(--transition);
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
}

.card-image {
    width: 100%;
    height: 200px;
    overflow: hidden;
}

.card-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: var(--transition);
}

.card:hover .card-image img {
    transform: scale(1.05);
}

.card-content {
    padding: var(--spacing-md);
}

.card-title {
    margin-top: 0;
    margin-bottom: var(--spacing-xs);
    font-family: var(--heading-font);
    color: var(--text-color);
}

.card-text {
    margin-bottom: var(--spacing-sm);
    color: var(--text-color);
}
```

### Forms

```css
.form-group {
    margin-bottom: var(--spacing-md);
}

.form-label {
    display: block;
    margin-bottom: var(--spacing-xs);
    font-weight: 500;
    color: var(--text-color);
}

.form-control {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid #ddd;
    border-radius: var(--border-radius);
    font-family: var(--body-font);
    font-size: 1rem;
    transition: var(--transition);
}

.form-control:focus {
    border-color: var(--primary-color);
    outline: none;
    box-shadow: 0 0 0 3px rgba(216, 180, 226, 0.3);
}

.form-text {
    display: block;
    margin-top: var(--spacing-xs);
    font-size: 0.875rem;
    color: #666;
}
```

## Maintaining Consistent Styling

When making updates to the website, follow these guidelines to maintain consistent styling:

1. **Use CSS Variables**: Always use the defined CSS variables for colors, fonts, spacing, etc.
2. **Follow the Existing Patterns**: Match the styling of existing elements when creating new ones
3. **Responsive Design**: Ensure all new elements are responsive and work well on all screen sizes
4. **Accessibility**: Maintain good color contrast and readable font sizes
5. **Consistency**: Keep styling consistent across all pages

## Related Documentation

- [Updating Text Content](common-tasks/updating-text.md)
- [Updating Images](common-tasks/updating-images.md)
- [Component Documentation](components/README.md)
