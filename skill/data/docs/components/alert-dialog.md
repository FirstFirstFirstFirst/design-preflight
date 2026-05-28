---
source: https://supabase.com/design-system/docs/components/alert-dialog
scraped: 2026-05-27
section: components
---

# Alert Dialog Component Documentation

## Overview

The Alert Dialog is a modal component designed for critical confirmations and acknowledgements requiring explicit user decisions. As stated in the documentation, it "interrupts the user's workflow to communicate critical information or confirm an action that cannot be taken lightly."

## Component Structure

The Alert Dialog consists of these sub-components:
- `AlertDialog` (wrapper)
- `AlertDialogTrigger`
- `AlertDialogContent`
- `AlertDialogHeader`
- `AlertDialogTitle`
- `AlertDialogDescription`
- `AlertDialogBody`
- `AlertDialogFooter`
- `AlertDialogAction`
- `AlertDialogCancel`

## Installation

```bash
npx shadcn-ui@latest add alert-dialog
```

## Key Behaviors

**Non-dismissible by default:** Unlike standard dialogs, the Alert Dialog cannot be dismissed by clicking outside the modal. Users must take explicit action (confirm, cancel, or press Escape).

**Async action handling:** When an `AlertDialogAction` returns a Promise, the dialog remains open with loading state displayed until resolution. Rejected promises keep the dialog open for error feedback.

## Usage Guidelines

- Restrict to critical decisions only (destructive or irreversible actions)
- Keep descriptions concise--single paragraphs without block-level elements
- Always include `AlertDialogCancel` for user safety
- Use `AlertDialogBody` with inline feedback (Admonition) for error scenarios
- Avoid rich content; use Confirmation Modal or Dialog for complex layouts

## Example Implementation

```jsx
<AlertDialog>
  <AlertDialogTrigger asChild>
    <Button type="outline">Show Alert Dialog</Button>
  </AlertDialogTrigger>
  <AlertDialogContent>
    <AlertDialogHeader>
      <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
      <AlertDialogDescription>
        This action cannot be undone.
      </AlertDialogDescription>
    </AlertDialogHeader>
    <AlertDialogFooter>
      <AlertDialogCancel>Cancel</AlertDialogCancel>
      <AlertDialogAction>Continue</AlertDialogAction>
    </AlertDialogFooter>
  </AlertDialogContent>
</AlertDialog>
```

## Related Resources

Based on Radix UI primitives; see [Modality pattern guide](../ui-patterns/modality) for dialog selection guidance.
