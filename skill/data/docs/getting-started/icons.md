---
source: https://supabase.com/design-system/docs/icons
scraped: 2026-05-27
section: getting-started
---

# Icons

## Overview
"Icons make actions and navigation across Supabase easier." This documentation covers principles, usage patterns, and guidelines for implementing icons within the design system.

## Core Principles

The design system emphasizes three key guidelines:

1. **Paired** - Icons should accompany text, as standalone icons lack sufficient clarity
2. **Clear** - Icons should remain legible at small sizes and avoid unnecessary embellishment
3. **Consistent** - Reusing the same icons for similar actions throughout the application improves usability

## Tinting Icons

Icons accept text color classes similar to typography. The documentation provides this example: use `className="text-foreground-muted"` for muted styling. Notably, "don't tint icons with `text-destructive` for destructive actions" since a confirmation dialog should handle destructive styling instead.

## Icon Sources

**Standard UI Icons**: The system relies on Lucide for standard icon needs.

**Custom Icons**: When Lucide lacks a necessary icon, the system supports custom implementations. Available custom icons include: REST-api, analytics-bucket, auth, database, edge-functions, postgres, realtime, storage, and others.

## Implementation Example

```jsx
import { BucketAdd, InsertCode, ReplaceCode } from 'icons'

function app() {
  return (
    <>
      <ReplaceCode className="text-light" strokeWidth={1} size={16} />
      <InsertCode className="text-light" strokeWidth={1} size={16} />
      <BucketAdd size={24} className="text-foreground-muted" />
    </>
  )
}
```

**Default props**: All icons default to `size={24}`. Stroke and fill properties derive from SVG root attributes, which developers can override at the call site.

## Adding Custom Icons

**SVG Requirements**:
- Export at 24x24px with `viewBox="0 0 24 24"`
- Use `stroke="currentColor"` for strokes (no hardcoded colors)
- Use `stroke-width="1.5"` (adjust based on optical weight)
- Use `fill="none"` for fills
- Icon content should be optically centered around 18x18px
- Remove unnecessary elements like `<clipPath>`, `<defs>`, and wrapper `<g>` tags
- Maintain simple structure with only `<path>` elements

**Process**:
1. Create SVG file in `packages/icons/src/raw-icons/` using kebab-case naming
2. Run `npm run build:icons` from the icons directory
3. Import with camelCase naming (e.g., `my-new-icon.svg` becomes `MyNewIcon`)

## Design Guidelines

**Preferred approach**: Place shared styling attributes (`fill`, `stroke`, `stroke-width`, `stroke-linecap`, `stroke-linejoin`) on the root `<svg>` element. This allows the build process to propagate them as component defaults in camelCase format, while individual path-level attributes become fixed styling that overrides props.

**Fill-only icons** (logos using shapes instead of strokes) should include `stroke="none"` on the root element with `fill="currentColor"` on individual paths.

## Troubleshooting

"If your SVG specifies `stroke-width` attributes on individual child paths, they will override the component's `strokeWidth` prop." Keep shared stroke attributes on the root element to allow consumer control over stroke weight.
