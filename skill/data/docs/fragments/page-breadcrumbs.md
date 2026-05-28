---
source: https://supabase.com/design-system/docs/fragments/page-breadcrumbs
scraped: 2026-05-27
section: fragments
---

# Page Breadcrumbs Documentation

## Overview

The Page Breadcrumbs component provides "a full-width breadcrumb row for page chrome, placed above PageHeader and page content."

## Sub-components

- **PageBreadcrumbs** — bordered, full-width breadcrumb bar that wraps shadcn's Breadcrumb component
- **PageBreadcrumbsActions** — container for actions positioned on the right side of the breadcrumb row (passed via `actions` prop)

## Usage

```jsx
import { PageBreadcrumbs, PageBreadcrumbsActions } from 'ui-patterns/PageBreadcrumbs'

<PageBreadcrumbs
  actions={
    <PageBreadcrumbsActions>
      <Button type="primary" size="tiny">
        Create
      </Button>
    </PageBreadcrumbsActions>
  }
>
  <BreadcrumbList>{/* … */}</BreadcrumbList>
</PageBreadcrumbs>
```

## Implementation Notes

- The component uses `PageContainer` with `size="full"` for width and padding
- It does not depend on `PageHeader`
- Should be positioned as a sibling element above `PageHeader` and page content, not nested within `PageHeader`
- For legacy pages that nest breadcrumbs inside `PageHeader`, use `PageHeaderBreadcrumb` instead
