---
source: https://supabase.com/design-system/docs/components/collapsible
scraped: 2026-05-27
section: components
---

# Collapsible Component Documentation

## Overview

The Collapsible is "a low-level primitive for revealing and hiding related content" from the shadcn library, designed for custom trigger and content composition.

## Use Cases

Implement Collapsible for generic disclosure behavior in:
- Rows and sections
- Menus and tool details
- Custom layouts

**Alternative:** Use Collapsible Alert for alert-styled callouts requiring standard alert padding and styling.

## Installation

```javascript
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from 'ui/src/components/shadcn/ui/collapsible'
```

## Sub-Components

- **Collapsible** -- Main container wrapper
- **CollapsibleTrigger** -- Interactive element that toggles content visibility
- **CollapsibleContent** -- Container for hidden/revealed content

## Basic Usage

```jsx
<Collapsible>
  <CollapsibleTrigger>Toggle</CollapsibleTrigger>
  <CollapsibleContent>
    <p>Content revealed when expanded.</p>
  </CollapsibleContent>
</Collapsible>
```

## Props & Variants

### Default Open State
```jsx
<Collapsible defaultOpen>
  <CollapsibleTrigger>Details</CollapsibleTrigger>
  <CollapsibleContent>
    <p>This section is expanded by default.</p>
  </CollapsibleContent>
</Collapsible>
```

### Controlled State
```jsx
const [isOpen, setIsOpen] = useState(false)
<Collapsible open={isOpen} onOpenChange={setIsOpen}>
```

### Animation
Add animation classes to CollapsibleContent:
```jsx
<CollapsibleContent className="data-closed:animate-collapsible-up data-open:animate-collapsible-down">
```

## Accessibility

Include screen reader text for toggle buttons:
```jsx
<span className="sr-only">Toggle</span>
```
