---
source: https://supabase.com/design-system/docs/components/keyboard-shortcut
scraped: 2026-05-27
section: components
---

# Keyboard Shortcut Component

## Description

The KeyboardShortcut component renders a compact, platform-aware label for keyboard shortcuts. It displays logical key names as visual shortcut indicators suitable for buttons, menus, tooltips, and helper text.

## Props

### `keys`
- **Type:** `string[]` (ordered array)
- **Required:** Yes
- **Description:** An ordered array of logical key names to display
- **Example:** `keys={['Meta', 'S']}`

### `variant`
- **Type:** `'pill' | 'inline'`
- **Default:** `'pill'`
- **Description:** Display style for the shortcut

## Variants

### Pill (Default)
Standard pill-shaped badge for standalone use in menus, tooltips, and shortcut chips.

```jsx
<KeyboardShortcut keys={['Shift', 'Meta', 'M']} />
```

### Inline
Compact inline style for use within button accessory slots or alongside text.

```jsx
<Button iconRight={<KeyboardShortcut keys={['Meta', 'Enter']} variant="inline" />}>
  Apply
</Button>
```

## Supported Keys

Special keys include: `Meta`, `Alt`, `Shift`, `Enter`, `Esc`/`Escape`, `Tab`

Single-character keys are automatically uppercased.

## Code Examples

### Basic Usage
```jsx
import { KeyboardShortcut } from 'ui'

<KeyboardShortcut keys={['Meta', 'S']} />
```

### Button with Inline Shortcut
```jsx
<Button iconRight={<KeyboardShortcut keys={['Meta', 'Enter']} variant="inline" />}>
  Run query
</Button>
```

### Menu List
```jsx
const shortcuts = [
  { label: 'Open command menu', keys: ['Meta', 'K'] },
  { label: 'Prettify SQL', keys: ['Alt', 'Shift', 'F'] },
]

{shortcuts.map((shortcut) => (
  <div key={shortcut.label} className="flex justify-between">
    <span>{shortcut.label}</span>
    <KeyboardShortcut keys={shortcut.keys} />
  </div>
))}
```

## Usage Guidelines

- **Avoid** placing shortcuts directly inside button label text
- **Use** the `iconRight` accessory slot for button integration
- Platform detection automatically adjusts modifier key symbols (Ctrl vs Cmd)
