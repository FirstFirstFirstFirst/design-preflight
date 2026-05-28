---
source: https://supabase.com/design-system/docs/components/aspect-ratio
scraped: 2026-05-27
section: components
---

# Aspect Ratio Component Documentation

## Component Description

The Aspect Ratio component "displays content within a desired ratio." It is built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add aspect-ratio
```

## Import

```typescript
import { AspectRatio } from '@/components/ui/aspect-ratio'
```

## Usage Example

```jsx
import Image from 'next/image'
import { AspectRatio } from '@/components/ui/aspect-ratio'

export function AspectRatioDemo() {
  return (
    <AspectRatio ratio={16 / 9} className="bg-muted">
      <Image
        src="https://images.unsplash.com/photo-1560937526-61078e7eb7d8?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        alt="Photo by Drew Beamer"
        fill
        className="rounded-md object-cover"
      />
    </AspectRatio>
  )
}
```

## Props

| Prop | Type | Description |
|------|------|-------------|
| `ratio` | `number` | The desired aspect ratio (e.g., 16/9) |
| `className` | `string` | Additional CSS classes for styling |

## Documentation References

- [Radix UI Aspect Ratio Docs](https://www.radix-ui.com/docs/primitives/components/aspect-ratio)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/aspect-ratio#api-reference)
