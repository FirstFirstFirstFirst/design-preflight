---
source: https://supabase.com/design-system/docs/components/toggle
scraped: 2026-05-27
section: components
---

# Toggle Component Documentation

## Overview
"A two-state button that can be either on or off." This component is built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add toggle
```

## Usage

```typescript
import { Toggle } from '@/components/ui/toggle'

<Toggle>Toggle</Toggle>
```

## Basic Example

```typescript
import { Bold } from 'lucide-react'
import { Toggle } from 'ui'

export function ToggleDemo() {
  return (
    <Toggle aria-label="Toggle bold">
      <Bold className="h-4 w-4" />
    </Toggle>
  )
}
```

## Available Variants

The documentation lists the following example variations:

- **Default** - Standard toggle with icon
- **Outline** - Toggle with outline styling
- **With Text** - Toggle containing text content
- **Small** - Smaller size variant
- **Large** - Larger size variant
- **Disabled** - Disabled state variant

## Accessibility

The component supports ARIA attributes. The example demonstrates `aria-label="Toggle bold"` for proper labeling.

## Resources

- [Radix UI Toggle Documentation](https://www.radix-ui.com/docs/primitives/components/toggle)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/toggle#api-reference)
