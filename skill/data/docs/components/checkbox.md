---
source: https://supabase.com/design-system/docs/components/checkbox
scraped: 2026-05-27
section: components
---

# Checkbox Component Documentation

## Component Overview

The Checkbox is "a control that allows the user to toggle between checked and not checked." It leverages Radix UI as its underlying foundation.

## Installation

```bash
npx shadcn-ui@latest add checkbox
```

### Manual Installation
Manual installation instructions are available via the Radix UI documentation.

## Usage

```javascript
import { Checkbox } from '@/components/ui/checkbox'
```

Basic implementation:
```jsx
<Checkbox />
```

## Code Examples

### Basic Example with Label

```jsx
'use client'

import { Checkbox } from 'ui'

export function CheckboxDemo() {
  return (
    <div className="flex items-center space-x-2">
      <Checkbox id="terms" />
      <label
        htmlFor="terms"
        className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
      >
        Accept terms and conditions
      </label>
    </div>
  )
}
```

## Variants Documented

The documentation includes examples for:
- **With text**: Checkbox paired with accompanying label text
- **Disabled**: Non-interactive disabled state
- **Form**: Integration within form contexts

## Accessibility Features

The component includes peer-disabled styling that ensures disabled checkboxes display appropriate cursor and opacity changes ("peer-disabled:cursor-not-allowed peer-disabled:opacity-70").

## References

- **Radix UI Documentation**: https://www.radix-ui.com/docs/primitives/components/checkbox
- **API Reference**: https://www.radix-ui.com/docs/primitives/components/checkbox#api-reference
