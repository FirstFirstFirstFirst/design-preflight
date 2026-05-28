---
source: https://supabase.com/design-system/docs/components/drawer
scraped: 2026-05-27
section: components
---

# Drawer Component Documentation

## About
The Drawer component is built on top of [Vaul](https://github.com/emilkowalski/vaul) by emilkowalski_. It provides a slide-out panel interface for React applications.

## Installation

```bash
npx shadcn-ui@latest add drawer
```

## Import

```typescript
import {
  Drawer,
  DrawerClose,
  DrawerContent,
  DrawerDescription,
  DrawerFooter,
  DrawerHeader,
  DrawerTitle,
  DrawerTrigger,
} from '@/components/ui/drawer'
```

## Sub-Components

- **Drawer**: Root component wrapper
- **DrawerTrigger**: Element that opens the drawer
- **DrawerContent**: Container for drawer content
- **DrawerHeader**: Header section of the drawer
- **DrawerTitle**: Title text within the header
- **DrawerDescription**: Descriptive text within the header
- **DrawerFooter**: Footer section with actions
- **DrawerClose**: Button to close the drawer

## Basic Usage

```jsx
<Drawer>
  <DrawerTrigger>Open</DrawerTrigger>
  <DrawerContent>
    <DrawerHeader>
      <DrawerTitle>Are you absolutely sure?</DrawerTitle>
      <DrawerDescription>This action cannot be undone.</DrawerDescription>
    </DrawerHeader>
    <DrawerFooter>
      <Button>Submit</Button>
      <DrawerClose>
        <Button variant="outline">Cancel</Button>
      </DrawerClose>
    </DrawerFooter>
  </DrawerContent>
</Drawer>
```

## Examples

### Responsive Dialog
The Drawer component can be combined with the Dialog component to create responsive layouts that render as Dialog on desktop and Drawer on mobile devices.
