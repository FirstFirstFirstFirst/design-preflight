---
source: https://supabase.com/design-system/docs/typography
scraped: 2026-05-27
section: getting-started
---

# Typography

## Overview

The Typography page documents CSS variables available within the Supabase Design System. Rather than creating components, typography uses reusable patterns best implemented as CSS shorthand variables due to their varied usage contexts.

## Shorthands

The system provides two primary typography shorthands:

| Shorthand | Purpose |
|-----------|---------|
| `text-code-inline` | "Apply to a `code` element for inline code or similar custom inline content" |
| `text-brand-link` | "Supabase green text that meets contrast requirements in light and dark modes" |

## Implementation Details

These shorthands are built from core Tailwind utility classes and can be viewed in the project's `typography.scss` file within the GitHub repository.

## Context

The page emphasizes that typography patterns leverage Tailwind utilities rather than serving as standalone components, allowing flexible application across different design contexts throughout the system.
