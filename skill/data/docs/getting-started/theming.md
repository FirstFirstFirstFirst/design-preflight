---
source: https://supabase.com/design-system/docs/theming
scraped: 2026-05-27
section: getting-started
---

# Supabase Design System - Themes Page

## Overview
The Themes page documents the theming approach used in the Supabase Design System. It explains that the system "takes into account varying themes" to support flexibility and future customization.

## Available Themes

The design system currently supports:

- **Light** - Standard light theme
- **Dark (Classic dark)** - Traditional dark mode
- **Deep dark** - Additional dark variant currently in development
- **System** - Automatically switches between light and dark based on user's system preferences

## Key Implementation Strategy

The migration approach is notable: "Supabase is migrating to use tailwind classes that use CSS properties." This enables three primary benefits:

1. Simplified theme updates without modifying hundreds of individual files
2. Future support for custom or additional themes
3. Centralized theme management

## Navigation Context

The page is part of a larger design system documentation structure, positioned between "Tailwind Classes" and "Typography" sections. It's part of the Getting Started area, with extensive component libraries (Atom Components, Fragment Components, and UI Patterns) available throughout the documentation.

## Credits

The design system drew inspiration from Radix, shadcn/ui, and Geist, with source code available on GitHub.
