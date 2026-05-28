---
source: https://supabase.com/design-system/docs/components/pagination
scraped: 2026-05-27
section: components
---

# Pagination Component Documentation

## Overview
The Pagination component provides "page navigation, next and previous links" for navigating through paginated content.

## Installation

```bash
npx shadcn-ui@latest add pagination
```

## Imports

```javascript
import {
  Pagination,
  PaginationContent,
  PaginationEllipsis,
  PaginationItem,
  PaginationLink,
  PaginationNext,
  PaginationPrevious,
} from '@/components/ui/pagination'
```

## Sub-Components

- **Pagination** - Root wrapper component
- **PaginationContent** - Container for pagination items
- **PaginationItem** - Individual pagination element wrapper
- **PaginationLink** - Clickable page number link
- **PaginationPrevious** - Previous page navigation button
- **PaginationNext** - Next page navigation button
- **PaginationEllipsis** - Ellipsis indicator for skipped pages

## Basic Usage Example

```jsx
<Pagination>
  <PaginationContent>
    <PaginationItem>
      <PaginationPrevious href="#" />
    </PaginationItem>
    <PaginationItem>
      <PaginationLink href="#">1</PaginationLink>
    </PaginationItem>
    <PaginationItem>
      <PaginationEllipsis />
    </PaginationItem>
    <PaginationItem>
      <PaginationNext href="#" />
    </PaginationItem>
  </PaginationContent>
</Pagination>
```

## Next.js Integration

The `PaginationLink` component renders as an `<a>` tag by default. To use Next.js `Link` component, import and replace the anchor element in `pagination.tsx` with the Next.js Link component.
