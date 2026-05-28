---
source: https://supabase.com/design-system/docs/components/radio-group-card
scraped: 2026-05-27
section: components
---

# Radio Group Card Component Documentation

## Component Description

The Radio Group Card is a set of selectable buttons where only one option can be checked at a time. It represents a mutually exclusive selection pattern in the Supabase Design System.

## Based On

This component implements "Radix UI's radio group primitive with card-styled presentation."

## Installation

```
import { RadioGroupCard, RadioGroupCardItem } from 'ui'
```

## Basic Usage

```jsx
import { RadioGroupCard, RadioGroupCardItem } from 'ui'

export function RadioGroupDemo() {
  return (
    <RadioGroupCard defaultValue="comfortable" className="flex flex-wrap gap-3">
      <RadioGroupCardItem value="default" id="r1" label="Default" />
      <RadioGroupCardItem value="comfortable" id="r2" label="Comfortable" />
      <RadioGroupCardItem value="compact" id="r3" label="Compact" />
    </RadioGroupCard>
  )
}
```

## Sub-Components

**RadioGroupCardItem** - Individual card item within the group with the following attributes:
- `value` - The value associated with the option
- `id` - Unique identifier for the item
- `label` - Display text for the option

## Component Props

**RadioGroupCard**
- `defaultValue` - Pre-selected value (string)
- `className` - CSS classes for styling (string)

## Documented Examples

The documentation references two example implementations:
1. **With children** - Demonstrates RadioGroupCardItem usage with nested content
2. **Form** - Shows integration within form contexts

## Accessibility

Built on Radix UI primitives which follow WAI-ARIA standards for radio groups.

## References

- [Radix UI Docs](https://www.radix-ui.com/docs/primitives/components/radio-group)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/radio-group#api-reference)
