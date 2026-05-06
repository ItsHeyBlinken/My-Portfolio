# System Patterns

## Architecture
Static frontend at the repo root + Node/Express backend in `backend/`.

```
+-----------------+        +-----------------------+        +----------------+
|  Static site    |  -->   |  Express API          |  -->   |  PostgreSQL    |
|  index.html     |  HTTP  |  routes/auth, posts,  |        |  blog_posts,   |
|  blog.html      |        |  comments             |        |  comments      |
|  styles.css     |        |  JWT-protected admin  |        |                |
+-----------------+        +-----------------------+        +----------------+
```

## Layout note (sticky chrome)
- Apply `position: sticky` and high `z-index` only to the **primary** nav
  (`body > header` with `#navbar`), not to every `<header>`. In-page section
  headers (`section-header`, `projects-header`) must remain in normal flow.

## Frontend conventions
- Single shared stylesheet at the repo root: `styles.css`.
- Theme is controlled by `data-theme="dark" | "light"` on `<html>`, persisted
  in `localStorage` under the key `portfolio-theme`.
- Fonts are loaded from Google Fonts (`Inter`, `Poppins`).
- JavaScript is currently inline at the bottom of each page; theme handling and
  blog interaction live there. Treat these scripts as the source of truth for
  behavior; the refresh should not change their public contract (IDs/classes
  they depend on).

## Design system (post-refresh target)
CSS custom properties group into these tokens, defined in `:root` and
overridden under `[data-theme="light"]`:

- Color: surface, surface-muted, surface-raised, text, text-muted, accent,
  accent-strong, border, border-strong, focus.
- Typography: display font (Poppins), text font (Inter), sizes from `xs` to
  `5xl`, line-heights for tight/normal/relaxed.
- Spacing scale: `1`..`16` mapping to a 4-px grid.
- Radius: `sm`, `md`, `lg`, `pill`.
- Shadow: `sm`, `md`, `lg`.
- Motion: `fast`, `base`, `slow` durations and a shared easing curve.

These tokens must be the only knobs used by component styles -- no ad-hoc
hex codes inside individual sections.

## Naming
Use short, intent-led class names (e.g. `hero`, `proof-strip`, `project-card`,
`blog-list`, `post-card`, `tag`). Avoid IDs for styling new elements; reserve
IDs for elements the existing JavaScript queries by ID (e.g. `#navbar`,
`#theme-toggle`, `#blog-posts-container`, `#admin-login-form`).

## Blog page contract (must remain intact)
The inline JS in `blog.html` depends on these hooks:

- `#admin-login-form`, `#admin-login-nav`, `#admin-panel-nav`
- `#new-post-btn`, `#edit-mode-btn`, `#manage-comments-btn`, `#logout-btn`
- `#new-post-form`, `#blog-form`, `#post-title`, `#post-content`, `#post-tags`,
  `#cancel-post`
- `#edit-post-form`, `#edit-blog-form`, `#edit-post-id`, `#edit-post-title`,
  `#edit-post-content`, `#edit-post-tags`, `#cancel-edit-post`
- `#comment-management-panel`, `#comments-list`, `.filter-btn[data-filter]`,
  `#close-comment-panel`
- `#month-filter`, `#blog-posts-container`
- `#theme-toggle`, `.theme-icon`

Refresh work may restyle these elements but must not rename or remove them.

## Accessibility expectations
- Provide a visible focus ring on interactive elements.
- Maintain WCAG AA contrast in both themes.
- Honor `prefers-reduced-motion` for entrance/hover animations.
- Use semantic landmarks (`header`, `nav`, `main`, `section`, `article`,
  `footer`) and proper heading order.
