---
source: https://supabase.com/design-system/docs/components/switch
scraped: 2026-05-27
section: components
---

# Switch Component Documentation

## Overview
The Switch component is "a control for toggling between unchecked and checked" states. It's built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add switch
```

## Basic Import

```javascript
import { Switch } from '@/components/ui/switch'
```

## Basic Usage

```jsx
<Switch />
```

## Complete Example with Label

```jsx
import { Label, Switch } from 'ui'

export function SwitchDemo() {
  return (
    <div className="flex items-center space-x-2">
      <Switch id="airplane-mode" />
      <Label htmlFor="airplane-mode">Airplane Mode</Label>
    </div>
  )
}
```

## Layout Considerations

When using Switch in custom flex layouts with height constraints, "you may need to add `relative` positioning to the parent container to ensure proper rendering of focus rings, form validation messages, and overflow."

```jsx
<div className="relative">
  <FormField
    control={form.control}
    name="enabled"
    render={({ field }) => (
      <FormControl>
        <Switch checked={field.value} onCheckedChange={field.onChange} />
      </FormControl>
    )}
  />
</div>
```

## Important Note

You don't need manual `relative` positioning when using FormItemLayout, as "it provides the necessary positioning context automatically."

## External References
- [Radix UI Switch Docs](https://www.radix-ui.com/docs/primitives/components/switch)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/switch#api-reference)
