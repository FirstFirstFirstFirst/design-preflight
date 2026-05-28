---
source: https://supabase.com/design-system/docs/components/progress
scraped: 2026-05-27
section: components
---

# Progress Component

## Description
The Progress component "displays an indicator showing the completion progress of a task, typically displayed as a progress bar."

## Component Source
Built by Supabase, utilizing Radix UI primitives. Reference documentation available at Radix UI's Progress component docs and API reference.

## Installation

```bash
npx shadcn-ui@latest add progress
```

## Basic Usage

```javascript
import { Progress } from '@/components/ui/progress'

<Progress value={33} />
```

## Code Example

```javascript
'use client'

import * as React from 'react'
import { Progress } from 'ui'

export function ProgressDemo() {
  const [progress, setProgress] = React.useState(13)

  React.useEffect(() => {
    const timer = setTimeout(() => setProgress(66), 500)
    return () => clearTimeout(timer)
  }, [])

  return <Progress value={progress} className="w-[60%]" />
}
```

## Props
- `value`: Numeric value indicating progress level
- `className`: Tailwind CSS classes for styling (example shows "w-[60%]")

## Related Components
- Previous: Popover
- Next: Radio Group
