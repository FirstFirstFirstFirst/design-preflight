---
source: https://supabase.com/design-system/docs/components/input
scraped: 2026-05-27
section: components
---

# Supabase Design System - Input Component

## Component Description

The Input component is a fundamental form element that "Displays a form input field or a component that looks like an input field."

## Installation

```bash
npx shadcn-ui@latest add input
```

## Basic Usage

```javascript
import { Input } from '@/components/ui/input'

<Input />
```

## Example Implementation

```javascript
import { Input } from 'ui'

export function InputDemo() {
  return <Input type="email" placeholder="Email" />
}
```

## Documented Variants

The design system documentation includes the following example states:

- **Default** - Standard input field appearance
- **File** - File upload input variant
- **Disabled** - Non-interactive disabled state
- **With Label** - Input paired with an associated label element
- **With Button** - Input combined with an action button
- **Form** - Input within a complete form context

## Navigation Structure

The Input component appears within the Atom Components section of the Supabase Design System, positioned between Hover Card and Input OTP components in the documentation hierarchy.

## Additional Resources

- **Source**: Available on [GitHub](https://github.com/supabase/supabase/tree/master/apps/design-system)
- **Built by**: [Supabase](https://twitter.com/supabase)
- **Design Inspiration**: Radix, shadcn/ui, and Geist design systems
