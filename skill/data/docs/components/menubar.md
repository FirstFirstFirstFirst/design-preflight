---
source: https://supabase.com/design-system/docs/components/menubar
scraped: 2026-05-27
section: components
---

# Menubar Component Documentation

## Component Description

The Menubar is "a visually persistent menu common in desktop applications that provides quick access to a consistent set of commands." This component is built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add menubar
```

## Import Statement

```typescript
import {
  Menubar,
  MenubarCheckboxItem,
  MenubarContent,
  MenubarItem,
  MenubarMenu,
  MenubarRadioGroup,
  MenubarRadioItem,
  MenubarSeparator,
  MenubarShortcut,
  MenubarSub,
  MenubarSubContent,
  MenubarSubTrigger,
  MenubarTrigger,
} from '@/components/ui/menubar'
```

## Sub-Components

- **Menubar** - Root container for the menu structure
- **MenubarMenu** - Wrapper for individual menu sections
- **MenubarTrigger** - Clickable element that opens menu content
- **MenubarContent** - Container for menu items and sub-elements
- **MenubarItem** - Individual selectable menu option
- **MenubarCheckboxItem** - Menu item with checkbox functionality
- **MenubarRadioGroup** - Group for radio selection items
- **MenubarRadioItem** - Radio button option within a group
- **MenubarSeparator** - Visual divider between menu items
- **MenubarShortcut** - Displays keyboard shortcut hints
- **MenubarSub** - Creates nested submenu structure
- **MenubarSubTrigger** - Opens submenu content
- **MenubarSubContent** - Container for submenu items

## Basic Usage Example

```jsx
<Menubar>
  <MenubarMenu>
    <MenubarTrigger>File</MenubarTrigger>
    <MenubarContent>
      <MenubarItem>
        New Tab <MenubarShortcut>⌘T</MenubarShortcut>
      </MenubarItem>
      <MenubarItem>New Window</MenubarItem>
      <MenubarSeparator />
      <MenubarItem>Share</MenubarItem>
      <MenubarSeparator />
      <MenubarItem>Print</MenubarItem>
    </MenubarContent>
  </MenubarMenu>
</Menubar>
```

## Key Features Demonstrated

- **Keyboard shortcuts** display via MenubarShortcut
- **Disabled states** using the `disabled` prop
- **Checkbox items** for toggleable options
- **Radio groups** for mutually exclusive selections
- **Nested submenus** using MenubarSub components
- **Inset styling** via the `inset` prop for visual hierarchy

## References

- [Radix UI Menubar Docs](https://www.radix-ui.com/docs/primitives/components/menubar)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/menubar#api-reference)
