---
source: https://supabase.com/design-system/docs/fragments/info-tooltip
scraped: 2026-05-27
section: fragments
---

# Info Tooltip - Design System Documentation

## Overview

The InfoTooltip component provides "a tooltip with an information icon." It is built on Radix UI primitives.

## Usage

### Import Statement

```javascript
import { InfoTooltip } from 'ui'
```

### Basic Example

```jsx
import { InfoTooltip } from 'ui-patterns/info-tooltip'
 
export function InfoTooltipDemo() {
  return <InfoTooltip side="top">This is the tooltip content</InfoTooltip>
}
```

### Implementation

```jsx
<InfoTooltip side="top">This is the tooltip content</InfoTooltip>
```

## Props

The component accepts a `side` prop that controls tooltip positioning (example shows `"top"`).

## References

- **Radix UI Documentation**: https://www.radix-ui.com/docs/primitives/components/avatar
- **API Reference**: https://www.radix-ui.com/docs/primitives/components/avatar#api-reference
