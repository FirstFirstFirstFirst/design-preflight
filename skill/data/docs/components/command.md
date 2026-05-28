---
source: https://supabase.com/design-system/docs/components/command
scraped: 2026-05-27
section: components
---

# Command Component Documentation

## About
The `<Command />` component utilizes the "cmdk component by pacocoursey" for fast, composable command menu functionality in React applications.

## Installation

```bash
npx shadcn-ui@latest add command
```

## Import Statement

```typescript
import {
  Command,
  CommandDialog,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
  CommandSeparator,
  CommandShortcut,
} from '@/components/ui/command'
```

## Sub-Components

- **Command** - Root container component
- **CommandInput** - Search/input field with placeholder support
- **CommandList** - Scrollable container for command items
- **CommandEmpty** - Fallback message when no results match
- **CommandGroup** - Grouped section with heading
- **CommandItem** - Individual selectable command
- **CommandSeparator** - Visual divider between groups
- **CommandShortcut** - Keyboard shortcut display
- **CommandDialog** - Dialog wrapper variant

## Basic Usage Example

```tsx
<Command>
  <CommandInput placeholder="Type a command or search..." />
  <CommandList>
    <CommandEmpty>No results found.</CommandEmpty>
    <CommandGroup heading="Suggestions">
      <CommandItem>Calendar</CommandItem>
      <CommandItem>Search Emoji</CommandItem>
    </CommandGroup>
  </CommandList>
</Command>
```

## Dialog Pattern Example

```tsx
export function CommandMenu() {
  const [open, setOpen] = React.useState(false)
  
  React.useEffect(() => {
    const down = (e: KeyboardEvent) => {
      if (e.key === 'k' && (e.metaKey || e.ctrlKey)) {
        e.preventDefault()
        setOpen((open) => !open)
      }
    }
    document.addEventListener('keydown', down)
    return () => document.removeEventListener('keydown', down)
  }, [])
  
  return (
    <CommandDialog open={open} onOpenChange={setOpen}>
      <CommandInput placeholder="Type a command or search..." />
      <CommandList>
        <CommandEmpty>No results found.</CommandEmpty>
      </CommandList>
    </CommandDialog>
  )
}
```

## Related Components
- Combobox - For searchable selection patterns
