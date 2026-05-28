---
source: https://supabase.com/design-system/docs/components/accordion
scraped: 2026-05-27
section: components
---

# Accordion Component Documentation

## Component Description

The Accordion is "a vertically stacked set of interactive headings that each reveal a section of content." It's built on Radix UI and follows WAI-ARIA design patterns for accessibility.

## Installation

**CLI Command:**
```bash
npx shadcn-ui@latest add accordion
```

**Manual Setup:**
Update `tailwind.config.js` with animation keyframes:

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  theme: {
    extend: {
      keyframes: {
        'accordion-down': {
          from: { height: '0' },
          to: { height: 'var(--radix-accordion-content-height)' },
        },
        'accordion-up': {
          from: { height: 'var(--radix-accordion-content-height)' },
          to: { height: '0' },
        },
      },
      animation: {
        'accordion-down': 'accordion-down 0.2s ease-out',
        'accordion-up': 'accordion-up 0.2s ease-out',
      },
    },
  },
}
```

## Sub-Components

- `Accordion` - Root container
- `AccordionItem` - Individual collapsible section
- `AccordionTrigger` - Clickable heading
- `AccordionContent` - Hidden content revealed on click

## Props

**Accordion:**
- `type="single"` - Only one item open at a time
- `collapsible` - Allows closing open items
- `className="w-full"` - CSS class for styling

**AccordionItem:**
- `value` - Unique identifier (e.g., "item-1")

## Code Example

```jsx
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'

export function AccordionDemo() {
  return (
    <Accordion type="single" collapsible className="w-full">
      <AccordionItem value="item-1">
        <AccordionTrigger>Is it accessible?</AccordionTrigger>
        <AccordionContent>
          Yes. It adheres to the WAI-ARIA design pattern.
        </AccordionContent>
      </AccordionItem>
    </Accordion>
  )
}
```

## Key Features

- Accessible design following WAI-ARIA patterns
- Default styling matching design system
- Animated transitions (0.2s ease-out)
- Customizable animation behavior

## References

- [Radix UI Docs](https://www.radix-ui.com/docs/primitives/components/accordion)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/accordion#api-reference)
