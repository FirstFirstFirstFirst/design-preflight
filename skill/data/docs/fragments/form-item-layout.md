---
source: https://supabase.com/design-system/docs/fragments/form-item-layout
scraped: 2026-05-27
section: fragments
---

# Form Item Layout - Complete Documentation

## Overview

The Form Item Layout is a helper component within the Supabase Design System that "provides a layout for form items." It simplifies form construction by automatically managing layout, labels, descriptions, and error messaging.

## Purpose

This component streamlines form field implementation by wrapping commonly-used form elements. Rather than manually composing `FormItem`, `FormLabel`, `FormMessage`, and `FormDescription` separately, developers can utilize this single component for consistent styling and layout.

## Core Usage

### Basic Structure

The component replaces manual composition:

**Without FormItemLayout:**
```typescript
<FormItem>
  <FormLabel>Username</FormLabel>
  <FormControl>
    <Input placeholder="shadcn" {...field} />
  </FormControl>
  <FormDescription>This is your public display name.</FormDescription>
  <FormMessage />
</FormItem>
```

**With FormItemLayout:**
```typescript
<FormItemLayout label="Username" description="This is your public display name">
  <FormControl>
    <Input placeholder="mildtomato" {...field} />
  </FormControl>
</FormItemLayout>
```

### Implementation Requirements

- "You must still use `FormControl` to wrap input fields"
- Integrate with `react-hook-form` for form management
- Compatible with `zodResolver` for schema validation

## Complete Code Example

```typescript
import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import { Button, Form, FormControl, FormField } from 'ui'
import { Input } from 'ui-patterns/DataInputs/Input'
import { FormItemLayout } from 'ui-patterns/form/FormItemLayout/FormItemLayout'
import { z } from 'zod'

const formSchema = z.object({
  username: z.string().min(2, {
    message: 'Username must be at least 2 characters.',
  }),
})

export function FormItemLayoutDemo() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      username: '',
    },
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values)
  }

  return (
    <Form {...form}>
      <form className="w-96 flex flex-col gap-3" onSubmit={form.handleSubmit(onSubmit)}>
        <FormField
          name="username"
          control={form.control}
          render={({ field }) => (
            <FormItemLayout
              label="Username"
              description="This is your public display name"
              labelOptional="optional"
            >
              <FormControl>
                <Input placeholder="mildtomato" {...field} />
              </FormControl>
            </FormItemLayout>
          )}
        />
        <Button size="small" type="secondary" htmlType="submit">
          Submit
        </Button>
      </form>
    </Form>
  )
}
```

## Props & Customization

### Available Props

| Prop | Type | Description |
|------|------|-------------|
| `label` | `string` | Primary label text |
| `description` | `string` | Helper text beneath input |
| `labelOptional` | `string` | Optional indicator text |
| `beforeLabel` | `React.Node \| string` | Content before label |
| `afterLabel` | `React.Node \| string` | Content after label |
| `children` | `React.ReactNode` | Form control elements |

### Layout Variants

**Vertical Layout (Default)**
- Standard form field arrangement
- Label above input
- Description below input
- Optimal for most use cases

**Horizontal Layout**
- Useful within `<SidePanel/>` or `<Sheet/>` components
- Label and input positioned side-by-side
- Space-efficient for modal contexts

### Component Replacement

"The styling and layout of these components can be customized by passing in the components as props." The replaceable components include `FormItem`, `FormLabel`, `FormMessage`, and `FormDescription`.

## Supported Form Controls

The component works with various input types:

- **Select** - Dropdown selection fields
- **Switch** - Toggle controls
- **Checkbox** - Single and multiple selections
- **Input** - Text and standard inputs
- **Textarea** - Multi-line text entry

### Checkbox Array Example

The component supports rendering lists of checkboxes, enabling multi-select functionality within a single FormItemLayout.

## Label Customization

### Before Label
Insert content before the label using the `beforeLabel` prop to add icons, badges, or other visual indicators.

### After Label
The `afterLabel` prop allows trailing content, commonly used for optional indicators or supplementary information.

### Optional Indicator
The `labelOptional` prop displays optional field indicators alongside the label text.

## Design Principles

- Maintains consistency with react-hook-form conventions
- Reduces boilerplate code in form implementations
- Provides automatic error message handling
- Preserves accessibility through proper semantic structure
- Compatible with Tailwind CSS for custom styling
