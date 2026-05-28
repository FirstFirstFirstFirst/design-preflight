---
source: https://supabase.com/design-system/docs/components/breadcrumb
scraped: 2026-05-27
section: components
---

# Breadcrumb Component Documentation

## Component Description
The Breadcrumb component "displays the path to the current resource using a hierarchy of links."

## Installation
```bash
npx shadcn-ui@latest add breadcrumb
```

## Imports
```typescript
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb'
```

## Basic Usage
```jsx
<Breadcrumb>
  <BreadcrumbList>
    <BreadcrumbItem>
      <BreadcrumbLink href="/">Home</BreadcrumbLink>
    </BreadcrumbItem>
    <BreadcrumbSeparator />
    <BreadcrumbItem>
      <BreadcrumbLink href="/components">Components</BreadcrumbLink>
    </BreadcrumbItem>
    <BreadcrumbSeparator />
    <BreadcrumbItem>
      <BreadcrumbPage>Breadcrumb</BreadcrumbPage>
    </BreadcrumbItem>
  </BreadcrumbList>
</Breadcrumb>
```

## Variants

### Custom Separator
Customize the separator using child components like icons.

### Dropdown
Compose with `DropdownMenu` for interactive breadcrumb items.

### Collapsed
Use `BreadcrumbEllipsis` component for lengthy breadcrumb navigation.

### Link Component
Apply `asChild` prop on `BreadcrumbLink` for custom routing library integration.

### Responsive
Combines `BreadcrumbEllipsis`, `DropdownMenu`, and `Drawer` for adaptive desktop/mobile display.

## Sub-Components
- `Breadcrumb`
- `BreadcrumbList`
- `BreadcrumbItem`
- `BreadcrumbLink`
- `BreadcrumbPage`
- `BreadcrumbSeparator`
- `BreadcrumbEllipsis`
