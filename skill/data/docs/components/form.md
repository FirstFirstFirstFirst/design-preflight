---
source: https://supabase.com/design-system/docs/components/form
scraped: 2026-05-27
section: components
---

# React Hook Form - Complete Documentation

## Overview

React Hook Form is a library for building forms in React applications. Per the documentation, "Forms are tricky. They are one of the most common things you'll build in a web application, but also one of the most complex."

The component works in conjunction with Zod for schema validation and provides composable form elements built on Radix UI.

## Key Features

- Composable form components for accessible field construction
- `<FormField />` component for controlled form fields
- Form validation using Zod schema library
- Automatic accessibility handling and error messaging
- Unique ID generation via `React.useId()`
- Proper ARIA attribute application based on field states
- Full compatibility with Radix UI components
- Developer control over markup and styling

## Core Components

### Form Anatomy Structure
```
<Form>
  <FormField>
    <FormItem>
      <FormLabel />
      <FormControl>{field}</FormControl>
      <FormDescription />
      <FormMessage />
    </FormItem>
  </FormField>
</Form>
```

### Sub-Components

- **Form** - Root wrapper around react-hook-form
- **FormField** - Controlled field wrapper with render prop
- **FormItem** - Container for field layout
- **FormLabel** - Label element (use instead of standard Label)
- **FormControl** - Wraps the actual input component
- **FormDescription** - Helper text display
- **FormMessage** - Error message display

## Installation

```bash
npx shadcn-ui@latest add form
```

## Usage Steps

### 1. Create Schema

```typescript
'use client'

import { z } from 'zod'

const formSchema = z.object({
  username: z.string().min(2).max(50),
})
```

### 2. Define Form

```typescript
'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import { z } from 'zod'

const formSchema = z.object({
  username: z.string().min(2, {
    message: 'Username must be at least 2 characters.',
  }),
})

export function ProfileForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      username: '',
    },
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values)
  }
}
```

### 3. Build Form

```typescript
'use client'

import { zodResolver } from '@hookform/resolvers/zod'
import { useForm } from 'react-hook-form'
import { z } from 'zod'

import { Button } from '@/components/ui/button'
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form'
import { Input } from '@/components/ui/input'

const formSchema = z.object({
  username: z.string().min(2, {
    message: 'Username must be at least 2 characters.',
  }),
})

export function ProfileForm() {
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
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="username"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Username</FormLabel>
              <FormControl>
                <Input placeholder="shadcn" {...field} />
              </FormControl>
              <FormDescription>
                This is your public display name.
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit">Submit</Button>
      </form>
    </Form>
  )
}
```

## Accessibility Notes

- Forms are semantically correct and keyboard navigable
- ARIA attributes automatically applied based on field states
- Proper label associations via FormLabel
- Error messages linked to fields for screen readers
- **Important**: Use FormLabel component exclusively within Form components; do not use standard Label

## Validation

The approach provides "type-safe and validated" handling through Zod schema integration with react-hook-form's zodResolver.

## Related Component Examples

Additional usage examples available for:
- Checkbox
- Date Picker
- Input
- Radio Group
- Select
- Switch
- Textarea
- Combobox
