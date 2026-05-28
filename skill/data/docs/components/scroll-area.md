---
source: https://supabase.com/design-system/docs/components/scroll-area
scraped: 2026-05-27
section: components
---

# Scroll-area Component Documentation

## Component Description

The Scroll-area component "augments native scroll functionality for custom, cross-browser styling." It leverages Radix UI primitives to provide enhanced scrolling experiences.

## Installation

```bash
npx shadcn-ui@latest add scroll-area
```

## Import Statement

```javascript
import { ScrollArea } from '@/components/ui/scroll-area'
```

## Basic Usage

```jsx
<ScrollArea className="h-[200px] w-[350px] rounded-md border p-4">
  Jokester began sneaking into the castle in the middle of the night and 
  leaving jokes all over the place: under the king's pillow, in his soup, 
  even in the royal toilet. The king was furious, but he couldn't seem to 
  stop Jokester. And then, one day, the people of the kingdom discovered 
  that the jokes left by Jokester were so funny that they couldn't help but 
  laugh. And once they started laughing, they couldn't stop.
</ScrollArea>
```

## Examples

### Vertical Scrolling Demo

```jsx
import * as React from 'react'
import { ScrollArea, Separator } from 'ui'

const tags = Array.from({ length: 50 }).map((_, i, a) => `v1.2.0-beta.${a.length - i}`)

export function ScrollAreaDemo() {
  return (
    <ScrollArea className="h-72 w-48 rounded-md border">
      <div className="p-4 divide-y divide-border">
        <h4 className="mb-4 text-sm font-medium leading-none">Tags</h4>
        {tags.map((tag) => (
          <div key={tag} className="text-sm py-2">
            {tag}
          </div>
        ))}
      </div>
    </ScrollArea>
  )
}
```

### Horizontal Scrolling Demo

```jsx
import Image from 'next/image'
import * as React from 'react'
import { ScrollArea, ScrollBar } from 'ui'

export interface Artwork {
  artist: string
  art: string
}

export const works: Artwork[] = [
  {
    artist: 'Ornella Binni',
    art: 'https://images.unsplash.com/photo-1465869185982-5a1a7522cbcb?auto=format&fit=crop&w=300&q=80',
  },
  {
    artist: 'Tom Byrom',
    art: 'https://images.unsplash.com/photo-1548516173-3cabfa4607e9?auto=format&fit=crop&w=300&q=80',
  },
  {
    artist: 'Vladimir Malyavko',
    art: 'https://images.unsplash.com/photo-1494337480532-3725c85fd2ab?auto=format&fit=crop&w=300&q=80',
  },
]

export function ScrollAreaHorizontalDemo() {
  return (
    <ScrollArea className="w-96 whitespace-nowrap rounded-md border">
      <div className="flex w-max space-x-4 p-4">
        {works.map((artwork) => (
          <figure key={artwork.artist} className="shrink-0">
            <div className="overflow-hidden rounded-md">
              <Image
                src={artwork.art}
                alt={`Photo by ${artwork.artist}`}
                className="aspect-3/4 h-fit w-fit object-cover"
                width={300}
                height={400}
              />
            </div>
            <figcaption className="pt-2 text-xs text-muted-foreground">
              Photo by <span className="font-semibold text-foreground">{artwork.artist}</span>
            </figcaption>
          </figure>
        ))}
      </div>
      <ScrollBar orientation="horizontal" />
    </ScrollArea>
  )
}
```

## Sub-components

- **ScrollArea**: Main container component
- **ScrollBar**: Visible scrollbar control supporting `orientation` prop

## External References

- [Radix UI Documentation](https://www.radix-ui.com/docs/primitives/components/scroll-area)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/scroll-area#api-reference)
