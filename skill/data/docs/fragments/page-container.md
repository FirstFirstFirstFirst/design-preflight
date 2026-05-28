---
source: https://supabase.com/design-system/docs/fragments/page-container
scraped: 2026-05-27
section: fragments
---

# Page Container Component

## Overview

The Page Container is a layout component that "provides consistent max-width and padding based on size variants" within the Supabase Design System.

## Usage

```jsx
import { PageContainer } from 'ui-patterns/PageContainer'

<PageContainer size="default">{/* Page content */}</PageContainer>
```

## Size Variants

The component supports four configurable size options:

| Variant | Max-Width | Use Case |
|---------|-----------|----------|
| `small` | 768px | Constrained layouts |
| `default` | 1200px | Standard page layouts |
| `large` | 1600px | Expanded content areas |
| `full` | None | Dense experiences (logs, tables, editors) |

## Guidance

The documentation recommends using `small` or `default` for most pages. Select `full` for "dense page experiences such as logs, code, editors, charts, or tables that need the viewport width."

## Code Example

```jsx
export function PageContainerDemo() {
  return (
    <div className="w-full space-y-4">
      <PageContainer size="small" className="bg-muted border rounded-lg p-4">
        <p>This is a page container with small size (768px max-width)</p>
      </PageContainer>
      <PageContainer size="default" className="bg-muted border rounded-lg p-4">
        <p>This is a page container with default size (1200px max-width)</p>
      </PageContainer>
      <PageContainer size="large" className="bg-muted border rounded-lg p-4">
        <p>This is a page container with large size (1600px max-width)</p>
      </PageContainer>
      <PageContainer size="full" className="bg-muted border rounded-lg p-4">
        <p>This is a page container with full size (no max-width)</p>
      </PageContainer>
    </div>
  )
}
```
