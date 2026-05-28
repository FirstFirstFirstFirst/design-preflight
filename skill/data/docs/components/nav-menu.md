---
source: https://supabase.com/design-system/docs/components/nav-menu
scraped: 2026-05-27
section: components
---

# NavMenu Component Documentation

## Component Description
The NavMenu displays "a horizontal list of related views within a consistent context." It functions as sub-navigation within a PageLayout structure.

## Naming Consideration
The documentation notes: "This component is titled very similarly to the Navigation Menu component. Consider renaming it to something like TabMenu or UnderlineNav."

## Sub-Components
- **NavMenu**: Container component for the menu
- **NavMenuItem**: Individual menu item with `active` prop (boolean)

## Basic Usage
```javascript
import { NavMenu, NavMenuItem } from 'ui'

<NavMenu>
  <NavMenuItem active={true}>
    <Link href="#">Overview</Link>
  </NavMenuItem>
  <NavMenuItem active={false}>
    <Link href="#">Documentation</Link>
  </NavMenuItem>
</NavMenu>
```

## Code Example with Next.js
```javascript
import Link from 'next/link'
import { NavMenu, NavMenuItem } from 'ui'

export function NavMenuDemo() {
  return (
    <NavMenu>
      <NavMenuItem active={true}>
        <Link href="#">Overview</Link>
      </NavMenuItem>
      <NavMenuItem active={false}>
        <Link href="#">Invocations</Link>
      </NavMenuItem>
      <NavMenuItem active={false}>
        <Link href="#">Logs</Link>
      </NavMenuItem>
      <NavMenuItem active={false}>
        <Link href="#">Code</Link>
      </NavMenuItem>
    </NavMenu>
  )
}
```

## Variants
1. **With counter badges**: Displays numeric indicators (e.g., "Buckets 10") to show item counts within tabs
2. **With icons**: Includes icons for clearer content representation (all tabs should either have icons or none)

## Props
- **NavMenuItem.active** (boolean): Indicates the currently active menu item
