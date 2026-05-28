---
source: https://supabase.com/design-system/docs/tailwind-classes
scraped: 2026-05-27
section: getting-started
---

# Tailwind Classes - Supabase Design System

## Overview
The Supabase Design System uses Tailwind classes with CSS properties to support theming capabilities. As stated in the documentation: "This is to support the concept of theming, so that we can update themes from one place" and offer custom themes in the future.

## Core Primitives
Six foundational color tokens are defined:
- `background`
- `foreground`
- `border`
- `brand`
- `warning`
- `destructive`

These tokens are exported from Figma as JSON and transformed into Tailwind utilities via scripts in `packages/ui/internals/tokens`.

## Color Application Examples
Colors can be applied across Tailwind utilities with variants:
- `text-foreground` (default)
- `text-foreground-light` (softer shade)
- `text-warning-500` (specific intensity)

## Shorthand Classes
The system provides abbreviated utility names:
- `text-muted` replaces `text-foreground-muted`
- `bg-surface` replaces `bg-background-surface-100`
- `border-strong` replaces `border-border-strong`

## Color Mixing
Colors can be applied flexibly across utilities. For instance, `foreground-light` works as `border-foreground-light` or `bg-foreground-light` when needed.

## Opacity Support
All generated colors use Tailwind opacity syntax: `hsl(--background-default) / var(--tw-bg-opacity)`, enabling opacity modifiers like `bg-surface-300/90` or `bg-surface-300/50`.

## Foreground (Text) Values
- `foreground` - default text
- `foreground-light` - lighter shade
- `foreground-lighter` - lighter still
- `foreground-muted` - muted appearance

## Background Values
- `background` - main body background
- `background-surface-100` - panels/surfaces
- `background-surface-200` - overlapping surfaces
- `background-surface-300` - stacked surfaces
- `background-alternative` - inverted background
- `background-overlay` - overlays/dropdowns
- `background-control` - form inputs
- `background-button` - button defaults

## Border Values
- `border` - default border
- `border-secondary` - secondary variant
- `border-alternative` - inverted border
- `border-overlay` - overlay borders
- `border-control` - input borders
- `border-strong` - hover/focus states
- `border-stronger` - highlighted borders
- `border-button` - button-specific variants

## Brand, Destructive, and Warning
Each supports intensity scales: 200, 300, 400, 500, DEFAULT, 600, and `button` variants where applicable.
