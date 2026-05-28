---
source: https://supabase.com/design-system/docs/components/dropdown-menu
scraped: 2026-05-27
section: components
---

# Dropdown Menu Component Documentation

## Overview

The Dropdown Menu is a component that "Displays a menu to the user — such as a set of actions or functions — triggered by a button." It's built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add dropdown-menu
```

## Basic Import

```typescript
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
```

## Sub-Components

- **DropdownMenu** - Root container
- **DropdownMenuTrigger** - Button that opens the menu
- **DropdownMenuContent** - Menu container
- **DropdownMenuLabel** - Text label for menu sections
- **DropdownMenuSeparator** - Visual divider between items
- **DropdownMenuItem** - Individual menu item
- **DropdownMenuGroup** - Grouped menu items
- **DropdownMenuShortcut** - Keyboard shortcut display
- **DropdownMenuSub** - Nested submenu trigger
- **DropdownMenuSubTrigger** - Submenu activation element
- **DropdownMenuSubContent** - Submenu container
- **DropdownMenuPortal** - Portal for submenu rendering

## Basic Usage Example

```jsx
<DropdownMenu>
  <DropdownMenuTrigger>Open</DropdownMenuTrigger>
  <DropdownMenuContent>
    <DropdownMenuLabel>My Account</DropdownMenuLabel>
    <DropdownMenuSeparator />
    <DropdownMenuItem>Profile</DropdownMenuItem>
    <DropdownMenuItem>Billing</DropdownMenuItem>
    <DropdownMenuItem>Team</DropdownMenuItem>
    <DropdownMenuItem>Subscription</DropdownMenuItem>
  </DropdownMenuContent>
</DropdownMenu>
```

## Additional Variants Documented

- Checkboxes variant
- Radio Group variant

## Resources

- [Radix UI Documentation](https://www.radix-ui.com/docs/primitives/components/dropdown-menu)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/dropdown-menu#api-reference)
