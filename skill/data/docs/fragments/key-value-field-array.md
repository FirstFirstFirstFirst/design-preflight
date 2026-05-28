---
source: https://supabase.com/design-system/docs/fragments/key-value-field-array
scraped: 2026-05-27
section: fragments
---

# Key/Value Field Array Component Documentation

## Overview
The Key/Value Field Array is a form fragment designed for handling repeated text key/value pairs within React applications using `react-hook-form`.

## Purpose
"A shared form fragment for repeated text key/value pairs."

## Core Usage

### Import Statement
```typescript
import { KeyValueFieldArray } from 'ui-patterns/form/KeyValueFieldArray/KeyValueFieldArray'
import { getKeyValueFieldArrayValidationIssues } from 'ui-patterns/form/KeyValueFieldArray/validation'
```

### Basic Implementation
```jsx
<KeyValueFieldArray
  control={form.control}
  name="headers"
  keyFieldName="name"
  valueFieldName="value"
  createEmptyRow={() => ({ name: '', value: '' })}
  keyPlaceholder="Header name"
  valuePlaceholder="Header value"
  addLabel="Add header"
/>
```

## Complete Example
```typescript
import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import { Button, Form } from 'ui'
import { FormItemLayout } from 'ui-patterns/form/FormItemLayout/FormItemLayout'
import { KeyValueFieldArray } from 'ui-patterns/form/KeyValueFieldArray/KeyValueFieldArray'
import { getKeyValueFieldArrayValidationIssues } from 'ui-patterns/form/KeyValueFieldArray/validation'
import { z } from 'zod'

const formSchema = z
  .object({
    headers: z.array(
      z.object({
        name: z.string().trim(),
        value: z.string().trim(),
      })
    ),
  })
  .superRefine((data, ctx) => {
    getKeyValueFieldArrayValidationIssues({
      rows: data.headers,
      keyFieldName: 'name',
      valueFieldName: 'value',
      keyRequiredMessage: 'Header name is required',
      valueRequiredMessage: 'Header value is required',
    }).forEach((issue) => {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        message: issue.message,
        path: ['headers', ...issue.path],
      })
    })
  })

export function KeyValueFieldArrayDemo() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      headers: [{ name: 'x-client-info', value: 'studio-docs' }],
    },
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values)
  }

  return (
    <Form {...form}>
      <form className="w-full max-w-2xl" onSubmit={form.handleSubmit(onSubmit)}>
        <FormItemLayout
          label="HTTP headers"
          description="Use KeyValueFieldArray for repeated text key/value pairs."
        >
          <KeyValueFieldArray
            control={form.control}
            name="headers"
            keyFieldName="name"
            valueFieldName="value"
            createEmptyRow={() => ({ name: '', value: '' })}
            keyPlaceholder="Header name"
            valuePlaceholder="Header value"
            addLabel="Add header"
            removeLabel="Remove header"
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

## Component Props

| Prop | Type | Purpose |
|------|------|---------|
| `control` | FormControl | React Hook Form control instance |
| `name` | string | Field array name |
| `keyFieldName` | string | Property name for key field |
| `valueFieldName` | string | Property name for value field |
| `createEmptyRow` | function | Factory function for blank rows |
| `keyPlaceholder` | string | Placeholder text for key input |
| `valuePlaceholder` | string | Placeholder text for value input |
| `addLabel` | string | Button text for adding rows |
| `removeLabel` | string | Button text for removing rows |

## Validation Approach

The component relies on consumer-managed validation through Zod schemas. The `getKeyValueFieldArrayValidationIssues` helper provides standardized validation:

- Fully empty rows function as drafts without triggering errors
- Partially filled rows display inline errors on incomplete fields
- Empty draft rows should be stripped before data persistence

```typescript
getKeyValueFieldArrayValidationIssues({
  rows: data.headers,
  keyFieldName: 'name',
  valueFieldName: 'value',
  keyRequiredMessage: 'Header name is required',
  valueRequiredMessage: 'Header value is required',
})
```

## Use Case Guidelines

**When to use Key/Value Field Array:**
- HTTP headers, query parameters, configuration entries
- Paired text-to-text field patterns
- Scenarios where row add/remove behavior is needed

**Alternatives:**
- Use Single Value Field Array for repeated singular values (redirect URIs)
- Build custom row components when rows contain mixed control types (text inputs paired with dropdowns)

## Integration Pattern

The component integrates seamlessly within `FormItemLayout` to inherit standard label, description, and message styling:

```jsx
<FormItemLayout
  label="HTTP headers"
  description="Use KeyValueFieldArray for repeated text key/value pairs."
>
  <KeyValueFieldArray {...props} />
</FormItemLayout>
```

## Key Features

- Owns row addition and removal operations
- Renders per-input form validation messages automatically
- Supports customizable placeholders and button labels
- Integrates with React Hook Form's field control system
- Pairs with Zod schema validation
