---
source: https://supabase.com/design-system/docs/components/field
scraped: 2026-05-27
section: components
---

# Field Component Documentation

## Component Overview

The Field component is designed to "Combine labels, controls, and help text to compose accessible form fields and grouped inputs."

## Installation

```bash
npx shadcn@latest add field
```

## Core Imports

```javascript
import {
  Field,
  FieldContent,
  FieldDescription,
  FieldError,
  FieldGroup,
  FieldLabel,
  FieldLegend,
  FieldSeparator,
  FieldSet,
  FieldTitle,
} from '@/components/ui/field'
```

## Sub-Components & API Reference

### FieldSet
Container rendering semantic `fieldset` with spacing presets.
- **Props:** `className` (string)

### FieldLegend
Legend element for `FieldSet` with variant options.
- **Props:** 
  - `variant`: `"legend" | "label"` (default: `"legend"`)
  - `className`: string

### FieldGroup
Layout wrapper enabling container queries for responsive orientations.
- **Props:** `className` (string)

### Field
Core wrapper providing orientation control and validation styling.
- **Props:**
  - `orientation`: `"vertical" | "horizontal" | "responsive"` (default: `"vertical"`)
  - `className`: string
  - `data-invalid`: boolean

### FieldContent
Flex column grouping control and descriptions.
- **Props:** `className` (string)

### FieldLabel
Styled label for inputs and nested Field children.
- **Props:** 
  - `className`: string
  - `asChild`: boolean (default: `false`)

### FieldTitle
Title with label styling inside FieldContent.
- **Props:** `className` (string)

### FieldDescription
Helper text with automatic line balancing in horizontal layouts.
- **Props:** `className` (string)

### FieldSeparator
Visual divider with optional inline content.
- **Props:** `className` (string)

### FieldError
Accessible error container accepting children or error arrays.
- **Props:**
  - `errors`: `Array<{ message?: string } | undefined>`
  - `className`: string

## Key Features

**Structural Approach:** Anatomy follows label -> control -> description -> error patterns.

**Responsive Layouts:** Supports vertical (default), horizontal, and responsive orientations with container query support.

**Validation:** Use `data-invalid` on Field and `aria-invalid` on inputs; FieldError renders multiple messages as lists.

**Standards Support:** FieldError integrates with Standard Schema validators (Zod, Valibot, ArkType).

## Accessibility Notes

- FieldSet and FieldLegend provide semantic grouping for keyboard and assistive technology users
- Field outputs `role="group"` for nested control labeling
- FieldSeparator should be applied sparingly for clear section boundaries
