---
source: https://supabase.com/design-system/docs/color-usage
scraped: 2026-05-27
section: getting-started
---

# Color Usage - Supabase Design System

## Overview
The Supabase Design System provides a comprehensive color system with shorthand utility classes offering "sensible, contrast-checked defaults" to maintain accessibility standards across applications.

## Text Colors

Available text color utilities include:
- `text-light`
- `text-lighter`
- `text-muted`
- `text-contrast`
- `text-destructive`
- `text-warning`
- `text-brand`

**Guidance:** "Use accent text colors (e.g. text-destructive, text-warning) sparingly to avoid visual overload."

## Background Colors

### Standard Backgrounds
- `bg-200`, `bg`
- `bg-alternative-200`, `bg-alternative`
- `bg-selection`
- `bg-control`
- `bg-surface-75`, `bg-surface-100`, `bg-surface-200`, `bg-surface-300`, `bg-surface-400`
- `bg-overlay`, `bg-overlay-hover`
- `bg-muted`, `bg-button`, `bg-dialog`
- `bg-dash-sidebar`, `bg-dash-canvas`

### App-Specific Usage

**./www and ./docs sites:**
```html
<body className="bg">{children}</body>
```

**./studio dashboard:**
```html
<body className="bg-studio">{children}</body>
```

### Surface Strategies

**./apps/www + ./apps/docs:** Darker backgrounds with dedicated surface colors

**./apps/studio:** Use `bg-surface-100`, `bg-surface-200`, `bg-surface-300`

**Data grids:** Alternative background color (`bg-alternative`) creates depth in empty spaces

**Large empty areas:** Implement `bg-200` or `bg` classes for proper spacing fill

## Border Colors

- `border`
- `border-muted`
- `border-secondary`
- `border-overlay`
- `border-control`
- `border-alternative`
- `border-strong`, `border-stronger`
- `border-button`, `border-button-hover`

## Semantic Color Groups

**Destructive:** `bg-destructive-200` through `bg-destructive-600`, `bg-destructive`

**Warning:** `bg-warning-200` through `bg-warning-600`, `bg-warning`

**Brand:** `bg-brand-200` through `bg-brand-600`, `bg-brand`, `bg-brand-link`

**Secondary:** `bg-_secondary-200`, `bg-_secondary-400`, `bg-_secondary`

**Code blocks:** `bg-code_block-1` through `bg-code_block-5`

## Color Palette

The system exposes Radix scales via CSS variables: `--colors-{name}{1..12}`. Colors derive from `@radix-ui/colors` v0.1.9, with custom Brand and Scale colors. Available color families include Amber, Blue, Brand, Crimson, Gold, Gray, Green, Indigo, Orange, Pink, Purple, Red, Slate, Tomato, Violet, and Yellow.

---

**Design System Credits:** Built by Supabase, inspired by Radix, shadcn/ui, and Geist design systems.
