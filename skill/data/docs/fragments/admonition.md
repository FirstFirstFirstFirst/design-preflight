---
source: https://supabase.com/design-system/docs/fragments/admonition
scraped: 2026-05-27
section: fragments
---

# Admonition Component Documentation

## Overview

The Admonition component "displays a callout for user attention" within the Supabase Design System. It provides the standard product callout pattern for situations requiring user engagement.

## Usage Guidelines

### When to Use

- **Use Admonition** for standard product callouts instead of the low-level Alert primitive
- **Use Collapsible Alert** when callouts need to remain visible while optional details can expand
- **Use Collapsible** for generic disclosure behavior not functioning as a callout

### Title and Description

- `title` serves as the heading slot when callouts need their own heading (optional)
- Short callouts may use `description` alone without a title if surrounding content provides context
- Avoid title-only Admonitions in new code
- Callouts with titles should include `description` or `children` to avoid reading as incomplete headings

### Button Styling

Style button colors based on Admonition context rather than inherited type:
- `warning` Admonition with encouraged action uses `type="default"` button
- `destructive` Admonition uses `type="danger"` button
- Reserve `primary` (green) button type for `default` Admonitions only, and use rarely given Admonition's isolated nature

## Code Example

```jsx
import { Button } from 'ui'
import { Admonition } from 'ui-patterns/admonition'

export function AdmonitionDemo() {
  return (
    <Admonition
      type="default"
      layout="horizontal"
      title="OAuth Server is disabled"
      description="Enable OAuth Server to make your project act as an identity provider for
            third-party applications."
      actions={<Button type="default">OAuth Server Settings</Button>}
    />
  )
}
```

## Component Types/Variants

- **default**: Standard callout
- **warning**: Cautionary information requiring attention
- **success**: Positive, completed states without corrective action needed
- **destructive**: High-impact or destructive actions

## Responsive Behavior

When `layout="responsive"`, the Admonition becomes the container-query context with `@container`. It maintains `vertical` layout on narrow widths and switches to `horizontal` at the `@md` container breakpoint, independent of page width.

## Related Components

- Alert (low-level primitive)
- Collapsible Alert
- Card
- Dialog
- AlertError wrapper
- NoPermission wrapper
