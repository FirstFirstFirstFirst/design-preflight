---
source: https://supabase.com/design-system/docs/fragments/assistant-chat
scraped: 2026-05-27
section: fragments
---

# Assistant Chat Component Documentation

## Overview

The Assistant Chat is a specialized text input component designed for conversational interfaces. It features a bespoke chat textarea with integrated command popover support for displaying available commands.

## Usage

### Basic Implementation

```jsx
import { AssistantChatForm } from 'ui-patterns/AssistantChat'

<AssistantChatForm
  icon={<Box strokeWidth={1.5} size={24} className="text-foreground-muted" />}
  value={value}
  loading={loading}
  disabled={loading}
  onValueChange={(e) => setValueState(e.target.value)}
  onSubmit={async (event) => {
    event.preventDefault()
    handleSubmit(event)
  }}
/>
```

## Props

| Prop | Type | Description |
|------|------|-------------|
| `icon` | ReactNode | Icon displayed in the chat input |
| `value` | string | Current textarea value |
| `loading` | boolean | Loading state indicator |
| `disabled` | boolean | Disables the input |
| `onValueChange` | function | Callback for value changes |
| `onSubmit` | function | Callback for form submission |

## Commands Feature

The component supports an optional commands popover for displaying command suggestions. Implementation requires state management and a textarea reference:

```jsx
const [commandsOpen, setCommandsOpen] = useState(false)
const textAreaRef = createRef<HTMLTextAreaElement>()

<AssistantCommandPopover
  open={commandsOpen}
  setOpen={setCommandsOpen}
  textAreaRef={textAreaRef}
>
  <AssistantChatForm
    commandsOpen={commandsOpen}
    setCommandsOpen={setCommandsOpen}
  />
</AssistantCommandPopover>
```

The textarea reference maintains input focus while allowing keyboard interaction with the popover.

---

**Location in Design System:** Fragment Components > Assistant Chat
