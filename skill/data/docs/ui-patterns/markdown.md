---
source: https://supabase.com/design-system/docs/ui-patterns/markdown
scraped: 2026-05-27
section: ui-patterns
---

# Supabase Design System - Markdown UI Pattern

## Overview

The Markdown component is a customizable React renderer for markdown content, built on `react-markdown` with sensible defaults for all standard markdown elements.

## Core Functionality

The component renders headings, paragraphs, lists, blockquotes, links, images, tables, and code blocks. It supports syntax highlighting for code blocks via an optional CodeBlock component and allows extensive customization through the `components` prop.

## API Reference

| Prop | Type | Default | Purpose |
|------|------|---------|---------|
| `children` | string | — | Markdown content to render |
| `content` | string | '' | **Deprecated**: Use `children` instead |
| `codeBlock` | boolean | false | Enable syntax highlighting (lazy-loaded) |
| `components` | Partial<Components> | — | Override or add specific markdown elements |
| `className` | string | — | CSS class for wrapper div |
| `remarkPlugins` | PluggableList | [remarkGfm] | Additional remark plugins |

All `react-markdown` options are supported via spread props.

## Customization

Override elements via the `components` prop to render custom components for specific markdown elements.

## Primitive Components Available

**Headings**: H1, H2, H3, H4, H5, H6

**Text Elements**: Paragraph, Anchor, InlineCode, Code

**Lists**: OrderedList, UnorderedList, ListItem

**Structural**: Blockquote, Hr, Table, Tr, Th, Td

**Code Display**: CodeBlockPre, DefaultPre, SimplePre

**Media**: Img, Avatar, Quote

## Optional Components

### Quote Component

Displays blockquotes with attribution, supporting image sources and captions for enhanced presentation.

### Avatar Component

Renders avatars with captions for visual attribution in markdown content.

## Key Features

- GitHub Flavored Markdown support by default
- Lazy-loaded components for performance
- Full customization capabilities
- Accessibility-first design with alt text support for images
