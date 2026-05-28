---
source: https://supabase.com/design-system/docs/components/expanding-textarea
scraped: 2026-05-27
section: components
---

# Expanding Textarea Component

## Description
The Expanding Textarea is a component that displays a textarea field which automatically adjusts its height based on content, expanding or contracting as the user types.

## Usage
```jsx
import { ExpandingTextArea } from 'ui'
```

```jsx
<ExpandingTextArea />
```

## Basic Example
```jsx
import { useState } from 'react'
import { ExpandingTextArea } from 'ui'

export function ExpandingTextareaDemo() {
  const [value, setValue] = useState('')

  return (
    <ExpandingTextArea
      placeholder="Type your message in multiple lines here."
      value={value}
      onChange={(event) => {
        setValue(event.target.value)
      }}
    />
  )
}
```

## Props
The component accepts standard textarea attributes including:
- `placeholder` - placeholder text display
- `value` - controlled component value
- `onChange` - event handler for value changes

## Features
- Auto-expands based on content
- Auto-shrinks when content is removed
- Maintains standard textarea functionality
- Supports controlled component pattern

## Source
This component is part of the Supabase Design System, with source code available on GitHub.
