---
source: https://supabase.com/design-system/docs/components/date-picker
scraped: 2026-05-27
section: components
---

# Date Picker Component Documentation

## Component Description

The Date Picker is a composable component built from the `<Popover />` and `<Calendar />` components. It enables users to select dates with support for ranges and preset options.

## Installation

The Date Picker requires installation of its dependent components:
- [Popover](/docs/components/popover#installation)
- [Calendar](/docs/components/calendar#installation)

## Core Components & Props

### DatePickerDemo
**Main component** combining Popover and Calendar functionality.

**Dependencies:**
- `date-fns` - for date formatting
- `lucide-react` - for calendar icon
- `@/lib/utils` - utility functions

**Key Elements:**
- `Popover` - container for trigger and content
- `PopoverTrigger` - button that opens the picker
- `PopoverContent` - calendar display area
- `Calendar` - date selection interface

### Props & Attributes

**Button (Trigger):**
- `type`: 'outline' variant
- `className`: supports width, alignment, and conditional styling
- `icon`: calendar icon component

**Calendar:**
- `mode`: 'single' (single date selection)
- `selected`: currently chosen date
- `onSelect`: callback function for date changes
- `initialFocus`: boolean to focus calendar on mount

## Code Examples

### Basic Date Picker
```typescript
'use client'

import { format } from 'date-fns'
import { Calendar as CalendarIcon } from 'lucide-react'
import * as React from 'react'
import { Button, Calendar, Popover, PopoverContent, PopoverTrigger } from 'ui'
import { cn } from '@/lib/utils'

export function DatePickerDemo() {
  const [date, setDate] = React.useState<Date>()

  return (
    <Popover>
      <PopoverTrigger asChild>
        <Button
          type={'outline'}
          className={cn(
            'w-[280px] justify-start text-left font-normal',
            !date && 'text-muted-foreground'
          )}
          icon={<CalendarIcon className="h-4 w-4" />}
        >
          {date ? format(date, 'PPP') : <span>Pick a date</span>}
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-auto p-0">
        <Calendar mode="single" selected={date} onSelect={setDate} initialFocus />
      </PopoverContent>
    </Popover>
  )
}
```

## Available Variants

1. **Date Picker** - single date selection
2. **Date Range Picker** - select date ranges
3. **With Presets** - includes common date range shortcuts
4. **Form** - integrated within form context

## Additional Resources

Documentation references [React DayPicker](https://react-day-picker.js.org) for extended functionality details.
