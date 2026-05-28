---
source: https://supabase.com/design-system/docs/components/sonner
scraped: 2026-05-27
section: components
---

# Sonner Component Documentation

## About
"An opinionated toast component for React." Sonner is built and maintained by emilkowalski_.

## Installation

```bash
npm install sonner next-themes
```

Copy the Sonner component code into your project, then add the Toaster component to your root layout.

### Setup in Layout

```typescript
import { Toaster } from '@/components/ui/sonner'

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <head />
      <body>
        <main>{children}</main>
        <Toaster />
      </body>
    </html>
  )
}
```

## Usage

```typescript
import { toast } from 'sonner'

toast('Event has been created.')
```

### Basic Example with Options

```typescript
toast('Event has been created', {
  description: 'Sunday, December 03, 2023 at 9:00 AM',
  cancel: {
    label: 'Undo',
    onClick: () => console.log('Undo'),
  },
})
```

## Props

### Toaster Component Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `expand` | `boolean` | — | Toggles expanded toast visibility |
| `position` | `'top-left' \| 'top-right' \| 'bottom-left' \| 'bottom-right' \| 'top-center' \| 'bottom-center'` | — | Sets toast position on screen |

## Toast Types

Available toast variants:
- Default
- Success
- Info
- Warning
- Error
- Action
- Loading
- Promise
- Custom
