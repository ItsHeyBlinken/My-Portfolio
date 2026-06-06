# Progress Log

Append-only running log of completed tasks and significant decisions.

## 2026-05-05 -- Portfolio refresh kickoff
- Confirmed approved direction with the user:
  - Tone: professional and editorial.
  - Scope: full presentation refresh (visuals, layout, copy, project cards,
    blog landing) without changing the static stack or the blog API behavior.
  - Primary goal: portfolio first, blog as supporting proof.
  - Approach: editorial refresh (recommended option B).
- Initialized the Memory Bank with `projectbrief.md`, `productContext.md`,
  `activeContext.md`, `systemPatterns.md`, `techContext.md`, and this
  `progress.md`.
- Captured the contract of inline JS hooks in `blog.html` so the refresh can
  restyle without breaking admin/comments/month-filter behavior.

## 2026-05-05 -- Design system consolidation
- Rewrote `styles.css` around a single token system: color/typography/space/
  radius/shadow/motion variables defined under `:root` with light overrides
  under `[data-theme="light"]`.
- Removed duplicated and overlapping rules for project tiles, blog posts,
  archive controls, buttons, and admin controls. Kept all selectors that the
  inline JS depends on.
- Added utility-style primitives (container, section, eyebrow, button) shared
  across the homepage and the blog page.

## 2026-05-05 -- Homepage repositioning
- Restructured `index.html` around an editorial hero, proof strip, featured
  projects, capability-cluster skills, recent writing teaser, and contact
  footer.
- Replaced the percent-bar skills with grouped capability/tooling clusters.
- Kept the existing nav anchors and theme toggle behavior.

## 2026-05-05 -- Blog presentation refresh
- Restyled `blog.html` public reading surface with a calmer header, a single
  archive control row, and post cards that prioritize legibility.
- Visually separated admin login/panel and comment management from the
  public reader experience without changing any IDs or class hooks the
  inline JS depends on.

## 2026-05-05 -- Verification pass
- Cross-checked responsive breakpoints, semantic landmarks, focus visibility,
  and `prefers-reduced-motion` behavior.
- Confirmed the inline JS contracts in `index.html` and `blog.html` still
  work against the new markup and styling.

## 2026-05-05 -- Section intro / content overlap (sticky header scope)
- Root cause: `header { position: sticky; z-index: 1000; }` applied to every
  `<header>`, including in-page `section-header` / `projects-header` blocks,
  so section intros stacked above the following content.
- Fix: scope sticky + z-index to primary nav only via `body > header` in
  `styles.css`.

## 2026-06-06 -- Projects archive page
- Created `projects.html` with three sections: Live & Hosted (8), In Development
  (7), and Demos & Experiments (6).
- Content sourced from `LIVE-HOSTED-PROJECTS.md` and `LOCAL-DEV-Projects.md`.
- In-development cards link to GitHub profile (`ItsHeyBlinken`) for source code.
- Added category filter bar (All / Live / In Development / Demos) with JS.
- Added CSS for projects page layout, placeholder media, dev/prelaunch status
  badges, and GitHub link styling.
- Reduced homepage `#projects` to 3 featured cards (Online Card Show, Planner
  CRM, Dress Sizing App) with "View all projects" CTA.
- Updated nav links in `index.html` and `blog.html` to point to `projects.html`.
