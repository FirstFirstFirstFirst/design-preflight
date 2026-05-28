---
source: https://supabase.com/design-system/docs/fragments/filter-bar
scraped: 2026-05-27
section: fragments
---

# Filter Bar Component Documentation

## Overview

The Filter Bar is "an advanced filtering component with support for multiple conditions and operators." It enables complex data filtering through a user-friendly interface supporting multiple field types and dynamic options.

## Core Features

- Multiple filter conditions with logical operators (AND/OR)
- Support for string, number, date, and boolean types
- Static and async option loading
- Custom components for specialized inputs
- Free-form text search capability
- Custom actions (AI filtering, saved queries)
- Loading states

## FilterProperty Interface

```typescript
interface FilterProperty {
  label: string
  name: string
  type: 'string' | 'number' | 'date' | 'boolean'
  operators: string[]
  options?: string[] | ((search?: string) => Promise<string[]> | string[])
}
```

## FilterGroup Interface

```typescript
interface FilterGroup {
  logicalOperator: 'AND' | 'OR'
  conditions: (FilterCondition | FilterGroup)[]
}
```

## FilterCondition Interface

```typescript
interface FilterCondition {
  propertyName: string
  value: string | number | boolean | Date
  operator: string
}
```

## Component Props

| Prop | Type | Description |
|------|------|-------------|
| filterProperties | FilterProperty[] | Array of properties available for filtering |
| filters | FilterGroup | Current filter state |
| onFilterChange | (filters: FilterGroup) => void | Triggered when filters change |
| freeformText | string | Current search text value |
| onFreeformTextChange | (text: string) => void | Triggered when search text changes |
| actions | FilterBarAction[]? | Optional custom actions in property menu |
| isLoading | boolean? | Dims bar during processing |

## Basic Usage Example

```typescript
const filterProperties = [
  {
    label: 'Name',
    name: 'name',
    type: 'string',
    operators: ['=', '!=', 'CONTAINS', 'STARTS WITH', 'ENDS WITH'],
  },
  {
    label: 'Status',
    name: 'status',
    type: 'string',
    options: ['active', 'inactive', 'pending'],
    operators: ['=', '!='],
  },
]

export function FilterDemo() {
  const [filters, setFilters] = useState<FilterGroup>(initialFilters)
  const [freeformText, setFreeformText] = useState('')

  return (
    <FilterBar
      filterProperties={filterProperties}
      freeformText={freeformText}
      onFreeformTextChange={setFreeformText}
      filters={filters}
      onFilterChange={setFilters}
    />
  )
}
```

## Custom Actions Implementation

Custom actions receive the current input value and active group path for integration with external services:

```typescript
const actions = [
  {
    value: 'ai-filter',
    label: 'Filter by AI',
    onSelect: async (inputValue, { path }) => {
      const response = await fetch('/api/filter-ai', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ prompt: inputValue, path }),
      })
      const group = (await response.json()) as FilterGroup
      setFilters((prev) => updateGroupAtPath(prev, path, group))
    },
  },
]
```

## Supported Operators by Type

**String operators:** =, !=, CONTAINS, STARTS WITH, ENDS WITH

**Number operators:** =, !=, >, <, >=, <=

**Date operators:** =, !=, >, <, >=, <=

**Options support:** Static arrays or async functions returning filtered results

## Advanced Features

The component supports custom option components for specialized input types (date pickers, custom value selectors). Complex nested filter groups enable sophisticated query construction through recursive condition structures.
