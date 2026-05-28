---
source: https://supabase.com/design-system/docs/components/label
scraped: 2026-05-27
section: components
---

# Label Component Documentation

## Component Description
The Label component "renders an accessible label associated with controls." It is built on Radix UI primitives and provides semantic HTML labeling for form elements.

## Installation
```
import { Label } from '@/components/ui/label'
```

## Basic Usage
```jsx
<Label htmlFor="email">Your email address</Label>
```

## Code Example
```jsx
import { Checkbox, Label } from 'ui'

export function LabelDemo() {
  return (
    <div>
      <div className="flex items-center space-x-2">
        <Checkbox id="terms" />
        <Label htmlFor="terms">Accept terms and conditions</Label>
      </div>
    </div>
  )
}
```

## Props
- **htmlFor**: Associates the label with a form control via matching id attribute

## Important Usage Guidelines
**Do Not Use with Form Component**: "Please use FormLabel if you are using Form based components." The Label component should not be paired with the Form component; use FormLabel instead for form-based implementations.

## Accessibility
The component provides accessible labeling for controls through the standard HTML `htmlFor` attribute, ensuring proper association between labels and their corresponding form elements.

## References
- [Radix UI Label Docs](https://www.radix-ui.com/docs/primitives/components/label)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/label#api-reference)
