---
source: https://supabase.com/design-system/docs/components/navigation-menu
scraped: 2026-05-27
section: components
---

# Navigation Menu Component

## Description

"A collection of links for navigating websites." This component is built on Radix UI's navigation menu primitive and integrates with Tailwind CSS styling.

## Installation

```bash
npx shadcn-ui@latest add navigation-menu
```

## Imports

```typescript
import {
  NavigationMenu,
  NavigationMenuContent,
  NavigationMenuIndicator,
  NavigationMenuItem,
  NavigationMenuLink,
  NavigationMenuList,
  NavigationMenuTrigger,
  NavigationMenuViewport,
} from '@/components/ui/navigation-menu'
```

## Basic Usage

```tsx
<NavigationMenu>
  <NavigationMenuList>
    <NavigationMenuItem>
      <NavigationMenuTrigger>Item One</NavigationMenuTrigger>
      <NavigationMenuContent>
        <NavigationMenuLink>Link</NavigationMenuLink>
      </NavigationMenuContent>
    </NavigationMenuItem>
  </NavigationMenuList>
</NavigationMenu>
```

## Core Sub-Components

- **NavigationMenu**: Container wrapper
- **NavigationMenuList**: List container for menu items
- **NavigationMenuItem**: Individual menu item wrapper
- **NavigationMenuTrigger**: Clickable trigger element
- **NavigationMenuContent**: Content panel revealed by trigger
- **NavigationMenuLink**: Link element within content
- **NavigationMenuViewport**: Viewport for positioning content panels
- **NavigationMenuIndicator**: Visual indicator

## Key Features & Utilities

### navigationMenuTriggerStyle()

Helper function applying correct styling to triggers, particularly useful with Next.js `<Link />` component.

```typescript
import { navigationMenuTriggerStyle } from '@/components/ui/navigation-menu'
```

```tsx
<NavigationMenuItem>
  <Link href="/docs" legacyBehavior passHref>
    <NavigationMenuLink className={navigationMenuTriggerStyle()}>
      Documentation
    </NavigationMenuLink>
  </Link>
</NavigationMenuItem>
```

## Advanced Examples

### Horizontal Scrolling Menu

Combines `ScrollArea` with custom viewport positioning:

```tsx
<NavigationMenu renderViewport={false}>
  <ScrollArea>
    <NavigationMenuList>
      {/* menu items */}
    </NavigationMenuList>
    <ScrollBar />
  </ScrollArea>
  <NavigationMenuViewport containerProps={{ className: 'w-full' }} />
</NavigationMenu>
```

**Key props:**
- `renderViewport={false}`: Prevents automatic viewport rendering
- `containerProps`: Styles the inner viewport container

## Related Resources

- [Radix UI Documentation](https://www.radix-ui.com/docs/primitives/components/navigation-menu)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/navigation-menu#api-reference)
- Client-side routing guidance available in Radix documentation
