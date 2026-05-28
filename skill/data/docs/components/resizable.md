---
source: https://supabase.com/design-system/docs/components/resizable
scraped: 2026-05-27
section: components
---

# Resizable Component Documentation

## About
The Resizable component builds upon "react-resizable-panels" by bvaughn, providing accessible panel groups with keyboard support capabilities.

## Installation
```bash
npx shadcn-ui@latest add resizable
```

## Import
```javascript
import { ResizableHandle, ResizablePanel, ResizablePanelGroup } from '@/components/ui/resizable'
```

## Sub-Components

- **ResizablePanelGroup**: Container managing multiple resizable panels
- **ResizablePanel**: Individual panel within the group
- **ResizableHandle**: Draggable separator between panels

## Props

### ResizablePanelGroup
- `direction`: "horizontal" | "vertical" - Layout orientation

### ResizablePanel
- `defaultSize`: number - Initial size percentage (0-100)

### ResizableHandle
- `withHandle`: boolean - Display visual handle indicator (default: false)

## Code Examples

### Basic Horizontal Layout
```javascript
<ResizablePanelGroup direction="horizontal">
  <ResizablePanel>One</ResizablePanel>
  <ResizableHandle />
  <ResizablePanel>Two</ResizablePanel>
</ResizablePanelGroup>
```

### Vertical Layout
```javascript
<ResizablePanelGroup direction="vertical">
  <ResizablePanel>One</ResizablePanel>
  <ResizableHandle />
  <ResizablePanel>Two</ResizablePanel>
</ResizablePanelGroup>
```

### With Visual Handle
```javascript
<ResizableHandle withHandle />
```

### Nested Panels
Supports nesting ResizablePanelGroups with different orientations for complex layouts.

## Key Features
- Keyboard navigation support
- Accessible design patterns
- Flexible nesting capabilities
- Customizable sizing
