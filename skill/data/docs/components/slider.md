---
source: https://supabase.com/design-system/docs/components/slider
scraped: 2026-05-27
section: components
---

# Slider Component Documentation

## Component Description
"An input where the user selects a value from within a given range." The component is built on Radix UI's slider primitive.

## Installation

```bash
npx shadcn-ui@latest add slider
```

## Basic Usage

```typescript
import { Slider } from '@/components/ui/slider'

<Slider defaultValue={[33]} max={100} step={1} />
```

## Component Props

Based on the documentation, the Slider accepts standard React component properties via `React.ComponentProps<typeof Slider>` and includes:

- `defaultValue`: Array of numbers (default: `[50]`)
- `max`: Number (default: `100`)
- `step`: Number (default: `1`)
- `min`: Number (default: `0`)
- `className`: String for custom styling

## Code Examples

### Default Slider
```typescript
import { Slider } from 'ui'
import { cn } from '@/lib/utils'

type SliderProps = React.ComponentProps<typeof Slider>

export function SliderDemo({ className, ...props }: SliderProps) {
  return (
    <Slider
      defaultValue={[50]}
      max={100}
      step={1}
      className={cn('w-[60%]', className)}
      {...props}
    />
  )
}
```

### Min and Max Range Variant
```typescript
export function SliderDemo({ className, ...props }: SliderProps) {
  return (
    <Slider
      defaultValue={[20, 80]}
      min={0}
      max={100}
      step={1}
      className={cn('w-[60%]', className)}
      {...props}
    />
  )
}
```

## Documentation References
- [Radix UI Slider Docs](https://www.radix-ui.com/docs/primitives/components/slider)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/slider#api-reference)
