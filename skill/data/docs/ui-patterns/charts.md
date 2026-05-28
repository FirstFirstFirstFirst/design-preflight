---
source: https://supabase.com/design-system/docs/ui-patterns/charts
scraped: 2026-05-27
section: ui-patterns
---

# Charts - Supabase Design System

## Overview

The Charts component provides composable, reusable chart solutions for observability dashboards and reports. It leverages Recharts for extensibility while offering pre-built components for common use cases.

## Key Components

**Root Container:**
- `Chart` - Provides context for loading and disabled states to child components

**Layout Components:**
- `ChartCard` - Card wrapper with optional Slot support
- `ChartHeader` - Container for titles, actions, and metrics
- `ChartContent` - Main visualization area with state handling
- `ChartFooter` - Container for footer content like tables

**Display Components:**
- `ChartTitle` - Title with optional tooltip support
- `ChartMetric` - Metric values with status indicators
- `ChartActions` - Action buttons or links
- `ChartEmptyState` - Pre-built empty state component
- `ChartLoadingState` - Pre-built loading indicator

**Chart Types:**
- `ChartLine` - Time-series line charts
- `ChartBar` - Time-series bar charts

## Best Practices

1. **Use provided chart types first** - Default charts cover most needs; avoid direct Recharts usage when possible to reduce complexity.

2. **Leverage useChart context** - Access `isLoading` and `isDisabled` flags to display appropriate states.

3. **Keep implementation simple** - These components handle presentational needs without excessive abstraction.

## Core Props

**Chart Container:**
- `isLoading` (boolean, default false) - Shows loading state
- `isDisabled` (boolean, default false) - Disables interactions

**ChartMetric:**
- `label`, `value`, `diffValue` - Display values
- `status` - 'positive' | 'negative' | 'warning' | 'default'
- `align` - 'start' | 'end'
- `tooltip` - Help text

**ChartLine/ChartBar:**
- `data` - Array of timestamped data points
- `dataKey` - Property to plot
- `config` - ChartConfig for styling
- `chartHighlight` - Selection configuration
- `isFullHeight`, `showGrid`, `showYAxis` - Display options

## Configuration

**ChartConfig Type:**
Defines styling with either single `color` or theme-aware `color` for light/dark modes, plus optional `label` and `icon`.

**ChartHighlight:**
Manages selection with mouse handlers, coordinates, and clear function.

**ChartHighlightAction:**
Defines actions shown during highlight selection with label, icon, and conditional disable logic.
