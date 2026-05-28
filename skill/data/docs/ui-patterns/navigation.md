---
source: https://supabase.com/design-system/docs/ui-patterns/navigation
scraped: 2026-05-27
section: ui-patterns
---

# Navigation UI Pattern - Supabase Design System

## Overview

The Navigation pattern helps users understand their current location and available destinations within the interface. Supabase implements a complex navigation system to accommodate multiple products and hierarchy levels.

## Components

### NavMenu

A horizontal arrangement of interconnected views within a consistent PageLayout framework. The component provides clearer page-level organization by displaying related options.

**Key characteristic:** "Activating a NavMenu item should trigger a URL change."

[Component guidelines available](../components/nav-menu)

## Page Titles

Browser page titles should follow a hierarchical structure prioritizing specificity from left to right to improve tab and browser history scannability.

**Format structure:** `Entity | Section | Surface | Project | Org | Supabase`

### Examples:
- `users | Table Editor | My Project | My Org | Supabase`
- `Backups | Database | My Project | My Org | Supabase`

## Implementation Notes (Studio)

- Utilize the shared title formatter located in `apps/studio/lib/page-title.ts`
- Use `ProjectLayout` for project-scoped pages when applicable
- Prefer a layout's explicit `title` property when available
- Apply `browserTitle.section` when rendering `ProjectLayout` directly
- Use `browserTitle.entity` for the most granular resource (table/function/query)
- Designate `product` as the authoritative reference for the project-level surface segment
- Avoid manually assembling `document.title` within individual pages or layouts
