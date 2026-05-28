---
source: https://supabase.com/design-system/docs/fragments/empty-state-presentational
scraped: 2026-05-27
section: fragments
---

# Empty State Presentational Component

## Overview

The Empty State Presentational component serves as a UI pattern for encouraging user action in scenarios where content is unavailable. It combines visual and textual elements to prompt engagement.

## Component Purpose

"An empty state for encouraging action." This fragment component displays when a collection or feature is initially empty, guiding users toward creating their first item.

## Key Features

- **Icon Support**: Accepts Lucide icons or custom icons from the `icons` package
- **Default Icon**: Falls back to Lucide's `SquarePlus` when no icon is provided
- **Flexible Content**: Supports title, description, and child elements (typically action buttons)

## Props & Content Requirements

### Text Guidelines

The documentation emphasizes using "active language" for all text. Titles should "prompt the user to take an action," while descriptions must "clearly explain the value of doing so."

### Icon Property

The component accepts both standard Lucide React icons and custom branded icons. When neither is explicitly provided, the component defaults to a square plus icon.

## Code Examples

### Basic Implementation

```tsx
import { BucketPlus } from 'icons'
import { Plus } from 'lucide-react'
import { Button } from 'ui'
import { EmptyStatePresentational } from 'ui-patterns'

export function EmptyStatePresentationalIcon() {
  return (
    <EmptyStatePresentational
      icon={BucketPlus}
      title="Create a vector bucket"
      description="Store, index, and query your vector embeddings at scale."
    >
      <Button size="tiny" type="primary" icon={<Plus size={14} />}>
        Create bucket
      </Button>
    </EmptyStatePresentational>
  )
}
```

### Without Custom Icon

```tsx
import { Plus } from 'lucide-react'
import { Button } from 'ui'
import { EmptyStatePresentational } from 'ui-patterns'

export function EmptyStatePresentationalIcon() {
  return (
    <EmptyStatePresentational
      title="Create an auth hook"
      description="Use Postgres functions or HTTP endpoints to customize your authentication flow."
    >
      <Button size="tiny" type="primary" icon={<Plus size={14} />}>
        Add hook
      </Button>
    </EmptyStatePresentational>
  )
}
```

### Within Page Section Layout

```tsx
import { Plus } from 'lucide-react'
import { Button } from 'ui'
import { EmptyStatePresentational } from 'ui-patterns'
import {
  PageSection,
  PageSectionAside,
  PageSectionContent,
  PageSectionMeta,
  PageSectionSummary,
  PageSectionTitle,
} from 'ui-patterns/PageSection'

export function EmptyStatePresentationalIcon() {
  return (
    <div className="w-full">
      <PageSection>
        <PageSectionMeta>
          <PageSectionSummary>
            <PageSectionTitle>Providers</PageSectionTitle>
          </PageSectionSummary>
          <PageSectionAside>
            <Button size="tiny" type="primary" icon={<Plus size={14} />}>
              Add provider
            </Button>
          </PageSectionAside>
        </PageSectionMeta>
        <PageSectionContent>
          <EmptyStatePresentational
            title="Add a provider"
            description="Use third-party authentication systems to access your project."
          >
            <Button size="tiny" type="default" icon={<Plus size={14} />}>
              Add provider
            </Button>
          </EmptyStatePresentational>
        </PageSectionContent>
      </PageSection>
    </div>
  )
}
```

## Usage Patterns & Best Practices

### Button Placement Strategy

The documentation acknowledges that "it's okay to repeat buttons inside of Empty State Presentational that are also available outside of it." This approach prevents layout shift issues caused by client-side polling to determine empty state visibility.

### Button Styling in Empty States

When repeating action buttons, set `type` to `"default"` to maintain a single `"primary"` button as the primary call-to-action on the page. This preserves visual hierarchy and user focus.

### Layout Consistency

The component works well within structured page layouts using `PageSection` components, maintaining consistent entry points for user actions both within and outside the empty state.

## Related Components

- See "Empty States" UI pattern documentation for broader empty state guidance
- Integrates with Button component for action prompts
- Works within PageSection layout patterns
