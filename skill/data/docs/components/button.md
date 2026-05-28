---
source: https://supabase.com/design-system/docs/components/button
scraped: 2026-05-27
section: components
---

# Button Component Documentation

## Overview
The Button component displays interactive button elements or button-styled components within the Supabase Design System.

## Installation
```
import { Button } from '@/components/ui/button'
```

## Basic Usage
```jsx
<Button type="outline">Button</Button>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `type` | string | - | Button variant (primary, default, secondary, warning, destructive, outline, ghost, link) |
| `size` | string | - | Button size (tiny, small, medium, large, huge) |
| `loading` | boolean | false | Shows loading state |
| `icon` | ReactNode | - | Icon displayed on the left |
| `iconRight` | ReactNode | - | Icon displayed on the right |
| `asChild` | boolean | false | Enables slot behavior for nested components |
| `disabled` | boolean | false | Disables the button |
| `tabIndex` | number | auto | Keyboard navigation index |

## Button Types/Variants

- **Primary**: "Used for data insertion actions, confirming purchases, strong positive actions"
- **Default**: For dialogs and navigation
- **Secondary**: Signaling data/config changes
- **Warning**: Actions with potential side effects
- **Destructive**: "Used for actions that will have a serious destructive side effect, like deleting data"
- **Outline**: Secondary or less important actions
- **Ghost**: Non-critical actions
- **Link**: Minimal visual priority actions

## States
- Rest
- Loading
- Disabled
- Icon (left or right)
- Focus

## Link Implementation

Using `buttonVariants` helper:
```jsx
import { buttonVariants } from '@/components/ui/button'

<Link className={buttonVariants({ variant: 'outline' })}>Click here</Link>
```

Using `asChild`:
```jsx
<Button asChild>
  <Link href="/login">Login</Link>
</Button>
```

## Accessibility Notes

- "Keyboard focus is automatically handled"
- Enabled buttons default to `tabIndex={0}`
- Disabled buttons default to `tabIndex={-1}`
- Manual `tabIndex` override is available when needed
