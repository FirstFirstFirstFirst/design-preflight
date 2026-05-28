---
source: https://supabase.com/design-system/docs/fragments/collapsible-alert
scraped: 2026-05-27
section: fragments
---

# Collapsible Alert Component Documentation

## Overview

The Collapsible Alert is a fragment component that combines alert styling with expandable content functionality. As described in the documentation, it provides "an alert-styled block with a collapsible content section, toggled by an icon button."

## Key Purpose

This component is designed for situations where a callout message needs to remain visible while supporting optional, expandable details. The documentation specifies: "Use it when the disclosure is itself a callout. It owns the alert styling, padding, trigger treatment, and toggle button."

## When to Use

- **Collapsible Alert**: When you need disclosure functionality integrated with alert-style callouts
- **Alternative - Collapsible**: Use the generic `Collapsible` component when you only need reveal/hide behavior without alert styling
- **Alternative - Admonition**: Use for non-expandable product callouts
- **Alternative - Alert**: Use the low-level `Alert` primitive only when requiring direct control over alert structure

## Usage Examples

### Basic Implementation
```jsx
import { CollapsibleAlert } from 'ui-patterns/collapsible-alert'

export function CollapsibleAlertDemo() {
  return (
    <CollapsibleAlert trigger="Need help?">
      <p className="text-sm text-foreground-light">
        Try a different browser or disable extensions that block network requests.
      </p>
    </CollapsibleAlert>
  )
}
```

### Default Open State
```jsx
<CollapsibleAlert trigger="Details" defaultOpen>
  <p>This section is expanded by default.</p>
</CollapsibleAlert>
```

### Variants
```jsx
<CollapsibleAlert trigger="Warning" variant="warning">
  <p>Something needs attention.</p>
</CollapsibleAlert>
```

## Available Variants

The component supports three variant options matching the Alert component: `default`, `destructive`, and `warning`.

## Props

- **trigger**: Text label for the expandable button
- **defaultOpen**: Boolean to set initial expanded state
- **variant**: Alert style variant (`default`, `destructive`, `warning`)
