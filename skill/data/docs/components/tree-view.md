---
source: https://supabase.com/design-system/docs/components/tree-view
scraped: 2026-05-27
section: components
---

# Tree View Component Documentation

## Overview

The Tree View is an Accordion-based component that assembles functionality to create hierarchical tree structures. It's based on the `react-accessible-treeview` library by dgreene1.

**Key Resources:**
- [Official Docs](https://dgreene1.github.io/react-accessible-treeview/)
- [API Reference](https://dgreene1.github.io/react-accessible-treeview/docs/api)

## Installation

```typescript
import { flattenTree, TreeView, TreeViewItem } from 'ui'
```

## Core Components

### TreeView
Main wrapper component for the tree structure.

**Props:**
- `data`: Flattened tree structure (processed via `flattenTree()`)
- `aria-label`: Accessibility label for the tree
- `className`: CSS classes for styling
- `nodeRenderer`: Function to render individual tree nodes
- `multiSelect` (optional): Enable multi-select functionality
- `togglableSelect` (optional): Allow toggling selections
- `clickAction` (optional): Set to "EXCLUSIVE_SELECT" for specific selection behavior

### TreeViewItem
Individual node renderer component.

**Props:**
- `isExpanded`: Boolean indicating if node is expanded
- `isBranch`: Boolean indicating if node has children
- `isSelected`: Boolean indicating if node is selected
- `level`: Numeric depth level in tree
- `xPadding`: Horizontal padding value (pixels)
- `name`: Display text for the node
- `isEditing` (optional): Enables inline editing mode
- `{...getNodeProps()}`: Spreads node event handlers

## Data Structure

```typescript
const data = {
  name: 'root',
  children: [
    {
      name: 'Parent Item',
      children: [
        { name: 'Child Item' }
      ]
    }
  ]
}
```

## Usage Examples

### Basic Implementation
Simple flat or nested tree display with default rendering.

### With Nested Directories
Utilizes `children` property in data objects to create hierarchical structures with expandable/collapsible sections.

### With Inline Editing
Right-click functionality enables renaming nodes. The component accepts `isEditing` prop to display and focus an inline input field for modifications.

### With Multi-Selection
Configure with `multiSelect`, `togglableSelect`, and `clickAction="EXCLUSIVE_SELECT"` for checkbox-style multi-select functionality.

## Accessibility

Tree View components maintain semantic structure using the `react-accessible-treeview` library, which emphasizes keyboard navigation and screen reader compatibility through proper ARIA labels and roles.
