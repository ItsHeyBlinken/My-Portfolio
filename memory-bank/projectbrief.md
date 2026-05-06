# Project Brief

## Name
BytesByBlinken Portfolio Site

## Owner
Chris Hall (BytesByBlinken)

## Purpose
A personal portfolio and developer blog that showcases Chris's work as a self-taught
software/game developer. The site serves three audiences:

1. Hiring managers and recruiters evaluating Chris for software roles.
2. Potential freelance/small-business clients evaluating site/app work.
3. Readers following Chris's developer journey through the blog.

## Scope
- Public marketing portfolio (`index.html`)
- Public developer blog with month/year archive (`blog.html`)
- Project showcase pages bundled under `projects/` (treated as embedded artifacts,
  not redesigned in this refresh).
- Node/Express + PostgreSQL backend in `backend/` powering the blog API and
  comment system. Backend behavior is preserved as-is.

## Goals
- Make the homepage clearly communicate identity, capabilities, and contact paths
  within the first screen.
- Present projects in a way that emphasizes outcome, role, and tech rather than
  generic "view project" tiles.
- Make the blog feel like a real reading surface, with admin tools visually
  separated from the public reader experience.
- Keep the static HTML/CSS/JS frontend stack, the existing blog API integration,
  and the admin/comments flows intact.

## Non-Goals (current refresh)
- Backend, database, or deployment changes.
- Adopting a frontend framework or build pipeline.
- Redesigning the embedded project demos under `projects/`.

## Source of Truth
This document is the authoritative summary of scope and goals for the portfolio
refresh. If other Memory Bank files conflict with this brief, this brief wins on
scope and goals; `activeContext.md` wins on near-term focus and decisions.
