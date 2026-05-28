---
source: https://supabase.com/design-system/docs/components/table
scraped: 2026-05-27
section: components
---

# Table Component Documentation

## Component Description

The Table component is a responsive `<table>` element designed for presenting basic tabular data, typically contained within a Card component. It provides semantic HTML mapping with built-in accessibility features.

## Structure & Sub-Components

| Component | HTML Element | Purpose |
|-----------|--------------|---------|
| Table | `<table>` | Container |
| TableHeader | `<thead>` | Header section |
| TableBody | `<tbody>` | Data rows |
| TableFooter | `<tfoot>` | Summary/totals section |
| TableHead | `<th>` | Column header |
| TableRow | `<tr>` | Row container |
| TableCell | `<td>` | Data cell |
| TableCaption | `<caption>` | Table description |
| TableHeadSort | Enhanced header | Sortable column with indicators |

## Import Statement

```javascript
import {
  Card,
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableFooter,
  TableHead,
  TableHeader,
  TableRow,
  TableHeadSort,
  TanStackTableHeadSort,
} from 'ui'
```

## TableHeadSort Props

| Prop | Type | Description |
|------|------|-------------|
| `column` | `string` | Unique column identifier |
| `currentSort` | `string` | Format: `"column:order"` (e.g., `"name:asc"`) |
| `onSortChange` | `(column: string) => void` | Click handler callback |
| `children` | `ReactNode` | Column label text |
| `className` | `string` | Optional CSS classes |

## Key Features

**Layout Behavior**: Columns naturally fit content width unless specified. TableHead includes `whitespace-nowrap` to prevent text wrapping. Horizontal scrolling enabled on smaller screens via ShadowScrollArea wrapper.

**Caption Placement**: Must be the first child of Table, before TableBody, regardless of visual positioning.

**Sort Indicators**: Displays up arrow (ascending), down arrow (descending), or chevrons icon (unsorted, visible on hover).

## Usage Guidelines

### Basic Table

```jsx
<Card>
  <Table>
    <TableHeader>
      <TableRow>
        <TableHead>Column 1</TableHead>
        <TableHead>Column 2</TableHead>
      </TableRow>
    </TableHeader>
    <TableBody>
      <TableRow>
        <TableCell>Value 1</TableCell>
        <TableCell>Value 2</TableCell>
      </TableRow>
    </TableBody>
  </Table>
</Card>
```

### Empty State

Apply `[&>td]:hover:bg-inherit` class to prevent hover highlighting:

```jsx
<TableRow className="[&>td]:hover:bg-inherit">
  <TableCell colSpan={3}>
    <p className="text-sm text-foreground">No results found</p>
  </TableCell>
</TableRow>
```

Dim TableHead text to indicate absence of data.

### Sortable Columns

```jsx
<TableHead>
  <TableHeadSort 
    column="name" 
    currentSort={sort} 
    onSortChange={handleSortChange}
  >
    Name
  </TableHeadSort>
</TableHead>
```

For TanStack tables, use `TanStackTableHeadSort` for consistent visual treatment.

### Row Icons

```jsx
<TableHeader>
  <TableRow>
    <TableHead className="w-1">
      <span className="sr-only">Icon</span>
    </TableHead>
  </TableRow>
</TableHeader>
<TableBody>
  <TableRow>
    <TableCell className="w-1">
      <IconName size={16} className="text-foreground-muted" />
    </TableCell>
  </TableRow>
</TableBody>
```

Use `sr-only` class for screen reader labels on icon columns.

### Action Cells

Position actions in the last column. Use `hit-area-2` utility to increase tap targets by 8px without visual changes. Maintain `gap-x-2` spacing between adjacent actions.

For multiple actions: display one primary button plus an overflow menu.

### Cross-Links

Apply `text-link-table-cell` CSS class for interactive text maintaining tertiary appearance.

Avoid making entire rows interactive when using cross-links—keeps discrete elements scannable and prevents mis-tap confusion.

### Row-Level Navigation

```jsx
<TableRow 
  onClick={() => navigate(`/item/${id}`)}
  className="cursor-pointer"
>
  {/* cells */}
</TableRow>
```

**Requirements**:
- Keyboard accessibility with proper focus management
- Handle `Enter` and `Space` key presses
- Visual focus indicators using `inset-focus` class
- Support modifier keys (`Ctrl`/`Cmd`, middle-click) for new tabs
- Consider `createNavigationHandler` function for modifier key handling
- Avoid bubbling actions from row children

### Row Navigation with Actions

Combine row navigation with nested overflow menu. Add ChevronRight indicator signaling navigability. Ensure action button clicks stop event propagation.

## Accessibility Notes

- TableCaption should contain only a single text node
- Icon columns require `sr-only` labels in TableHead
- Use semantic HTML elements (`<thead>`, `<tbody>`, `<tfoot>`) for assistive technology recognition
- Maintain focus management for keyboard navigation
- Provide visual focus indicators for interactive rows
- Support standard keyboard interactions (Enter, Space)

## Related Patterns

Use Table for simple, static data with fixed rows. For complex scenarios with sorting, filtering, and pagination, refer to Data Table pattern in the Tables UI pattern documentation.
