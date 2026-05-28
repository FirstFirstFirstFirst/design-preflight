---
source: https://supabase.com/design-system/docs/components/calendar
scraped: 2026-05-27
section: components
---

# Calendar Component Documentation

## Description

The Calendar component is a date field interface enabling users to input and modify dates. It's constructed using the [React DayPicker](https://react-day-picker.js.org) library as its foundation.

## Installation

```bash
npx shadcn-ui@latest add calendar
```

## Import

```javascript
import { Calendar } from '@/components/ui/calendar'
```

## Basic Usage

```javascript
'use client'

import * as React from 'react'
import { Calendar } from 'ui'

export function CalendarDemo() {
  const [date, setDate] = React.useState<Date | undefined>(new Date())

  return <Calendar mode="single" selected={date} onSelect={setDate} className="rounded-md border" />
}
```

## Props

| Prop | Type | Default |
|------|------|---------|
| `mode` | `"single"` | `"single"` |
| `selected` | `Date \| undefined` | `undefined` |
| `onSelect` | `(date: Date \| undefined) => void` | -- |
| `className` | `string` | `"rounded-md border"` |

## Variants

- **Single Mode**: Allows selection of one date

## Related Components

- **Date Picker**: Enhanced date selection component with additional functionality (see [Date Picker documentation](/design-system/docs/components/date-picker))

## Examples

### Form Integration
A form example demonstrates integration with a date-of-birth field, including validation messaging and submission handling.

## Additional Resources

Built by Supabase. Source code available on [GitHub](https://github.com/supabase/supabase/tree/master/apps/design-system).

Design inspired by Radix, shadcn/ui, and Geist frameworks.
