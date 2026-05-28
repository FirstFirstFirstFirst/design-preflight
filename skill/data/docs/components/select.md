---
source: https://supabase.com/design-system/docs/components/select
scraped: 2026-05-27
section: components
---

# Select Component Documentation

## Component Description
The Select component presents a list of options for users to choose from, activated through a button trigger. It's built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add select
```

## Import Statement

```typescript
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
```

## Sub-Components

- **Select**: Root wrapper component
- **SelectTrigger**: Button that opens the dropdown menu
- **SelectValue**: Displays the selected value or placeholder text
- **SelectContent**: Container for dropdown menu items
- **SelectGroup**: Groups related items together
- **SelectLabel**: Labels a group of items
- **SelectItem**: Individual selectable option

## Basic Usage Example

```typescript
<Select>
  <SelectTrigger className="w-[180px]">
    <SelectValue placeholder="Theme" />
  </SelectTrigger>
  <SelectContent>
    <SelectItem value="light">Light</SelectItem>
    <SelectItem value="dark">Dark</SelectItem>
    <SelectItem value="system">System</SelectItem>
  </SelectContent>
</Select>
```

## Grouped Items Example

```typescript
<Select>
  <SelectTrigger className="w-[180px]">
    <SelectValue placeholder="Select a fruit" />
  </SelectTrigger>
  <SelectContent>
    <SelectGroup>
      <SelectLabel>Fruits</SelectLabel>
      <SelectItem value="apple">Apple</SelectItem>
      <SelectItem value="banana">Banana</SelectItem>
      <SelectItem value="blueberry">Blueberry</SelectItem>
      <SelectItem value="grapes">Grapes</SelectItem>
      <SelectItem value="pineapple">Pineapple</SelectItem>
    </SelectGroup>
  </SelectContent>
</Select>
```

## Available Variants

- **Scrollable**: Supports long lists with scrolling capability
- **Form**: Integrates with form submissions

## External References

- [Radix UI Select Documentation](https://www.radix-ui.com/docs/primitives/components/select)
- [Radix UI API Reference](https://www.radix-ui.com/docs/primitives/components/select#api-reference)
