---
source: https://supabase.com/design-system/docs/components/separator
scraped: 2026-05-27
section: components
---

# Separator Component Documentation

## Component Description

The Separator component provides a way to "visually or semantically separates content" within user interfaces.

## Installation

```bash
npx shadcn-ui@latest add separator
```

## Usage

```javascript
import { Separator } from '@/components/ui/separator'
```

Basic implementation:
```jsx
<Separator />
```

## Code Example

```jsx
import { Separator } from 'ui'

export function SeparatorDemo() {
  return (
    <div>
      <div className="space-y-1">
        <h4 className="text-sm font-medium leading-none">Radix Primitives</h4>
        <p className="text-sm text-muted-foreground">
          An open-source UI component library.
        </p>
      </div>
      <Separator className="my-4" />
      <div className="flex h-5 items-center space-x-4 text-sm">
        <div>Blog</div>
        <Separator orientation="vertical" />
        <div>Docs</div>
        <Separator orientation="vertical" />
        <div>Source</div>
      </div>
    </div>
  )
}
```

## Props/Variants

- **orientation**: Controls separator direction (supports `"vertical"` for vertical orientation; defaults to horizontal)
- **className**: Accepts Tailwind CSS classes (example: `my-4`)

## Credits

Built by Supabase, inspired by Radix, shadcn/ui, and Geist design systems.
