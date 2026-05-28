---
source: https://supabase.com/design-system/docs/fragments/error-display
scraped: 2026-05-27
section: fragments
---

# Error Display Component Documentation

## Overview

The Error Display is a card component designed to surface API errors with optional troubleshooting steps and support contact information. It combines error presentation with user guidance and support access.

## Component Purpose

"A card component for surfacing API errors with optional troubleshooting steps and a support link." The component renders a styled error card containing a warning header, monospace error message block, optional inline troubleshooting content slot, and persistent support footer link.

## Basic Usage

```jsx
import { ErrorDisplay } from 'ui-patterns/ErrorDisplay'

<ErrorDisplay
  title="Failed to load tables"
  errorMessage="ERROR: CONNECTION TERMINATED DUE TO CONNECTION TIMEOUT."
  supportFormParams={{ projectRef: 'my-project' }}
/>
```

## Implementation Example

```jsx
import { ErrorDisplay } from 'ui-patterns/ErrorDisplay/ErrorDisplay'

export function ErrorDisplayDemo() {
  return (
    <ErrorDisplay
      title="Failed to load tables"
      errorMessage="ERROR: FAILED TO RUN SQL QUERY: CONNECTION TERMINATED DUE TO CONNECTION TIMEOUT."
      supportFormParams={{ projectRef: 'my-project' }}
    />
  )
}
```

## With Troubleshooting Steps

```jsx
import { ErrorDisplay } from 'ui-patterns/ErrorDisplay/ErrorDisplay'

export function ErrorDisplayWithChildren() {
  return (
    <ErrorDisplay
      title="Failed to load tables"
      errorMessage="ERROR: FAILED TO RUN SQL QUERY: CONNECTION TERMINATED DUE TO CONNECTION TIMEOUT."
      supportFormParams={{ projectRef: 'my-project' }}
    >
      <div className="px-4 py-3 text-sm text-foreground-light border-b border-default">
        Troubleshooting steps would appear here — e.g. a{' '}
        <code className="font-mono text-xs">TroubleshootingAccordion</code>.
      </div>
    </ErrorDisplay>
  )
}
```

## Props Reference

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `title` | `string` | — | Header text displayed next to warning icon |
| `errorMessage` | `string` | — | Raw error string in monospace code block |
| `supportFormParams` | `SupportFormParams?` | `undefined` | Typed parameters for support form URL construction |
| `supportLabel` | `string?` | `"Contact support"` | Custom support link label |
| `children` | `ReactNode` | `undefined` | Troubleshooting content between message and footer |
| `icon` | `ReactNode` | Warning triangle | Custom header icon override |
| `onRender` | `() => void?` | — | Mount lifecycle callback for telemetry |
| `onSupportClick` | `() => void?` | — | Support link click callback for telemetry |
| `className` | `string?` | — | Additional root Card classes |

## SupportFormParams Fields

| Field | Type | Description |
|-------|------|-------------|
| `projectRef` | `string?` | Project reference slug |
| `orgSlug` | `string?` | Organisation slug |
| `category` | `string?` | Pre-selected support category |
| `subject` | `string?` | Pre-filled subject line |
| `message` | `string?` | Pre-filled message body |
| `error` | `string?` | Raw error string for context |
| `sid` | `string?` | Sentry event ID |

## Integration Guidance

"Use ErrorDisplay as the base for any inline error state in the dashboard." For pattern-matched errors, integrate the `ErrorMatcher` component to automatically inject relevant troubleshooting solutions.
