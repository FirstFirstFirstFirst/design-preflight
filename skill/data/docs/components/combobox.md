---
source: https://supabase.com/design-system/docs/components/combobox
scraped: 2026-05-27
section: components
---

# Combobox Component Documentation

## Component Overview

The Combobox is "an autocomplete input and command palette with a list of suggestions." It combines a Popover and Command components to create a searchable dropdown experience.

## Installation

The Combobox is built by composing the `<Popover />` and `<Command />` components. Installation requires both:
- Popover component installation
- Command component installation

## Component Structure

### Core Components Used
- `Popover` / `PopoverTrigger` / `PopoverContent`
- `Command` / `CommandInput` / `CommandList` / `CommandEmpty` / `CommandGroup` / `CommandItem`
- `Button`
- `Check` icon (from lucide-react)
- `ChevronsUpDown` icon (from lucide-react)

## Props & State Management

### State
- `open` - Boolean controlling popover visibility
- `value` - String storing selected option value

### Button Props (Trigger)
- `role="combobox"`
- `aria-expanded={open}` - Accessibility attribute
- `className="w-[200px] justify-between"` - Width and layout
- `iconRight` - Right-aligned icon (ChevronsUpDown)

### CommandInput Props
- `placeholder` - Search input placeholder text

## Code Examples

### Basic Usage
The documentation provides a complete implementation example using React hooks with framework selection options (Next.js, SvelteKit, Nuxt.js, Remix, Astro).

## Variants & Examples

1. **Basic Combobox** - Standard implementation with search
2. **Popover variant** - Using Popover component
3. **Dropdown menu variant** - Alternative presentation
4. **Responsive variant** - Using Drawer on mobile, Popover on desktop
5. **Form variant** - Integrated within form context

## Accessibility Features

- `role="combobox"` on trigger button
- `aria-expanded={open}` indicating expanded state
- Semantic HTML structure with proper labeling
