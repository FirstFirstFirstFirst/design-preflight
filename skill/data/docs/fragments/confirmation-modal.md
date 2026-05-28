---
source: https://supabase.com/design-system/docs/fragments/confirmation-modal
scraped: 2026-05-27
section: fragments
---

# Confirmation Modal - Complete Documentation

## Overview

The Confirmation Modal is a dialog component designed for confirmation flows requiring additional context beyond simple yes/no decisions. It's built on the Dialog component and provides a prop-based API for consistent confirmation patterns.

**When to use:** "A modal dialog for confirmations that require additional context or simple interaction."

## Use Cases

According to the documentation, employ Confirmation Modal when users need extra context to make decisions, such as explanatory copy, callouts, or small form elements, and the action isn't so destructive that it requires typed confirmation.

## When NOT to Use

- **Alert Dialog preferred:** For critical confirmations expressible as a single short paragraph
- **Text Confirm Dialog preferred:** For highly destructive actions requiring explicit typed intent
- **DiscardChangesConfirmationDialog preferred:** For dirty-form dismissal in dialogs/sheets (use `useConfirmOnClose` instead of creating custom wrappers)

## Guidelines

- **Suitable for moderate complexity** requiring extra body content (multiple paragraphs, callouts, simple controls)
- **Not the default critical confirmation** pattern
- **Avoid for standard dirty-form dismissal** to maintain consistency across dialogs
- **Not for critical destruction** or irreversible high-risk actions
- **Keep content focused** on decision-making context only
- **Provide clear action labels** describing each choice's outcome

## Props Reference

| Prop | Type | Description |
|------|------|-------------|
| `visible` | boolean | Controls open state |
| `title` | string | Dialog title |
| `description` | string | Optional description |
| `variant` | 'default' \| 'destructive' \| 'warning' | Visual variant |
| `loading` | boolean | Loading state |
| `onConfirm` | function | Confirm handler |
| `onCancel` | function | Cancel handler |
| `alert` | object | Optional callout (Admonition) |
| `children` | ReactNode | Additional content |
| `size` | string | Dialog size |
| `confirmLabel` | string | Confirm button text |
| `confirmLabelLoading` | string | Confirm button text during loading |
| `cancelLabel` | string | Cancel button text |

## Code Examples

### Basic Usage

```jsx
'use client'

import { useState } from 'react'
import { Button } from 'ui'
import ConfirmationModal from 'ui-patterns/Dialogs/ConfirmationModal'

export default function ConfirmationModalDemo() {
  const [visible, setVisible] = useState(false)

  return (
    <>
      <Button onClick={() => setVisible(true)}>Show Confirmation Modal</Button>

      <ConfirmationModal
        visible={visible}
        size="small"
        title="Resume this project"
        confirmLabel="Resume"
        confirmLabelLoading="Resuming"
        cancelLabel="Cancel"
        onConfirm={() => {
          setVisible(false)
        }}
        onCancel={() => {
          setVisible(false)
        }}
      >
        This will resume the project and restart any paused processes.
      </ConfirmationModal>
    </>
  )
}
```

### Advanced Example with Form

```jsx
import { useState } from 'react'
import { useForm } from 'react-hook-form'
import {
  Button,
  Form,
  FormControl,
  FormField,
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from 'ui'
import ConfirmationModal from 'ui-patterns/Dialogs/ConfirmationModal'
import { FormItemLayout } from 'ui-patterns/form/FormItemLayout/FormItemLayout'

export function ConfirmationModalDemo() {
  const [visible, setVisible] = useState(false)
  const form = useForm({
    defaultValues: {
      postgresVersion: '17.6.1.054',
    },
  })

  return (
    <>
      <Button type="default" onClick={() => setVisible(!visible)}>
        Show Confirmation Modal
      </Button>
      <ConfirmationModal
        visible={visible}
        size="small"
        title="Resume this project"
        onCancel={() => setVisible(false)}
        onConfirm={() => {}}
        loading={false}
        confirmLabel="Resume"
        confirmLabelLoading="Resuming"
        cancelLabel="Cancel"
      >
        <div>
          <p className="block text-sm pb-4 border-b border-border-muted">
            Your project's data will be restored to when it was initially paused.
          </p>
          <div className="pt-4">
            <Form {...form}>
              <FormField
                control={form.control}
                name="postgresVersion"
                render={({ field }) => (
                  <FormItemLayout layout="vertical" label="Postgres version">
                    <FormControl>
                      <Select value={field.value} onValueChange={field.onChange}>
                        <SelectTrigger>
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="17.6.1.054">17.6.1.054</SelectItem>
                          <SelectItem value="17.6.1.055">17.6.1.055</SelectItem>
                        </SelectContent>
                      </Select>
                    </FormControl>
                  </FormItemLayout>
                )}
              />
            </Form>
          </div>
        </div>
      </ConfirmationModal>
    </>
  )
}
```

## Related Components

- **Dialog:** Base component underlying Confirmation Modal
- **Alert Dialog:** For short, critical confirmations
- **Text Confirm Dialog:** For highly destructive actions requiring typed intent
- **DiscardChangesConfirmationDialog:** For unsaved-changes patterns
