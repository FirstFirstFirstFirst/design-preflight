---
source: https://supabase.com/design-system/docs/components/tabs
scraped: 2026-05-27
section: components
---

# Tabs Component Documentation

## Component Description

The Tabs component presents "a set of layered sections of content—known as tab panels—that are displayed one at a time." It's built on Radix UI primitives.

## Key Resources

- **Radix UI Docs:** https://www.radix-ui.com/docs/primitives/components/tabs
- **API Reference:** https://www.radix-ui.com/docs/primitives/components/tabs#api-reference

## Installation

```bash
npx shadcn-ui@latest add tabs
```

## Import Statement

```typescript
import { 
  Tabs, 
  TabsContent, 
  TabsList, 
  TabsTrigger 
} from '@/components/ui/tabs'
```

## Sub-Components

- **Tabs** - Root wrapper component
- **TabsList** - Container for tab triggers
- **TabsTrigger** - Individual tab button (accepts `value` prop)
- **TabsContent** - Panel content (accepts `value` prop)

## Basic Usage Example

```jsx
<Tabs defaultValue="account" className="w-[400px]">
  <TabsList>
    <TabsTrigger value="account">Account</TabsTrigger>
    <TabsTrigger value="password">Password</TabsTrigger>
  </TabsList>
  <TabsContent value="account">Make changes to your account here.</TabsContent>
  <TabsContent value="password">Change your password here.</TabsContent>
</Tabs>
```

## Key Props

- **defaultValue** - Sets the initially active tab
- **className** - Tailwind styling support
- **value** - Required on TabsTrigger and TabsContent for matching pairs
