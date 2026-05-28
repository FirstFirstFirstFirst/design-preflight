# Anti-pattern: Sidebar Icon Off-Center on Collapse

## Problem

Fixed-width inner container with horizontal padding (`px-*`) inside a collapsible sidebar. When sidebar collapses to icon-only width, the padding persists and shifts the icon off-center.

## Why It Happens

```
Collapsed sidebar: 3rem wide
Inner div: 16rem wide, px-1.5 (6px each side), overflow clipped
Icon span: w-12 (3rem), centered within itself

Visible area center: 24px
Actual icon center: 6px (left pad) + 24px (half icon span) = 30px
Result: icon shifted 6px right of center
```

## Fix

Conditional padding — remove horizontal padding when collapsed, restore when expanded:

```tsx
className={cn(
  "flex flex-col flex-1 py-3 gap-1",
  isExpanded ? "px-1.5" : "px-0"
)}
```

## Rule

When a sidebar uses overflow clipping for collapse (fixed inner width > collapsed outer width), any horizontal padding on the inner container must be zero in collapsed state. Otherwise icons will never visually center within the narrow strip.

## Applies When

- Hand-rolled collapsible sidebar (not using shadcn `Sidebar` component)
- Inner content div has fixed width larger than collapsed width
- Collapse achieved via `overflow-hidden` + width transition
- Icon containers sized to match collapsed width
