---
source: https://supabase.com/design-system/docs/components/radio-group
scraped: 2026-05-27
section: components
---

# Radio Group Component Documentation

## Component Description

The Radio Group is "a set of checkable buttons--known as radio buttons--where no more than one of the buttons can be checked at a time."

## Source & Dependencies

This component uses Radix UI primitives. Official documentation and API reference available via Radix UI.

## Installation

```bash
npx shadcn-ui@latest add radio-group
```

## Import Statement

```javascript
import { Label } from '@/components/ui/label'
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group'
```

## Basic Usage Example

```jsx
<RadioGroup defaultValue="option-one">
  <div className="flex items-center space-x-2">
    <RadioGroupItem value="option-one" id="option-one" />
    <Label htmlFor="option-one">Option One</Label>
  </div>
  <div className="flex items-center space-x-2">
    <RadioGroupItem value="option-two" id="option-two" />
    <Label htmlFor="option-two">Option Two</Label>
  </div>
</RadioGroup>
```

## Demo Implementation

The documentation includes a functional demo showing three radio button options (Default, Comfortable, Compact) with `defaultValue="comfortable"` and a form example with notification preferences.

## Related Components

- Radio Group Card variant
- Radio Group Stacked variant
