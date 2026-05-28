---
source: https://supabase.com/design-system/docs/fragments/logs-bar-chart
scraped: 2026-05-27
section: fragments
---

# Logs Bar Chart

## Overview

The Logs Bar Chart is "a stacked bar chart that displays logs errors and successes." This component is specifically designed for use in logs pages to visualize error and success metrics over time.

## Usage

This component displays bar chart data on logs pages. The `data` prop must be an array of objects conforming to this structure:

```typescript
type LogsBarChartDatum = {
  timestamp: string
  ok_count: number
  error_count: number
  warning_count: number
}
```

## Code Example

```jsx
'use client'

import { LogsBarChart } from 'ui-patterns/LogsBarChart'

export function LogsBarChartDemo() {
  const data = Array.from({ length: 100 }, (_, i) => {
    const date = new Date()
    date.setMinutes(date.getMinutes() - i * 5)

    return {
      timestamp: date.toISOString(),
      ok_count: Math.floor(Math.random() * 100),
      error_count: Math.floor(Math.random() * 50),
      warning_count: Math.floor(Math.random() * 50),
    }
  }).reverse()

  return (
    <div className="w-full h-24">
      <LogsBarChart data={data} />
    </div>
  )
}
```

## Data Requirements

Each data point requires four properties: an ISO timestamp and counts for successful operations, errors, and warnings.
