---
source: https://supabase.com/design-system/docs/components/popover
scraped: 2026-05-27
section: components
---

# Popover Component Documentation

## Overview
The Popover component "displays rich content in a portal, triggered by a button." It's built on Radix UI primitives.

## Installation
```bash
npx shadcn-ui@latest add popover
```

## Import
```javascript
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover'
```

## Basic Usage
```jsx
<Popover>
  <PopoverTrigger>Open</PopoverTrigger>
  <PopoverContent>Place content for the popover here.</PopoverContent>
</Popover>
```

## Complete Example
```jsx
import { Button, Input, Label, Popover, PopoverContent, PopoverTrigger } from 'ui'

export function PopoverDemo() {
  return (
    <Popover>
      <PopoverTrigger asChild>
        <Button type="outline">Open popover</Button>
      </PopoverTrigger>
      <PopoverContent className="w-80">
        <div className="grid gap-4">
          <div className="space-y-2">
            <h4 className="font-medium leading-none">Dimensions</h4>
            <p className="text-sm text-muted-foreground">Set dimensions for the layer.</p>
          </div>
          <div className="grid gap-2">
            <div className="grid grid-cols-3 items-center gap-4">
              <Label htmlFor="width">Width</Label>
              <Input id="width" defaultValue="100%" className="col-span-2 h-8" />
            </div>
            <div className="grid grid-cols-3 items-center gap-4">
              <Label htmlFor="maxWidth">Max. width</Label>
              <Input id="maxWidth" defaultValue="300px" className="col-span-2 h-8" />
            </div>
            <div className="grid grid-cols-3 items-center gap-4">
              <Label htmlFor="height">Height</Label>
              <Input id="height" defaultValue="25px" className="col-span-2 h-8" />
            </div>
            <div className="grid grid-cols-3 items-center gap-4">
              <Label htmlFor="maxHeight">Max. height</Label>
              <Input id="maxHeight" defaultValue="none" className="col-span-2 h-8" />
            </div>
          </div>
        </div>
      </PopoverContent>
    </Popover>
  )
}
```

## Sub-Components
- **Popover**: Root component container
- **PopoverTrigger**: Element that triggers popover opening
- **PopoverContent**: Container for popover content

## References
- [Radix UI Documentation](https://www.radix-ui.com/docs/primitives/components/popover)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/popover#api-reference)
