---
source: https://supabase.com/design-system/docs/fragments/page-header
scraped: 2026-05-27
section: fragments
---

# Page Header Component Documentation

## Overview

The Page Header is a compound component designed for organizing page-level context including title, description, and actions. According to the documentation, it serves as a "compound header for page context: optional icon, title, description, and aside actions."

## Component Structure

The Page Header consists of several sub-components that work together:

| Component | Purpose |
|-----------|---------|
| `PageHeader` | Root container with size variants |
| `PageHeaderMeta` | Wrapper for icon, summary, and aside elements |
| `PageHeaderIcon` | Optional icon positioned left of summary |
| `PageHeaderSummary` | Container grouping title and description |
| `PageHeaderTitle` | Page heading rendered as `h1` |
| `PageHeaderDescription` | Supporting text below title |
| `PageHeaderAside` | Page-level action buttons |

## Size Variants

Available sizes passed to `PageHeader`:
- `small`
- `default`
- `large`
- `full`

## Code Example

```jsx
import { Database } from 'lucide-react'
import { Button, Card } from 'ui'
import {
  PageHeader,
  PageHeaderAside,
  PageHeaderDescription,
  PageHeaderIcon,
  PageHeaderMeta,
  PageHeaderSummary,
  PageHeaderTitle,
} from 'ui-patterns/PageHeader'

export function PageHeaderDemo() {
  return (
    <div className="w-full">
      <PageHeader size="default">
        <PageHeaderMeta>
          <PageHeaderIcon>
            <Card className="flex h-14 w-14 shrink-0 items-center justify-center">
              <Database className="h-5 w-5" />
            </Card>
          </PageHeaderIcon>
          <PageHeaderSummary>
            <PageHeaderTitle>Demo Function</PageHeaderTitle>
            <PageHeaderDescription>
              Serverless functions that run at the edge with low latency and automatic scaling.
            </PageHeaderDescription>
          </PageHeaderSummary>
          <PageHeaderAside>
            <Button type="default" size="small">
              Secondary
            </Button>
            <Button type="primary" size="small">
              Deploy Function
            </Button>
          </PageHeaderAside>
        </PageHeaderMeta>
      </PageHeader>
    </div>
  )
}
```

## Usage Guidance

- Use `PageHeaderMeta` when the page requires a title block
- Position breadcrumbs via `Page Breadcrumbs` and navigation via `Page Nav` as siblings above this component
- Refer to Layout patterns documentation for hierarchical placement
- Legacy components `PageHeaderBreadcrumb` and `PageHeaderNavigationTabs` remain available but new implementations should use `Page Breadcrumbs` and `Page Nav`
