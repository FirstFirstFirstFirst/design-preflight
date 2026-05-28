---
source: https://supabase.com/design-system/docs/components/badge
scraped: 2026-05-27
section: components
---

# Badge Component Documentation

## Overview

The Badge component adds contextual metadata to other UI elements, displaying information such as surrounding state or product category. Its purpose should be self-evident based on context.

## Installation

```
import { Badge } from '@/components/ui/badge'
```

## Basic Usage

```jsx
import { Badge } from 'ui'

export function BadgeDemo() {
  return <Badge>Default</Badge>
}
```

## Implementation

```jsx
<Badge variant="default">Default</Badge>
```

## Variants

The Badge component supports multiple visual states:

- **default**: Standard appearance
- **warning**: Indicates caution or warnings
- **success**: Indicates positive or successful states
- **destructive**: Indicates errors or dangerous actions
- **secondary**: Content-only variant, similar to the text variant of Button

## Code Example: States

```jsx
import { Badge } from 'ui'

export function BadgeState() {
  return (
    <div className="flex flex-row gap-2">
      <Badge variant="default">Default</Badge>
      <Badge variant="warning">Warning</Badge>
      <Badge variant="success">Success</Badge>
      <Badge variant="destructive">Destructive</Badge>
    </div>
  )
}
```

## Code Example: Secondary Variant

```jsx
import { Badge } from 'ui'

export function BadgeSecondary() {
  return <Badge variant="secondary">Secondary</Badge>
}
```

## Usage Guidelines

- "Avoid altering the Badge style, such as text case or roundedness" to maintain consistency
- Limit text to one or two words, as it's designed to support other elements
- Use sparingly, as Badge is designed to stand out
- Create alternative components for other use cases like compute size indicators
