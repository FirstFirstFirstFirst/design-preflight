---
source: https://supabase.com/design-system/docs/fragments/page-section
scraped: 2026-05-27
section: fragments
---

# Page Section Component Documentation

## Overview

The Page Section is a compound component designed to organize page content into distinct sections with flexible layout options.

## Sub-components

- **PageSection** - Root container with orientation variants (`horizontal` or `vertical`)
- **PageSectionMeta** - Meta wrapper for `PageSectionSummary` and optional `PageSectionAside`
- **PageSectionSummary** - Container for section title and description (inside `PageSectionMeta`, has `flex-1`)
- **PageSectionTitle** - Section heading (h2)
- **PageSectionDescription** - Supporting text below section title
- **PageSectionAside** - Container for section-level actions (inside `PageSectionMeta`, has `shrink-0`)
- **PageSectionContent** - Container for the main section content

## Orientation Variants

- **vertical** - Content stacks vertically (default)
- **horizontal** - Summary and content arranged horizontally on larger screens

## Layout Guidance

According to the documentation: "Use `PageSectionTitle` and `PageSectionDescription` when a page has multiple sections and no `PageHeader` title--each section gets its own heading."

The distinction is that header titles describe the overall page, while section titles describe a distinct content block within that page.

## Code Examples

### Basic Implementation

```jsx
import { Button, Card, CardContent } from 'ui'
import {
  PageSection,
  PageSectionAside,
  PageSectionContent,
  PageSectionDescription,
  PageSectionMeta,
  PageSectionSummary,
  PageSectionTitle,
} from 'ui-patterns/PageSection'

export function PageSectionDemo() {
  return (
    <div className="w-full">
      <PageSection>
        <PageSectionMeta>
          <PageSectionSummary>
            <PageSectionTitle>Section Title</PageSectionTitle>
            <PageSectionDescription>
              This is a section with a title and description, plus optional actions.
            </PageSectionDescription>
          </PageSectionSummary>
          <PageSectionAside>
            <Button type="default" size="small">
              Action
            </Button>
          </PageSectionAside>
        </PageSectionMeta>
        <PageSectionContent>
          <Card>
            <CardContent className="p-6">
              <p className="text-sm text-foreground-light">
                Section content goes here. This could be forms, tables, or any other content.
              </p>
            </CardContent>
          </Card>
        </PageSectionContent>
      </PageSection>
    </div>
  )
}
```

### Horizontal Orientation

```jsx
import { Card, CardContent } from 'ui'
import {
  PageSection,
  PageSectionContent,
  PageSectionDescription,
  PageSectionMeta,
  PageSectionSummary,
  PageSectionTitle,
} from 'ui-patterns/PageSection'

export function PageSectionHorizontal() {
  return (
    <div className="w-full">
      <PageSection orientation="horizontal">
        <PageSectionMeta>
          <PageSectionSummary>
            <PageSectionTitle>Section Title</PageSectionTitle>
            <PageSectionDescription>
              In horizontal orientation, the summary (title and description) appears on the left,
              with content arranged on the right on larger screens. This is useful for detailed
              sections where you want to maintain context while viewing content.
            </PageSectionDescription>
          </PageSectionSummary>
        </PageSectionMeta>
        <PageSectionContent>
          <Card>
            <CardContent className="p-6">
              <p className="text-sm text-foreground-light">
                The content area appears alongside the summary in a horizontal layout. On smaller
                screens, it will stack vertically.
              </p>
            </CardContent>
          </Card>
        </PageSectionContent>
      </PageSection>
    </div>
  )
}
```

### With Aside Actions

```jsx
import { Button, Card, CardContent } from 'ui'
import {
  PageSection,
  PageSectionAside,
  PageSectionContent,
  PageSectionDescription,
  PageSectionMeta,
  PageSectionSummary,
  PageSectionTitle,
} from 'ui-patterns/PageSection'

export function PageSectionWithAside() {
  return (
    <div className="w-full">
      <PageSection>
        <PageSectionMeta>
          <PageSectionSummary>
            <PageSectionTitle>Section Title</PageSectionTitle>
            <PageSectionDescription>
              This demonstrates PageSection with actions in the Aside component.
            </PageSectionDescription>
          </PageSectionSummary>
          <PageSectionAside>
            <Button type="default" size="small">
              Secondary
            </Button>
            <Button type="primary" size="small">
              Primary Action
            </Button>
          </PageSectionAside>
        </PageSectionMeta>
        <PageSectionContent>
          <Card>
            <CardContent className="p-6">
              <p className="text-sm text-foreground-light">
                The Aside component positions actions horizontally aligned with the section summary,
                providing a clear separation between description and actions.
              </p>
            </CardContent>
          </Card>
        </PageSectionContent>
      </PageSection>
    </div>
  )
}
```

### Title Only (Without Aside)

```jsx
import { Card, CardContent } from 'ui'
import {
  PageSection,
  PageSectionContent,
  PageSectionMeta,
  PageSectionSummary,
  PageSectionTitle,
} from 'ui-patterns/PageSection'

export function PageSectionTitleOnly() {
  return (
    <div className="w-full">
      <PageSection>
        <PageSectionMeta>
          <PageSectionSummary>
            <PageSectionTitle>Section Title</PageSectionTitle>
          </PageSectionSummary>
        </PageSectionMeta>
        <PageSectionContent>
          <Card>
            <CardContent className="p-6">
              <p className="text-sm text-foreground-light">
                PageSectionSummary should still be wrapped in PageSectionMeta, as the latter is a
                flex container that will allow the former to span its full width.
              </p>
            </CardContent>
          </Card>
        </PageSectionContent>
      </PageSection>
    </div>
  )
}
```

## Responsive Behavior

On smaller screens, the horizontal orientation will stack vertically, adapting the layout for mobile accessibility.
