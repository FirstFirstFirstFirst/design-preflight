---
source: https://supabase.com/design-system/docs/components/carousel
scraped: 2026-05-27
section: components
---

# Carousel Component Documentation

## About

The carousel component utilizes the "Embla Carousel library" for implementing motion and swipe functionality.

## Installation

```bash
npx shadcn-ui@latest add carousel
```

## Usage

### Import Statement

```typescript
import {
  Carousel,
  CarouselContent,
  CarouselItem,
  CarouselNext,
  CarouselPrevious,
} from '@/components/ui/carousel'
```

### Basic Structure

```jsx
<Carousel>
  <CarouselContent>
    <CarouselItem>...</CarouselItem>
    <CarouselItem>...</CarouselItem>
    <CarouselItem>...</CarouselItem>
  </CarouselContent>
  <CarouselPrevious />
  <CarouselNext />
</Carousel>
```

## Sub-Components

- `Carousel` - Main wrapper component
- `CarouselContent` - Container for carousel items
- `CarouselItem` - Individual item within the carousel
- `CarouselNext` - Navigation button for next item
- `CarouselPrevious` - Navigation button for previous item

## Variants & Examples

### Sizes

Control item dimensions using the `basis` utility class on `CarouselItem`:

```jsx
// Fixed sizing (33% width)
<CarouselItem className="basis-1/3">...</CarouselItem>

// Responsive sizing
<CarouselItem className="md:basis-1/2 lg:basis-1/3">...</CarouselItem>
```

### Spacing

Apply spacing between items via padding and negative margins:

```jsx
// Fixed spacing
<CarouselContent className="-ml-4">
  <CarouselItem className="pl-4">...</CarouselItem>
</CarouselContent>

// Responsive spacing
<CarouselContent className="-ml-2 md:-ml-4">
  <CarouselItem className="pl-2 md:pl-4">...</CarouselItem>
</CarouselContent>
```

### Orientation

Configure carousel direction via the `orientation` prop:

```jsx
<Carousel orientation="vertical | horizontal">
  <CarouselContent>
    <CarouselItem>...</CarouselItem>
  </CarouselContent>
</Carousel>
```

## Props

### Carousel

- `opts` - Configuration object (accepts Embla Carousel options)
- `setApi` - Callback returning carousel API instance
- `orientation` - Set to "vertical" or "horizontal" (default: horizontal)
- `plugins` - Array of Embla Carousel plugins

### CarouselItem

- `className` - CSS classes for sizing and spacing control

## Options Configuration

```jsx
<Carousel opts={{ align: 'start', loop: true }}>
  <CarouselContent>
    <CarouselItem>...</CarouselItem>
  </CarouselContent>
</Carousel>
```

Reference Embla Carousel documentation for complete options list.

## API & Events

### Using the API Instance

```typescript
const [api, setApi] = React.useState<CarouselApi>()

React.useEffect(() => {
  if (!api) return
  
  setCount(api.scrollSnapList().length)
  setCurrent(api.selectedScrollSnap() + 1)
  
  api.on('select', () => {
    setCurrent(api.selectedScrollSnap() + 1)
  })
}, [api])
```

### Event Listeners

```typescript
api.on('select', () => {
  // Execute actions on selection change
})
```

## Plugins

```typescript
import Autoplay from "embla-carousel-autoplay"

<Carousel plugins={[Autoplay({ delay: 2000 })]}>
  <CarouselContent>
    <CarouselItem>...</CarouselItem>
  </CarouselContent>
</Carousel>
```

## Notes

The component uses `pl-[VALUE]` and `-ml-[VALUE]` utilities for spacing rather than CSS grid `gap` properties for simplified implementation.
