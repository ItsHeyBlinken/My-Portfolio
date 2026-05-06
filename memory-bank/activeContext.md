# Active Context

## Current focus
Implementing the approved Portfolio Design Refresh Plan
(`.cursor/plans/portfolio-refresh_a6078be9.plan.md`).

## Approved direction
- Tone: professional and editorial.
- Refresh scope: full presentation refresh (visual, layout, copy, project
  cards, blog landing) while keeping the static HTML/CSS/JS stack and the
  existing blog API/admin/comment behavior untouched.
- Primary goal: mixed -- portfolio first, with the blog as strong supporting
  proof.
- Approach: editorial refresh -- consolidate the design system, restructure
  the homepage story, reframe project cards around outcome/role/tech, and
  give the blog a cleaner reader-first layout.

## Visual thesis
Light-first editorial portfolio with generous spacing, strong typography,
restrained accents, and subtle developer cues. Dark mode remains a peer, not
an afterthought.

## Section sequence (homepage)
1. Hero -- identity, role, calls to action.
2. Proof strip -- focus areas (web, game, full-stack journey) and external
   links (GitHub, LinkedIn).
3. Featured projects -- impact-led cards (outcome, role, tech, status, link).
4. Skills -- grouped capabilities (replacing percent bars with capability
   clusters and tools).
5. Recent writing -- short blog preview that links into `blog.html`.
6. Contact / footer -- email, copyright, and footer marks.

## Active constraints
- Do not commit or push to GitHub.
- Do not run database migrations or deployment-changing actions.
- Backend (`backend/`) is untouched.
- Embedded project demos under `projects/` are not redesigned in this pass.

## Open follow-ups (after this refresh lands)
- Consider extracting inline `<script>` blocks into separate JS files for
  maintainability.
- Consider adding real Open Graph images and a favicon refresh.
- Consider an "About" section/page if Chris wants more space for narrative.
