---
source: https://supabase.com/design-system/docs/ui-patterns/layout
scraped: 2026-05-27
section: ui-patterns
---

# Supabase Design System: Layout Guide

## Core Layout Principles

The Supabase Design System provides structured page composition using reusable components. Every Studio page should follow these foundational rules:

### Page Structure Hierarchy

1. **Breadcrumbs first** — Every page starts with `PageBreadcrumbs` as a bordered row at the top, positioned as a sibling above other content rather than nested within it.

2. **Sub-navigation positioning** — When pages include tabs or section links, `PageNav` sits directly beneath breadcrumbs, aligned to the top left as a sibling element.

3. **Parent page compactness** — Parent pages with child navigation omit `PageHeader` entirely. Child routes render their own `PageHeader` with metadata instead.

4. **Width selection by content** — Container sizes are chosen based on content requirements, not page type:
   - `small`: Settings, forms, focused configuration
   - `default`: Lists, tables, detail pages
   - `full`: Dense horizontal content (logs, code, editors, charts)

5. **Optional page headers** — Add `PageHeader` with `PageHeaderMeta` only when context aids users; omit when content is self-explanatory.

6. **Action placement strategy** — Position actions where users are already looking:
   - Breadcrumb row actions via `PageBreadcrumbsActions`
   - Header actions via `PageHeaderAside`
   - Filter row actions on the right side
   - Compact chrome uses breadcrumb or in-page controls

7. **Section labeling** — Pages without `PageHeader` titles that contain multiple `PageSection`s should use `PageSectionTitle` and `PageSectionDescription` for clarity.

## Layout Patterns

### Settings Pages

Use `size="small"` or `size="default"` for both header and container. Group configuration fields within `PageSection` components. "Manage your organization's billing and subscription settings" exemplifies this approach with organized sections for different setting categories.

### List Views

Default to `size="default"`; use `full` when table columns require additional width. Include search/filter controls above the table, with action buttons positioned in the header aside or filter row.

### Detail Pages

Use `size="default"` with `PageSection` elements set to `orientation="horizontal"` to place section summaries beside content blocks, creating a balanced two-column layout.

### Full-Width Views

Applied to logs, code editors, and dense dashboards. Use `size="full"` and keep chrome minimal—breadcrumbs with optional actions, sub-navigation when needed, but omit `PageHeader` if no title block is necessary.

## Component Reference

- **PageBreadcrumbs** — Full-width bordered breadcrumb row
- **PageNav** — Full-width sub-navigation container
- **PageContainer** — Max-width wrapper with configurable padding
- **PageHeader** — Optional title block with metadata and aside slots
- **PageSection** — Titled content blocks with flexible layouts

## Implementation Notes

The design system emphasizes consistency through component composition rather than prescriptive page templates. Developers select container sizes and section layouts based on content requirements, allowing flexibility while maintaining visual coherence across the application.
