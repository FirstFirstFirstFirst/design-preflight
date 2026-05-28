---
source: https://supabase.com/design-system/docs/accessibility
scraped: 2026-05-27
section: getting-started
---

# Accessibility - Supabase Design System

## Overview

"Make Supabase work for everyone." Accessible interfaces benefit all users through keyboard navigation, legible elements, large tap targets, and clear language.

## Accessibility Checklist

Before deploying code, verify:
- Interactive elements are keyboard-focusable
- Screen readers can announce all elements
- Text is legible and scalable
- Works on smaller/older devices

## Focus Management

All interactive elements require keyboard accessibility. Add `tabIndex={0}` to buttons, links, and non-text inputs, ideally at the component level. Tie `tabIndex` state to disabled states when applicable.

**Browser Considerations:**
- Chromium/Firefox: Tab key navigates automatically
- Safari: Requires Option+Tab by default unless keyboard navigation is enabled in macOS Settings

Implement visual feedback using `focus-visible` states with consistent styling like `inset-focus`.

### Example: Interactive Table Row

```jsx
<TableRow
  key={id}
  className="relative cursor-pointer h-16 inset-focus"
  onClick={(event) => {
    if (event.currentTarget !== event.target) return
    handleBucketNavigation(bucket.id, event)
  }}
  onKeyDown={(event) => {
    if (event.currentTarget !== event.target) return
    if (event.key === 'Enter' || event.key === ' ') {
      event.preventDefault()
      handleBucketNavigation(bucket.id, event)
    }
  }}
  tabIndex={0}
>
  <TableCell>{name}</TableCell>
</TableRow>
```

Support `ctrl`/`meta` keys for opening links in new tabs.

### Radio Groups

Single-select groups should function as unified controls:
- Only the first item receives Tab focus
- Next Tab moves to subsequent focusable control
- Arrow keys navigate individual options
- Space activates (with Enter as secondary option)

### Jumping Ahead

For large datasets, implement:
- Search and filtering
- Pagination or virtualization
- "Jump to" shortcuts

## Screen Reader Support

### Imagery

Provide objective descriptions via `alt` attributes:

```jsx
// Correct
<img src="beagle.png" alt="A tricolor beagle galloping through a grassy field, ears in the air" />

// Incorrect
<img src="beagle.png" alt="Our logo" />
```

Use `aria-label` for icons:

```jsx
<BucketIcon aria-label="bucket icon" size={16} />
```

Mark purely visual elements with `aria-hidden={true}`, never on focusable elements:

```jsx
<ChevronRight aria-hidden={true} size={14} />
```

### Scaffolding

Use `sr-only` text for context-dependent elements lacking visual labels:

```jsx
<TableHead>
  <span className="sr-only">Actions</span>
</TableHead>
```
