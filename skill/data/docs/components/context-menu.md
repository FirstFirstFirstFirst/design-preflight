---
source: https://supabase.com/design-system/docs/components/context-menu
scraped: 2026-05-27
section: components
---

# Context Menu Component Documentation

## Component Description

The Context Menu component displays a menu to users--such as a set of actions or functions--triggered by a button, typically through right-click interaction.

## Source

This component uses Radix UI primitives. Reference materials available at:
- [Radix UI Context Menu Docs](https://www.radix-ui.com/docs/primitives/components/context-menu)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/context-menu#api-reference)

## Installation

```bash
npx shadcn-ui@latest add context-menu
```

## Import Statement

```javascript
import {
  ContextMenu,
  ContextMenuCheckboxItem,
  ContextMenuContent,
  ContextMenuItem,
  ContextMenuLabel,
  ContextMenuRadioGroup,
  ContextMenuRadioItem,
  ContextMenuSeparator,
  ContextMenuShortcut,
  ContextMenuSub,
  ContextMenuSubContent,
  ContextMenuSubTrigger,
  ContextMenuTrigger,
} from '@/components/ui/context-menu'
```

## Sub-Components

- **ContextMenu**: Root wrapper
- **ContextMenuTrigger**: Activation element
- **ContextMenuContent**: Menu container
- **ContextMenuItem**: Individual menu item
- **ContextMenuCheckboxItem**: Checkbox-enabled item
- **ContextMenuRadioItem**: Radio button item
- **ContextMenuRadioGroup**: Radio selection container
- **ContextMenuLabel**: Label text
- **ContextMenuSeparator**: Visual divider
- **ContextMenuShortcut**: Keyboard shortcut display
- **ContextMenuSub**: Submenu wrapper
- **ContextMenuSubTrigger**: Submenu activation
- **ContextMenuSubContent**: Submenu container

## Basic Usage Example

```javascript
<ContextMenu>
  <ContextMenuTrigger>Right click</ContextMenuTrigger>
  <ContextMenuContent>
    <ContextMenuItem>Profile</ContextMenuItem>
    <ContextMenuItem>Billing</ContextMenuItem>
    <ContextMenuItem>Team</ContextMenuItem>
    <ContextMenuItem>Subscription</ContextMenuItem>
  </ContextMenuContent>
</ContextMenu>
```

## Complete Example with All Features

The documentation includes a comprehensive demo featuring navigation items with shortcuts, disabled states, nested submenus, checkbox items, radio groups, and separators.
