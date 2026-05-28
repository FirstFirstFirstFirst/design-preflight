---
source: https://supabase.com/design-system/docs/fragments/metric-card
scraped: 2026-05-27
section: fragments
---

# Metric Card - Supabase Design System

## Overview

The Metric Card is "a card to display pull out metrics at a glance," designed for presenting key performance indicators and related analytics in a dashboard context.

## Component Structure

The Metric Card comprises several sub-components working together:

- **MetricCard**: Container wrapper
- **MetricCardHeader**: Top section containing label and optional link
- **MetricCardLabel**: Display text with optional tooltip
- **MetricCardContent**: Central area for value and differential display
- **MetricCardValue**: Large numerical metric display
- **MetricCardDifferential**: Change indicator (positive/negative variant)
- **MetricCardSparkline**: Visual trend chart

## Core Features

- Loading state support via `isLoading` prop
- Tooltip integration for contextual information
- Differential values with variant styling (positive/negative)
- Sparkline visualization for trend data
- Optional header links for navigation
- Responsive layout options

## Usage Example

The demonstration shows retrieving data across 12 hourly intervals, calculating average values, and displaying percentage changes with a visual sparkline component.

## Related Components

- Logs Bar Chart (previous)
- Table of Contents/TOC (next)

---

**Framework**: Built with React (client-side), using Tailwind CSS and Radix UI patterns
