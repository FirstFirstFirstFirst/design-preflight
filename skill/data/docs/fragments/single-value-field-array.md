---
source: https://supabase.com/design-system/docs/fragments/single-value-field-array
scraped: 2026-05-27
section: fragments
---

# Single Value Field Array

## Overview

The Single Value Field Array is a form fragment component designed for repeated single text inputs within forms. It integrates with `react-hook-form` and manages row addition/removal behavior automatically.

## Usage

### Basic Implementation

```tsx
import { SingleValueFieldArray } from 'ui-patterns/form/SingleValueFieldArray/SingleValueFieldArray'

<SingleValueFieldArray
  control={form.control}
  name="redirectUris"
  valueFieldName="value"
  createEmptyRow={() => ({ value: '' })}
  placeholder="https://example.com/callback"
  addLabel="Add redirect URI"
/>
```

### Complete Example

```tsx
import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import { Button, Form } from 'ui'
import { FormItemLayout } from 'ui-patterns/form/FormItemLayout/FormItemLayout'
import { SingleValueFieldArray } from 'ui-patterns/form/SingleValueFieldArray/SingleValueFieldArray'
import { z } from 'zod'

const formSchema = z.object({
  redirectUris: z.array(
    z.object({
      value: z.string().url('Must be a valid URL'),
    })
  ),
})

export function SingleValueFieldArrayDemo() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      redirectUris: [{ value: 'https://example.com/callback' }],
    },
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values)
  }

  return (
    <Form {...form}>
      <form className="w-full max-w-2xl" onSubmit={form.handleSubmit(onSubmit)}>
        <FormItemLayout
          label="Redirect URIs"
          description="Use SingleValueFieldArray for repeated single-value rows."
        >
          <SingleValueFieldArray
            control={form.control}
            name="redirectUris"
            valueFieldName="value"
            createEmptyRow={() => ({ value: '' })}
            placeholder="https://example.com/callback"
            addLabel="Add redirect URI"
            removeLabel="Remove redirect URI"
            minimumRows={1}
          />
        </FormItemLayout>

        <div className="mt-4">
          <Button size="tiny" type="primary" htmlType="submit">
            Submit
          </Button>
        </div>
      </form>
    </Form>
  )
}
```

## Props

| Prop | Type | Description |
|------|------|-------------|
| `control` | Control | Form control from `react-hook-form` |
| `name` | string | Field array name in form schema |
| `valueFieldName` | string | Property name for individual row values |
| `createEmptyRow` | function | Factory function creating empty row objects |
| `placeholder` | string | Input placeholder text |
| `addLabel` | string | Label for the add button |
| `removeLabel` | string | Label for the remove button |
| `minimumRows` | number | Minimum number of rows required |

## When to Use It

**Use `SingleValueFieldArray` for:**
- Repeated single text values like redirect URIs and domains

**Use Key/Value Field Array instead when:**
- Each row requires two text inputs

**Build custom row UI when:**
- Rows mix different control types (text input paired with Select, etc.)

## Key Features

- Handles row add/remove behavior automatically
- Renders per-input form validation messages
- Composes within `FormItemLayout` for standard label, description, and message treatment
- Integrates seamlessly with `react-hook-form` and Zod validation
