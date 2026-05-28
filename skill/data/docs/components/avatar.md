---
source: https://supabase.com/design-system/docs/components/avatar
scraped: 2026-05-27
section: components
---

# Avatar Component

## Description
The Avatar component is "An image element with a fallback for representing the user." It's built on Radix UI primitives.

## Installation

```bash
npx shadcn-ui@latest add avatar
```

## Usage

### Basic Import
```javascript
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
```

### Basic Example
```jsx
<Avatar>
  <AvatarImage src="https://github.com/mildtomato.png" />
  <AvatarFallback>CN</AvatarFallback>
</Avatar>
```

### Complete Demo
```jsx
import { Avatar, AvatarFallback, AvatarImage } from 'ui'

export function AvatarDemo() {
  return (
    <Avatar>
      <AvatarImage src="https://github.com/mildtomato.png" alt="@mildtomato" />
      <AvatarFallback>MT</AvatarFallback>
    </Avatar>
  )
}
```

## Sub-Components

- **Avatar**: Root wrapper component
- **AvatarImage**: Displays the image with alt text support
- **AvatarFallback**: Provides fallback content when image fails to load

## References

- [Radix UI Avatar Documentation](https://www.radix-ui.com/docs/primitives/components/avatar)
- [Radix UI Avatar API Reference](https://www.radix-ui.com/docs/primitives/components/avatar#api-reference)
