---
source: https://supabase.com/design-system/docs/ui-patterns/tables
scraped: 2026-05-27
section: ui-patterns
---

# Tables - Supabase Design System

## Overview

The Tables section provides guidance on displaying structured data in rows and columns. As stated in the documentation, "Tables are a fundamental pattern for displaying structured data in rows and columns."

## Three Main Table Patterns

The design system offers three distinct approaches:

1. **Table** - Low-level presentational component for simple, static data
2. **Data Table** - Feature-rich pattern built on Table and TanStack Table
3. **Data Grid** - Separate implementation for highly interactive, spreadsheet-like surfaces

## Table Component

**Use Table when:**
- Simple, static display is needed
- No filtering or complex behavior is required
- Displaying fixed, known numbers of rows
- Data is primarily read-only

**Example structure includes:**
- TableCaption
- TableHeader/TableHead
- TableBody/TableCell
- TableFooter
- TableRow

## Data Table Pattern

**Use Data Table when:**
- Sorting, pagination, filtering, search, or row actions are needed
- TanStack-powered behavior with table semantics is desired
- Displaying large datasets requiring pagination
- Row selection is required

**Features:**
- Client-side filtering
- Column visibility controls
- Sortable headers with three-state cycling
- Per-row selection checkboxes
- Pagination controls
- Row action menus

## Data Grid Pattern

**Use Data Grid when:**
- Virtualization is needed
- Column resizing is required
- Spreadsheet-like editing functionality is necessary

Based on React Data Grid, this pattern suits "highly interactive, spreadsheet-like surfaces and very large datasets."

## Future Direction

The design system plans consolidating Data Table and Data Grid into a single component supporting virtualization, resizable columns, cell editors, and semantic HTML markup.
