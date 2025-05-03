# Images Directory Structure

This directory contains all the images used on the Stress Free Events and Weddings website. The images are organized into subdirectories based on their purpose and location on the website.

## Directory Structure

```
images/
├── hero/                   # Hero section images for all pages
├── about/                  # Images used on the About page
├── services/               # Images used on the Services page
├── gallery/                # Gallery images
│   ├── ceremony/           # Wedding ceremony images
│   ├── reception/          # Wedding reception images
│   ├── decor/              # Wedding decor images
│   ├── details/            # Wedding details images
│   └── thumbnails/         # Thumbnail versions of gallery images
├── blog/                   # Images used in blog posts
└── team/                   # Team member photos
```

## Image Guidelines

### File Formats

- Use **JPG** for photographs and complex images with many colors
- Use **PNG** for images that need transparency
- Use **SVG** for logos and icons that need to scale
- Consider using **WebP** for better compression (with JPG/PNG fallbacks)

### Image Sizes

| Image Type | Recommended Width | Recommended Height | Notes |
|------------|------------------|-------------------|-------|
| Hero Images | 1920px | 1080px | 16:9 aspect ratio |
| Content Images | 800px-1200px | Varies | Maintain aspect ratio |
| Gallery Thumbnails | 600px | 400px | 3:2 aspect ratio |
| Gallery Full Size | 1600px | 1067px | 3:2 aspect ratio |
| Team Photos | 400px | 400px | 1:1 aspect ratio (square) |
| Logo | 200px | Varies | Maintain aspect ratio |

### Optimization

Before adding images to the website:

1. **Compress images** to reduce file size without sacrificing quality
   - Use tools like [TinyPNG](https://tinypng.com/), [Squoosh](https://squoosh.app/), or [ImageOptim](https://imageoptim.com/)
   - Aim for a balance between quality and file size
   - For web images, a quality setting of 70-80% is usually sufficient

2. **Use descriptive filenames**
   - Use lowercase letters, numbers, and hyphens (no spaces)
   - Include descriptive keywords (e.g., `outdoor-wedding-ceremony.jpg` instead of `IMG_1234.jpg`)

3. **Include alt text in HTML**
   - Always add descriptive alt text to images in the HTML for accessibility
   - Example: `<img src="images/gallery/ceremony/outdoor-ceremony.jpg" alt="Outdoor wedding ceremony with floral arch">`

## Updating Images

For detailed instructions on updating images on the website, refer to the [Updating Images](../documentation/common-tasks/updating-images.md) documentation.
