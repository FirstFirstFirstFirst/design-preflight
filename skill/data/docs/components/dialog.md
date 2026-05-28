---
source: https://supabase.com/design-system/docs/components/dialog
scraped: 2026-05-27
section: components
---

# Dialog Component Documentation

## Component Description

The Dialog component serves as "a general-purpose modal for non-critical flows, forms, and custom interactions." It leverages Radix UI and is designed for flexible, bespoke interactions while remaining safely dismissible without forcing explicit decisions.

## When to Use Dialog

**Appropriate use cases:**
- Non-critical flows, forms, and custom interactions
- Multi-step flows or pickers
- Displaying non-urgent information
- Workflows where cancellation is expected and low-risk

**When NOT to use Dialog:**
- Use Alert Dialog for critical confirmations requiring explicit decisions
- Use Confirmation Modal when additional context is needed
- Use Text Confirm Dialog for highly destructive actions requiring typed intent

## Key Features

- Closable by clicking outside the modal or pressing Escape
- Fully customizable layout and content
- Designed for safe dismissal without serious consequences

## Sub-Components

- `Dialog` - Root wrapper
- `DialogTrigger` - Opens the dialog
- `DialogContent` - Modal container
- `DialogHeader` - Header section
- `DialogTitle` - Title text
- `DialogDescription` - Description text
- `DialogSection` - Content section
- `DialogSectionSeparator` - Visual divider
- `DialogFooter` - Footer section

## Installation

```bash
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
```

## Basic Usage Example

```jsx
<Dialog>
  <DialogTrigger>Open</DialogTrigger>
  <DialogContent>
    <DialogHeader>
      <DialogTitle>Project settings</DialogTitle>
      <DialogDescription>
        Update configuration options for this project.
      </DialogDescription>
    </DialogHeader>
  </DialogContent>
</Dialog>
```

## Props

**DialogContent:**
- `centered` (boolean, default: true) - Controls dialog centering behavior

## Guidelines

- Design assuming users may dismiss without completing actions
- Guard dirty forms on dismissal with confirmation dialogs
- Keep focus contained to single tasks
- Avoid destructive confirmations
- Compose freely with custom layouts

## Special Notes

To activate Dialog from within Context Menu or Dropdown Menu, wrap these components inside the Dialog component due to Radix UI constraints.

## Resources

- [Radix UI Dialog Docs](https://www.radix-ui.com/docs/primitives/components/dialog)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/dialog#api-reference)
