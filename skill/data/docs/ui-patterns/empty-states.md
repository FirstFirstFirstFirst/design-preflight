---
source: https://supabase.com/design-system/docs/ui-patterns/empty-states
scraped: 2026-05-27
section: ui-patterns
---

# Empty States - Supabase Design System

## Overview

Empty states communicate the absence of data and guide users toward appropriate next actions. The pattern addresses scenarios where lists, tables, or content areas have no data to display.

## Best Practices

### No Data Scenarios

Two primary situations require empty state handling:

**Initial State** — Users haven't created data yet. Presentation depends on context and data type.

- *Presentational approach*: Use the Empty State Presentational component with "lightweight feature education." Example: "Create a vector bucket" emphasizes user action rather than absence.
- *Informational approach*: Match the list's normal presentation. Suits data-heavy contexts without onboarding value.

**Zero Results** — Searches or filters yield no matches. Maintain visual consistency with the populated state for "seamless" transitions.

### Implementation by Container Type

**Tables** — Display a single row with dampened header text color. Remove hover effects to reinforce that no actionable data exists. Include explanatory text: "No results found" with supporting context.

**Data Grids** — Full-height/width containers warrant prominent empty states with illustrations, titles, descriptions, and icons. Examples include the Users dashboard and Cron Jobs interface.

**Missing Routes** — Centered Admonition components address accidental navigation to non-existent resources (e.g., deleted storage buckets). Include a navigation action to redirect users.

## Component Guidance

The Empty State Presentational component from `ui-patterns` standardizes presentational scenarios with icon, title, description, and action button support. Custom components remain appropriate for zero-results and missing-route contexts due to "contextual" variation.

## Code Examples

Presentational empty states use active language. Informational approaches preserve table structure. Data grid implementations leverage `noRowsFallback` renderers. Missing-route patterns employ centered Admonition layouts with return navigation.
