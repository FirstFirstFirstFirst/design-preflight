---
source: https://supabase.com/design-system/docs/fragments/collapsible-card-section
scraped: 2026-05-27
section: fragments
---

# Collapsible Card Section

## Overview

The `CollapsibleCardSection` component provides a mono-uppercase collapsible trigger mechanism for progressively disclosing optional or advanced settings within card or panel forms.

## Purpose

"A mono-uppercase collapsible trigger for hiding optional or advanced settings inside a card or panel." This component allows developers to organize form content hierarchically, revealing additional fields only when needed.

## Usage

### Basic Implementation

```jsx
import { CollapsibleCardSection } from 'ui-patterns/CollapsibleCardSection'

<CollapsibleCardSection title="Advanced settings">
  {/* form fields */}
</CollapsibleCardSection>
```

### With Description

Include contextual information beneath the title:

```jsx
<CollapsibleCardSection
  title="Advanced settings"
  description="These settings cannot be changed after creation"
>
  {/* form fields */}
</CollapsibleCardSection>
```

### Default Open State

Render the section expanded on initial load:

```jsx
<CollapsibleCardSection title="Advanced settings" defaultOpen>
  {/* form fields */}
</CollapsibleCardSection>
```

## Code Example

```jsx
import { Input } from 'ui'
import { CollapsibleCardSection } from 'ui-patterns/CollapsibleCardSection'
import { FormItemLayout } from 'ui-patterns/form/FormItemLayout/FormItemLayout'

export function CollapsibleCardSectionDemo() {
  return (
    <div className="border rounded-lg px-6 py-4 w-full max-w-lg">
      <CollapsibleCardSection
        title="Advanced settings"
        description="These settings cannot be changed after creation"
      >
        <FormItemLayout
          isReactForm={false}
          layout="flex-row-reverse"
          label="OIDC Issuer"
          description="The OIDC issuer URL of your identity provider."
        >
          <Input placeholder="https://your-org.okta.com" />
        </FormItemLayout>
      </CollapsibleCardSection>
    </div>
  )
}
```

## Props

| Prop | Type | Description |
|------|------|-------------|
| `title` | string | The collapsible section heading |
| `description` | string (optional) | Contextual text displayed below title |
| `defaultOpen` | boolean (optional) | Initial expanded state |
| `children` | ReactNode | Content revealed when expanded |
