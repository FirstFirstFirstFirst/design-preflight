---
source: https://supabase.com/design-system/docs/fragments/page-nav
scraped: 2026-05-27
section: fragments
---

# Page Nav Component

## Overview

The Page Nav component serves as a "full-width sub-navigation row for page chrome, positioned below breadcrumbs and outside PageHeader."

## Usage

### Import

```javascript
import { NavMenu, NavMenuItem } from 'ui'
import { PageNav } from 'ui-patterns/PageNav'
```

### Basic Example

```jsx
<PageNav>
  <NavMenu>
    <NavMenuItem active>Overview</NavMenuItem>
    <NavMenuItem>Logs</NavMenuItem>
  </NavMenu>
</PageNav>
```

### Interactive Demo

```javascript
'use client'
 
import { useState } from 'react'
import { NavMenu, NavMenuItem } from 'ui'
import { PageNav } from 'ui-patterns/PageNav'
 
const pages = [
  { id: 'overview', label: 'Overview' },
  { id: 'logs', label: 'Logs' },
  { id: 'settings', label: 'Settings' },
] as const
 
export function PageNavDemo() {
  const [activePage, setActivePage] = useState<(typeof pages)[number]['id']>('overview')
 
  return (
    <div className="w-full">
      <PageNav>
        <NavMenu>
          {pages.map((page) => (
            <NavMenuItem key={page.id} active={activePage === page.id}>
              <button
                type="button"
                aria-pressed={activePage === page.id}
                className="h-full cursor-pointer appearance-none bg-transparent text-inherit"
                onClick={() => setActivePage(page.id)}
              >
                {page.label}
              </button>
            </NavMenuItem>
          ))}
        </NavMenu>
      </PageNav>
    </div>
  )
}
```

## Sub-components

- **PageNav** — bordered, full-width container for NavMenu tab navigation

## Implementation Notes

PageNav utilizes PageContainer with `size="full"` for width and padding control. It operates independently of PageHeader. Position it directly beneath PageBreadcrumbs and outside PageHeader. Legacy implementations may reference `PageHeaderNavigationTabs` available on PageHeader.
