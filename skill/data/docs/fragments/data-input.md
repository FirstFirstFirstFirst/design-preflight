---
source: https://supabase.com/design-system/docs/fragments/data-input
scraped: 2026-05-27
section: fragments
---

# Data Input Component Documentation

## Overview

The Data Input component (referred to as `Input` in code) enables users to set, read, or copy values on a single line. It's distinct from the atomic Input component and serves specialized data display and interaction purposes.

## Core Usage Patterns

### Basic Implementation

```jsx
import { Input } from 'ui-patterns/DataInputs/Input'

export function DataInputDemo() {
  return <Input containerClassName="w-full max-w-sm" placeholder="Hello world" />
}
```

### Read-Only Values with Copy Functionality

"Input should be used for read-only values that can be copied or otherwise interacted with, as the input element is both keyboard and mouse-friendly."

```jsx
import { Input } from 'ui-patterns/DataInputs/Input'

export function DataInputWithCopy() {
  return <Input containerClassName="w-full max-w-sm" readOnly copy value="1234567890" />
}
```

### Sensitive Values - Reveal & Copy

Sensitive data can support both reveal and copy actions sequentially, reducing interface complexity.

```jsx
import { Input } from 'ui-patterns/DataInputs/Input'

export function DataInputWithRevealCopy() {
  return <Input containerClassName="w-full max-w-sm" readOnly reveal copy value="1234567890" />
}
```

### Editable with Reveal (Without Display)

```jsx
import { Input } from 'ui-patterns/DataInputs/Input'

export function DataInputWithRevealCopy() {
  return <Input containerClassName="w-full max-w-sm" reveal copy defaultValue="1234567890" />
}
```

### Masked Value Display with Real Clipboard Content

```jsx
import { Input } from 'ui-patterns/DataInputs/Input'

export function DataInputWithCopySecret() {
  const actualValue = 'sb_secret_1234567890'
  const maskedValue = 'sb_secret_123•••••••'

  return (
    <Input
      containerClassName="w-full max-w-sm"
      readOnly
      copy
      value={maskedValue}
      onCopy={() => {
        navigator.clipboard.writeText(actualValue)
      }}
    />
  )
}
```

## Password Manager Compatibility

To prevent password manager interference, add these attributes:

```jsx
<Input
  readOnly
  copy
  value={name}
  data-1p-ignore // 1Password
  data-lpignore="true" // LastPass
  data-form-type="other" // Dashlane
  data-bwignore // Bitwarden
/>
```

## Key Props

| Prop | Type | Description |
|------|------|-------------|
| `containerClassName` | string | Tailwind classes for container styling |
| `placeholder` | string | Placeholder text when empty |
| `value` | string | Display value (read-only) |
| `defaultValue` | string | Initial value (editable) |
| `readOnly` | boolean | Prevents user editing |
| `copy` | boolean | Shows copy button |
| `reveal` | boolean | Shows reveal toggle for sensitive data |
| `onCopy` | function | Custom copy handler |

## Design Recommendations

The documentation notes that partial truncation with masking is preferable to full revelation in most security scenarios. Copy-only functionality often suffices without additional reveal capability.
