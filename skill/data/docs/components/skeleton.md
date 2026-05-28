---
source: https://supabase.com/design-system/docs/components/skeleton
scraped: 2026-05-27
section: components
---

# Skeleton Component Documentation

## Component Description
The Skeleton component serves as "a placeholder while content is loading."

## Installation

### CLI Method
```bash
npx shadcn-ui@latest add skeleton
```

### Manual Import
```javascript
import { Skeleton } from '@/components/ui/skeleton'
```

## Basic Usage

```jsx
import { Skeleton } from 'ui'

export function SkeletonDemo() {
  return (
    <div className="flex items-center space-x-4">
      <Skeleton className="h-12 w-12 rounded-full" />
      <div className="space-y-2">
        <Skeleton className="h-4 w-[250px]" />
        <Skeleton className="h-4 w-[200px]" />
      </div>
    </div>
  )
}
```

## Simple Implementation Example

```jsx
<Skeleton className="w-[100px] h-[20px] rounded-full" />
```

## Props
The component accepts standard className styling options for dimensions and border-radius customization.

## Examples Provided
- Card variant example (code expandable on documentation site)
