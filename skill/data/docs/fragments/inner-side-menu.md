---
source: https://supabase.com/design-system/docs/fragments/inner-side-menu
scraped: 2026-05-27
section: fragments
---

# Inner Side Menu - Supabase Design System

## Overview

The InnerSideMenu component provides "a collapsible side menu with multiple sections." It enables developers to build organized navigation structures with expandable categories and menu items.

## Core Components

The component system includes:

- **InnerSideMenuCollapsible** - Wrapper around the Collapsible component
- **InnerSideMenuCollapsibleTrigger** - Expandable section header
- **InnerSideMenuCollapsibleContent** - Container for collapsible items
- **InnerSideMenuItem** - Individual menu link item
- **InnerSideMenuSeparator** - Visual divider between sections
- **InnerSideBarTitle** - Static section header (non-collapsible)
- **InnerSideMenuItemLoading** - Skeleton-based loading indicator
- **InnerSideBarFilters** - Filter wrapper container
- **InnerSideBarFilterSearchInput** - Search input field
- **InnerSideBarFilterSortDropdown** - Sorting dropdown menu
- **InnerSideBarEmptyPanel** - Empty state display

## Basic Usage

```jsx
import React from 'react'
import { Card } from 'ui'
import {
  InnerSideMenuCollapsible,
  InnerSideMenuCollapsibleContent,
  InnerSideMenuCollapsibleTrigger,
  InnerSideMenuItem,
  InnerSideMenuSeparator,
} from 'ui-patterns/InnerSideMenu'

export function InnerSideMenuDemo() {
  return (
    <Card className="min-w-60 bg-dash-sidebar py-4 flex flex-col gap-6 h-full">
      <InnerSideMenuCollapsible defaultOpen>
        <InnerSideMenuCollapsibleTrigger title="Projects">Hello</InnerSideMenuCollapsibleTrigger>
        <InnerSideMenuCollapsibleContent className="mt-2">
          <InnerSideMenuItem href="/">Dashboard</InnerSideMenuItem>
          <InnerSideMenuItem href="/">Team</InnerSideMenuItem>
          <InnerSideMenuItem href="/">Settings</InnerSideMenuItem>
        </InnerSideMenuCollapsibleContent>
      </InnerSideMenuCollapsible>
      <InnerSideMenuSeparator />
    </Card>
  )
}
```

## Usage Examples

### Collapsible Menus

```jsx
import {
  InnerSideMenuCollapsible,
  InnerSideMenuCollapsibleContent,
  InnerSideMenuCollapsibleTrigger,
  InnerSideMenuItem,
} from 'ui-patterns/InnerSideMenu'

function app() {
  return (
    <InnerSideMenuCollapsible key={category} defaultOpen>
      <InnerSideMenuCollapsibleTrigger title={category} />
      <InnerSideMenuCollapsibleContent>
        <InnerSideMenuItem href="/dashboard">Dashboard</InnerSideMenuItem>
        <InnerSideMenuItem href="/team">Team</InnerSideMenuItem>
        <InnerSideMenuItem href="/settings">Settings</InnerSideMenuItem>
      </InnerSideMenuCollapsibleContent>
    </InnerSideMenuCollapsible>
  )
}
```

### Static Titles

For non-collapsible sections, use `InnerSideBarTitle`:

```jsx
<InnerSideBarTitle>Projects</InnerSideBarTitle>
<div className="mt-2">
    <InnerSideMenuItem href="/dashboard">Dashboard</InnerSideMenuItem>
    <InnerSideMenuItem href="/team">Team</InnerSideMenuItem>
    <InnerSideMenuItem href="/settings">Settings</InnerSideMenuItem>
</div>
```

### Loading State

Use `InnerSideMenuItemLoading` for loading indicators. "This item is a wrapper around the Skeleton component, and also includes some y-padding so the items don't layout shift."

### Search Implementation

```jsx
<InnerSideBarFilters>
  <InnerSideBarFilterSearchInput
    name="search-input"
    placeholder="Search..."
    value={searchTerm}
    onChange={(e) => setSearchTerm(e.target.value)}
    aria-labelledby="Search items"
  />
</InnerSideBarFilters>
```

### Search with Sorting

```jsx
<InnerSideBarFilters>
  <InnerSideBarFilterSearchInput
    name="search-input"
    placeholder="Search..."
    value={searchTerm}
    onChange={(e) => setSearchTerm(e.target.value)}
    aria-labelledby="Search items"
  >
    <InnerSideBarFilterSortDropdown value={sort} onValueChange={(value) => setSort(value)}>
      <InnerSideBarFilterSortDropdownItem value="alphabetical">
        Sort Alphabetically
      </InnerSideBarFilterSortDropdownItem>
      <InnerSideBarFilterSortDropdownItem value="reverse">
        Sort Reverse Alphabetically
      </InnerSideBarFilterSortDropdownItem>
    </InnerSideBarFilterSortDropdown>
  </InnerSideBarFilterSearchInput>
</InnerSideBarFilters>
```

### Empty State

```jsx
<InnerSideBarEmptyPanel
  title="No functions found"
  description="Create your first serverless function to get started."
  actions={
    <Button type="default" onClick={createAction}>
      Create Function
    </Button>
  }
/>
```

With custom illustration:

```jsx
<InnerSideBarEmptyPanel
  title="No functions found"
  description="Create your first serverless function to get started."
  illustration={
    <figure>
      <svg>../</svg>
    </figure>
  }
/>
```

## Key Props

- **defaultOpen** - Controls initial expanded state of collapsible sections
- **title** - Section header text for collapsible triggers
- **href** - Navigation link for menu items
- **className** - Tailwind CSS classes for custom styling
- **value** - Selected value for sort dropdowns
- **onValueChange** - Callback for sort dropdown changes
- **actions** - React node for action buttons in empty states
- **illustration** - Custom React node for empty state graphics

## Notes

The component is designed for use within a Card container with sidebar styling classes like `bg-dash-sidebar`. Menu items use flexbox layout with gap spacing for visual separation.
