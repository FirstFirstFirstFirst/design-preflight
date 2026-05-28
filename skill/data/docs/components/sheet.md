---
source: https://supabase.com/design-system/docs/components/sheet
scraped: 2026-05-27
section: components
---

# Sheet Component Documentation

## Overview
The Sheet component extends the Dialog component to display supplementary content alongside main screen content. It's built on Radix UI's Dialog primitive.

## Component Description
"Extends the Dialog component to display content that complements the main content" of the screen.

## Installation
```bash
npx shadcn-ui@latest add sheet
```

## Import Statement
```javascript
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from '@/components/ui/sheet'
```

## Sub-Components
- **Sheet**: Root component
- **SheetTrigger**: Opens the sheet
- **SheetContent**: Container for sheet content
- **SheetHeader**: Header section
- **SheetTitle**: Title text
- **SheetDescription**: Descriptive text
- **SheetFooter**: Footer section for actions
- **SheetSection**: Groups related content
- **SheetClose**: Closes the sheet

## Basic Usage Example
```jsx
<Sheet>
  <SheetTrigger>Open</SheetTrigger>
  <SheetContent>
    <SheetHeader>
      <SheetTitle>Title</SheetTitle>
      <SheetDescription>Description text</SheetDescription>
    </SheetHeader>
  </SheetContent>
</Sheet>
```

## Key Properties
- **side**: Controls edge position (`top`, `right`, `bottom`, `left`; default: `right`)
- **className**: Adjust size using CSS classes (e.g., `w-[400px] sm:w-[540px]`)
- **asChild**: Allows custom trigger elements

## Usage Guidelines
1. Use for side panels, multi-field forms, settings panels, and detailed editors
2. Consider responsive behavior on mobile devices
3. Structure content with headers, sections, and footers for clarity
4. Default `right` positioning is recommended unless specific needs require otherwise

## Notable Features
- Nonmodal by default (doesn't block underlying content)
- Supports custom sizing via CSS
- Can be positioned on all screen edges
- Works with Sidebar component for content resizing

## External Resources
- [Radix UI Documentation](https://www.radix-ui.com/docs/primitives/components/dialog)
- [API Reference](https://www.radix-ui.com/docs/primitives/components/dialog#api-reference)
