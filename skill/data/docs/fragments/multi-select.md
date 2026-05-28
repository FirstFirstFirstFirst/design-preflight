---
source: https://supabase.com/design-system/docs/fragments/multi-select
scraped: 2026-05-27
section: fragments
---

# Multi Select Component Documentation

## Overview
The Multi Select is "a multiple selection component" from the Supabase Design System, enabling users to choose multiple options from a list.

## Component Structure

The Multi Select consists of these primary components:
- `MultiSelector` - Root wrapper managing state
- `MultiSelectorTrigger` - Display element showing selected items
- `MultiSelectorContent` - Container for dropdown options
- `MultiSelectorList` - List wrapper for items
- `MultiSelectorItem` - Individual selectable option
- `MultiSelectorInput` - Optional search functionality

## Import Statement

```javascript
import {
  MultiSelector,
  MultiSelectorContent,
  MultiSelectorItem,
  MultiSelectorTrigger,
} from 'ui-patterns/multi-select'
```

## Basic Usage Example

```javascript
import { useState } from 'react'
import {
  MultiSelector,
  MultiSelectorContent,
  MultiSelectorItem,
  MultiSelectorList,
  MultiSelectorTrigger,
} from 'ui-patterns/multi-select'

export function MultiSelectDemo() {
  const [selectedValues, setSelectedValues] = useState<string[]>([])

  const fruits = [
    { value: 'Apple', isDisabled: false },
    { value: 'Banana', isDisabled: false },
    { value: 'Cherry', isDisabled: false },
  ]

  return (
    <MultiSelector values={selectedValues} onValuesChange={setSelectedValues}>
      <MultiSelectorTrigger
        className="w-72"
        label="Select fruits"
        badgeLimit="wrap"
        showIcon={false}
      />
      <MultiSelectorContent>
        <MultiSelectorList>
          {fruits.map(({ value, isDisabled }) => (
            <MultiSelectorItem key={value} value={value} disabled={isDisabled}>
              {value}
            </MultiSelectorItem>
          ))}
        </MultiSelectorList>
      </MultiSelectorContent>
    </MultiSelector>
  )
}
```

## Key Props

### MultiSelectorTrigger
- `label` - Placeholder/label text
- `badgeLimit` - Controls badge display (number or "wrap")
- `showIcon` - Toggle icon visibility
- `mode` - Can be set to "inline-combobox" for search input
- `deletableBadge` - Enable badge removal from trigger

### MultiSelectorList
- `creatable` - Allow creating new options when no matches found

### MultiSelector
- `values` - Array of selected values
- `onValuesChange` - Callback when selection changes
- `open` - Control dropdown visibility
- `onOpenChange` - Callback for open state

## Variants & Examples

**Disabled Items**: Individual items can be disabled via the `disabled` prop

**Badge Combo Box**: Add `MultiSelectorInput` for search capabilities

**Badge Limit Wrapping**: Use `badgeLimit="wrap"` to wrap badges to next line

**Badge Limit Number**: Use `badgeLimit={2}` to show limited badges

**Deletable Badges**: Enable `deletableBadge` prop for badge removal

**Inline Search**: Use `mode="inline-combobox"` for integrated search field

**Dialog Integration**: Component works within dialog/modal contexts
