---
source: https://supabase.com/design-system/docs/fragments/text-confirm-dialog
scraped: 2026-05-27
section: fragments
---

# Text Confirm Dialog

## Overview

The Text Confirm Dialog is a modal component that implements a "speed bump" for destructive operations. It requires users to type an exact confirmation string before enabling the confirm action, wrapping Shadcn's Dialog component.

A modal dialog that adds a deliberate confirmation step for highly destructive actions.

## When to Use

**Recommended for:**
- Irreversible operations (deleting buckets, projects, critical resources)
- Actions requiring explicit user intent beyond a button click
- Situations where accidental triggering must be prevented

**Alternatives:**
- Use Alert Dialog or Confirmation Modal for non-destructive confirmations
- Consult the Modality pattern guide for appropriate dialog selection

## Props Reference

| Prop | Type | Description |
|------|------|-------------|
| `confirmString` | string | Exact string user must type (whitespace trimmed) |
| `confirmPlaceholder` | string | Placeholder text in confirmation input |
| `variant` | enum | Visual intent: `default`, `destructive`, or `warning` |
| `visible` | boolean | Controls dialog visibility |
| `size` | string | Dialog size (e.g., "small") |
| `title` | string | Dialog heading |
| `confirmLabel` | string | Button text for confirm action |
| `loading` | boolean | Loading state indicator |
| `onConfirm` | function | Callback when confirmed |
| `onCancel` | function | Callback when cancelled |
| `children` | ReactNode | Optional body content |

## Basic Implementation

```tsx
'use client'

import { useState } from 'react'
import { Button } from 'ui'
import TextConfirmModal from 'ui-patterns/Dialogs/TextConfirmModal'

export default function TextConfirmDialogDemo() {
  const [visible, setVisible] = useState(false)
  const bucketName = 'profile-pictures'

  return (
    <>
      <Button type="danger" onClick={() => setVisible(true)}>
        Show Text Confirm Dialog
      </Button>

      <TextConfirmModal
        visible={visible}
        size="small"
        variant="destructive"
        title="Delete bucket"
        confirmPlaceholder={bucketName}
        confirmString={bucketName}
        confirmLabel="Delete bucket"
        onConfirm={() => setVisible(false)}
        onCancel={() => setVisible(false)}
      >
        <p className="text-sm">
          Your bucket <span className="font-medium">{bucketName}</span> will be permanently deleted.
        </p>
      </TextConfirmModal>
    </>
  )
}
```

## Variants

The component supports three visual variants:
- **default**: Standard appearance
- **destructive**: Red/danger styling for deletion operations
- **warning**: Yellow/caution styling for cautionary actions

## Key Behaviors

- Confirmation input automatically trims leading/trailing whitespace
- Confirm button remains disabled until exact string matches
- Inherits Dialog component functionality and styling

## Related Components

- [Dialog](../components/dialog) - Base component
- [Alert Dialog](../components/alert-dialog) - Less critical confirmations
- [Confirmation Modal](../fragments/confirmation-modal) - General confirmations
