---
source: https://supabase.com/design-system/docs/components/commandmenu
scraped: 2026-05-27
section: components
---

# Command Menu (cmdk) Component Documentation

## Component Description

The Command Menu is described as "a central command menu that acts as a control center with searchable actions." It provides a unified interface for users to access commands through keyboard shortcuts and search functionality.

## Key Shortcuts

- **Default**: `cmd-k` (can be customized via the `openKey` prop)
- **Example uses**: `cmd-j` to avoid conflicts with site-native menus

## Core Components & Imports

```typescript
import {
  CommandInput,
  CommandList,
  CommandMenu,
  CommandMenuTrigger as CommandMenuTriggerPrimitive,
  CommandProvider,
  useRegisterCommands,
} from 'ui-patterns/CommandMenu'
```

## Main Sub-Components

- **CommandProvider**: Wrapper component accepting `openKey` prop
- **CommandMenu**: Primary container component
- **CommandMenuTrigger**: Trigger element (wraps Button or custom trigger)
- **CommandMenuInput**: Search/input interface
- **CommandMenuList**: Container for command items

## Core Hook

**useRegisterCommands(category, commandsArray)**

Registers command groups with the following command object structure:

```typescript
{
  id: string
  name: string
  action?: () => void      // For action commands
  route?: string           // For navigation commands
  icon?: ReactNode         // Optional icon display
  experimental?: boolean   // Optional badge
  defaultHidden?: boolean  // Hidden until search match
  forceMounted?: boolean   // Always visible
  deps?: Array            // Dependencies for conditional rendering
}
```

## Available Examples

1. **With Experimental Badge**: Adds visual indicator to commands
2. **With Icon**: Display icons alongside command names
3. **With Default Hidden**: Commands appear only on search match
4. **With Force-Mount**: Commands always visible regardless of search
5. **With Conditional Commands**: Dynamic command registration based on state changes
6. **With Subpage**: Nested command hierarchies
7. **With Arbitrary Subpage**: Custom component loading for subpages

## Usage Notes

- Dependency equality uses Lodash `isEqual()` function
- Suitable use of `useCallback` or `useMemo` recommended for dependency management
- Search functionality filters visible commands in real-time
