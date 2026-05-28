---
source: https://supabase.com/design-system/docs/components/textarea
scraped: 2026-05-27
section: components
---

# Textarea Component Documentation

## Component Description
The Textarea component "Displays a form textarea or a component that looks like a textarea."

## Installation

**CLI Command:**
```bash
npx shadcn-ui@latest add textarea
```

**Import Statement:**
```typescript
import { Textarea } from '@/components/ui/textarea'
```

## Basic Usage
```jsx
<Textarea />
```

## Examples

### Default Implementation
```jsx
import { Textarea } from 'ui'

export function TextareaDemo() {
  return <Textarea placeholder="Type your message here." />
}
```

### Available Variants
The documentation lists the following example variants:
- Default
- Disabled
- With Label
- With Text
- With Button
- Form
