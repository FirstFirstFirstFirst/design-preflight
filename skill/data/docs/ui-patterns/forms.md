---
source: https://supabase.com/design-system/docs/ui-patterns/forms
scraped: 2026-05-27
section: ui-patterns
---

# Forms - Supabase Design System

## Overview

Forms in Supabase Studio follow consistent patterns across settings pages and side panels. This guide covers common form patterns and field types used throughout the design system.

## Page Layout

Forms in page layouts use `PageSection` components with `Card` containers. Fields employ `FormItemLayout` with `layout="flex-row-reverse"` for horizontal alignment.

### Supported Field Types

- **Text Input**: Single-line entry for short values
- **Password Input**: Masked secure text entry
- **Copyable Input**: Read-only with clipboard functionality
- **Number Input**: Numeric entry with min/max validation
- **Input with Units**: Numeric input paired with unit labels (e.g., MB)
- **Textarea**: Multi-line text input for longer content
- **Textarea with addon**: Multi-line input with character counter or additional info
- **Icon Upload**: Preview and upload for small images/avatars
- **File Upload**: Drag-and-drop or select files with preview
- **Switch**: Boolean toggle for on/off states
- **Checkbox**: Single or multiple boolean selections
- **Select (Dropdown)**: Single selection from list
- **Multi-Select**: Multiple selections from list
- **Radio Group**: Mutually exclusive options with descriptions
- **Date Picker**: Calendar popover for date selection
- **Field Array**: Dynamic list for single-value rows
- **Key/Value Field Array**: Dynamic list for paired text entries
- **Action Field**: Buttons or links for navigation/actions

## Side Panel (Sheet) Layout

Forms in side panels use `FormItemLayout` with:
- `layout="horizontal"` for wider panels
- `layout="vertical"` for panels sized `sm` or smaller

Forms wrap in `Sheet` component with `SheetContent`, `SheetHeader`, `SheetSection`, and `SheetFooter`.

## Field Arrays

### Single Value Field Array
Use for repeated single-value rows like redirect URIs. Managed by `react-hook-form` with props:
- `control`: Form control instance
- `name`: Field name in schema
- `valueFieldName`: Property name for value
- `createEmptyRow()`: Function returning empty row object
- `placeholder`: Input placeholder text
- `addLabel`: Button text to add rows
- `removeLabel`: Button text to remove rows

### Key/Value Field Array
Use for repeated text pairs (headers, parameters, config). Props include:
- `control`: Form control instance
- `name`: Field name in schema
- `keyFieldName`: Property name for key
- `valueFieldName`: Property name for value
- `createEmptyRow()`: Function returning empty row
- `keyPlaceholder`: Placeholder for key input
- `valuePlaceholder`: Placeholder for value input
- `addLabel`: Button text to add rows
- `removeLabel`: Button text to remove rows

Keep validation in form schema or shared helpers, not component.

## Best Practices

1. **Always use FormItemLayout**: Avoids manual composition of `FormItem`, `FormLabel`, `FormMessage`, and `FormDescription`.

2. **Layout selection strategy**:
   - Page layouts: `layout="flex-row-reverse"`
   - Wider side panels: `layout="horizontal"`
   - Narrow side panels: `layout="vertical"`

3. **Wrap inputs in FormControl_Shadcn_**: Ensures proper form integration.

4. **Group with Cards**: Use `Card` with `CardContent` and `CardFooter` for sectioning.

5. **Manage dirty state**: Display cancel buttons and disable save based on `form.formState.isDirty`. Destructure from `formState` property.

6. **Error handling**: Use mutations with `onSuccess` and `onError` callbacks showing toast notifications.

7. **Loading states**: Display loading on submit buttons via `loading` prop.

8. **External submit buttons**: Reference form via ID using button's `form` prop.

## Component Dependencies

Key imports for forms include:
- `zodResolver` from `@hookform/resolvers/zod`
- `useForm` from `react-hook-form`
- Form components from `ui` package
- `FormItemLayout` from `ui-patterns/form`
- `SingleValueFieldArray` and `KeyValueFieldArray` from `ui-patterns/form`
- `MultiSelector` components from `ui-patterns/multi-select`
- `PageSection` components from `ui-patterns/PageSection`
