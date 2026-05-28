---
source: https://supabase.com/design-system/docs/components/alert
scraped: 2026-05-27
section: components
---

# Alert Component Documentation

## Component Overview

The Alert component is a foundational shadcn UI primitive designed to "display a low-level callout primitive for user attention." It serves as the base for more specialized components like Admonition.

## When to Use Alert

- **Use Alert for:** Custom compositions requiring bespoke icons, custom internal layouts, or direct access to `alertVariants`
- **Use Admonition instead:** For standard product callouts (recommended default)
- **Use Collapsible Alert:** When callouts need expandable detail sections
- **Use Collapsible only:** For generic disclosure behavior unrelated to alerts

## Installation

```
import { Alert, AlertDescription, AlertTitle } from 'ui/src/components/shadcn/ui/alert'
```

## Sub-Components

- `Alert` - Container component
- `AlertTitle` - Title section
- `AlertDescription` - Description/content section

## Basic Code Example

```jsx
import { Terminal } from 'lucide-react'
import { Alert, AlertDescription, AlertTitle } from 'ui'

export function AlertDemo() {
  return (
    <Alert>
      <Terminal size={16} />
      <AlertTitle>Heads up!</AlertTitle>
      <AlertDescription>
        You can add components using the CLI.
      </AlertDescription>
    </Alert>
  )
}
```

## Variants

The component exports `alertVariants` for building shared wrapper components around the primitive.

```
import { alertVariants } from 'ui/src/components/shadcn/ui/alert'
```

## Technology

Built on Radix UI primitives with design inspiration from shadcn/ui and Geist.
