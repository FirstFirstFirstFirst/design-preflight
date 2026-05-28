---
source: https://supabase.com/design-system/docs/components/tooltip
scraped: 2026-05-27
section: components
---

# Tooltip Component

## Description
The Tooltip is a popup interface element that surfaces contextual information when users interact with a specific element. It activates on keyboard focus or mouse hover and is built on Radix UI primitives.

## Installation
```bash
npx shadcn-ui@latest add tooltip
```

## Import Statement
```typescript
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from '@/components/ui/tooltip'
```

## Sub-Components
- **TooltipProvider**: Wrapper that enables tooltip functionality
- **Tooltip**: Container component
- **TooltipTrigger**: Element that triggers the tooltip display
- **TooltipContent**: Container for the tooltip message

## Basic Usage Example
```jsx
<TooltipProvider>
  <Tooltip>
    <TooltipTrigger asChild>
      <Button type="outline">Hover</Button>
    </TooltipTrigger>
    <TooltipContent>
      <p>Add to library</p>
    </TooltipContent>
  </Tooltip>
</TooltipProvider>
```

## Key Features
- Displays on hover or keyboard focus
- Built on Radix UI primitive foundation
- Supports nested trigger elements via `asChild` prop
- Accessible interface pattern

## Documentation References
- **Radix UI Docs**: Available at official Radix UI documentation
- **API Reference**: Complete parameter details in Radix UI API documentation
- **Source Code**: Located in Supabase GitHub repository
