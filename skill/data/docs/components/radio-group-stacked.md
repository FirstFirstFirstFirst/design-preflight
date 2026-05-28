---
source: https://supabase.com/design-system/docs/components/radio-group-stacked
scraped: 2026-05-27
section: components
---

# Radio Group Stacked Component Documentation

## Component Overview

The Radio Group Stacked component presents a collection of mutually exclusive radio buttons arranged vertically. This implementation leverages Radix UI as its foundation, ensuring robust accessibility and consistent behavior.

## Description

"A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time."

## Core Components

### RadioGroupStacked
The parent container for stacked radio options.

### RadioGroupStackedItem
Individual radio button items within the group.

**Props:**
- `value` (string): The option's identifier
- `id` (string): HTML element identifier
- `label` (string): Display text for the option
- `description` (string, optional): Additional explanatory text beneath the label

## Code Example

```jsx
import { RadioGroupStacked, RadioGroupStackedItem } from 'ui'

export function RadioGroupDemo() {
  return (
    <RadioGroupStacked defaultValue="comfortable">
      <RadioGroupStackedItem
        value="default"
        id="r1"
        label="Default"
        description="The default option is the most spacious and comfortable."
      />
      <RadioGroupStackedItem
        value="comfortable"
        id="r2"
        label="Comfortable"
        description="The comfortable option is a bit more compact than the default option."
      />
      <RadioGroupStackedItem
        value="compact"
        id="r3"
        label="Compact"
        description="The compact option is the most compact and space-efficient."
      />
    </RadioGroupStacked>
  )
}
```

## Key Attributes

- **defaultValue**: Pre-selected option value
- **Stacked Layout**: Vertical arrangement of radio options
- **Description Support**: Optional secondary text per item

## Resources

- [Radix UI Documentation](https://www.radix-ui.com/docs/primitives/components/radio-group)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/radio-group#api-reference)
