# Anti-pattern: Sidebar Labels Visible When Collapsed via Overflow Clip

## Problem

Text labels still render inside collapsed sidebar, hidden only by `overflow-hidden` on the parent. Labels are technically present, just clipped — no intentional hide/show, no animation, looks broken at intermediate widths during transition.

## Why It's Bad

- During width transition, partial text briefly visible (choppy)
- Screen readers still announce clipped text
- No visual polish — feels like a bug, not a feature
- Footer text same issue

## Fix

Pass `isExpanded` state to nav items. Animate labels with opacity + translate:

```tsx
<span
  className={cn(
    "truncate transition-[opacity,transform] duration-200",
    isExpanded ? "opacity-100 translate-x-0" : "opacity-0 -translate-x-2"
  )}
>
  {label}
</span>
```

- `opacity-0` → fully invisible when collapsed (no partial text flash)
- `-translate-x-2` → subtle slide-left exit, slide-right entrance
- `duration-200` → match sidebar width transition timing
- Apply same treatment to footer text

## Rule

Never rely on `overflow-hidden` alone to hide sidebar text on collapse. Always explicitly animate label visibility with opacity (+ optional transform) synced to sidebar transition timing.

## Applies When

- Collapsible sidebar with icon-only collapsed state
- Labels inside fixed-width inner container wider than collapsed width
- Any text that should disappear on collapse (nav labels, section headers, footer)
