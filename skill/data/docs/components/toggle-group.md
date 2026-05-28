---
source: https://supabase.com/design-system/docs/components/toggle-group
scraped: 2026-05-27
section: components
---

# Toggle Group Component Documentation

## Component Overview

The Toggle Group is "a set of two-state buttons that can be toggled on or off." This component is built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add toggle-group
```

## Import

```javascript
import { ToggleGroup, ToggleGroupItem } from '@/components/ui/toggle-group'
```

## Basic Usage

```jsx
<ToggleGroup type="single">
  <ToggleGroupItem value="a">A</ToggleGroupItem>
  <ToggleGroupItem value="b">B</ToggleGroupItem>
  <ToggleGroupItem value="c">C</ToggleGroupItem>
</ToggleGroup>
```

## Examples

### Default Example
Multiple selection with icon buttons (Bold, Italic, Underline from lucide-react)

```jsx
import { Bold, Italic, Underline } from 'lucide-react'
import { ToggleGroup, ToggleGroupItem } from 'ui'

export function ToggleGroupDemo() {
  return (
    <ToggleGroup type="multiple">
      <ToggleGroupItem value="bold" aria-label="Toggle bold">
        <Bold className="h-4 w-4" />
      </ToggleGroupItem>
      <ToggleGroupItem value="italic" aria-label="Toggle italic">
        <Italic className="h-4 w-4" />
      </ToggleGroupItem>
      <ToggleGroupItem value="underline" aria-label="Toggle underline">
        <Underline className="h-4 w-4" />
      </ToggleGroupItem>
    </ToggleGroup>
  )
}
```

### Variant Examples
The documentation references additional variants available:
- Outline
- Single
- Small
- Large
- Disabled

## Accessibility

Implementation includes `aria-label` attributes for icon-only buttons to describe functionality.

## Documentation References

- [Radix UI Toggle Group Docs](https://www.radix-ui.com/docs/primitives/components/toggle-group)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/toggle-group#api-reference)
