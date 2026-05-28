---
source: https://supabase.com/design-system/docs/fragments/status-codes
scraped: 2026-05-27
section: fragments
---

# Status Code Component

## Overview

The Status Code component provides visually informative blocks for displaying HTTP status codes with method indicators.

## Usage

```tsx
import { StatusCode } from 'ui-patterns'

export function StatusCodeDemo() {
  return (
    <div className="flex flex-col gap-2">
      <StatusCode method="GET" statusCode="200" />
      <StatusCode method="POST" statusCode="404" />
      <StatusCode method="DELETE" statusCode="500" />
      <StatusCode method="PUT" statusCode="100" />
    </div>
  )
}
```

Basic implementation:

```tsx
<StatusCode method="GET" statusCode="200" />
```

## API Reference

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `statusCode` | `number \| string \| undefined` | — | HTTP status code to display; determines color coding |
| `method` | `string` | — | HTTP method label (e.g., GET, POST) rendered as prefix pill |
| `className` | `string` | — | Additional CSS classes for root element |

## Color Coding

Status code colors map automatically based on value:

| Value | Color |
|-------|-------|
| `1xx`, `2xx`, `3xx`, `'info'`, `'success'`, `undefined` | Neutral |
| `4xx`, `'warning'`, `'redirect'` | Warning |
| `5xx`, `'error'` | Destructive |

## Visual Examples

The component renders status codes with accompanying HTTP methods:
- GET with 200 status
- POST with 404 status
- DELETE with 500 status
- PUT with 100 status
