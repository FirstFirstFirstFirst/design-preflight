---
source: https://supabase.com/design-system/docs/components/hover-card
scraped: 2026-05-27
section: components
---

# Hover Card Component

## Description
"For sighted users to preview content available behind a link." This component enables interactive previews when users hover over trigger elements.

## Technology
Built on Radix UI primitives. Reference materials available at [Radix UI Hover Card Docs](https://www.radix-ui.com/docs/primitives/components/hover-card) and [API Reference](https://www.radix-ui.com/docs/primitives/components/hover-card#api-reference).

## Installation

```bash
npx shadcn-ui@latest add hover-card
```

## Basic Usage

```typescript
import { HoverCard, HoverCardContent, HoverCardTrigger } from '@/components/ui/hover-card'

<HoverCard>
  <HoverCardTrigger>Hover</HoverCardTrigger>
  <HoverCardContent>The React Framework – created and maintained by @vercel.</HoverCardContent>
</HoverCard>
```

## Complete Example

```typescript
import { CalendarDays } from 'lucide-react'
import {
  Avatar,
  AvatarFallback,
  AvatarImage,
  Button,
  HoverCard,
  HoverCardContent,
  HoverCardTrigger,
} from 'ui'

export function HoverCardDemo() {
  return (
    <HoverCard>
      <HoverCardTrigger asChild>
        <Button type="link">@nextjs</Button>
      </HoverCardTrigger>
      <HoverCardContent className="w-80">
        <div className="flex justify-between space-x-4">
          <Avatar>
            <AvatarImage src="https://github.com/vercel.png" />
            <AvatarFallback>VC</AvatarFallback>
          </Avatar>
          <div className="space-y-1">
            <h4 className="text-sm font-semibold">@nextjs</h4>
            <p className="text-sm">The React Framework – created and maintained by @vercel.</p>
            <div className="flex items-center pt-2">
              <CalendarDays className="mr-2 h-4 w-4 opacity-70" />
              <span className="text-xs text-muted-foreground">Joined December 2021</span>
            </div>
          </div>
        </div>
      </HoverCardContent>
    </HoverCard>
  )
}
```

## Sub-Components
- **HoverCard**: Root container
- **HoverCardTrigger**: Element that triggers the preview display
- **HoverCardContent**: Container for preview content
