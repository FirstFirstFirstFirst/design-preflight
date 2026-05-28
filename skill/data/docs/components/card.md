---
source: https://supabase.com/design-system/docs/components/card
scraped: 2026-05-27
section: components
---

# Card Component Documentation

## Component Description
The Card component "Displays a card with header, content, and footer."

## Sub-Components
The Card component includes the following composable sub-components:
- `Card` - Main container
- `CardHeader` - Header section
- `CardTitle` - Title element within header
- `CardDescription` - Description text within header
- `CardContent` - Main content area
- `CardFooter` - Footer section

## Installation

```bash
npx shadcn-ui@latest add card
```

## Usage

### Import Statement
```javascript
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
```

### Basic Example
```jsx
<Card>
  <CardHeader>
    <CardTitle>Card Title</CardTitle>
    <CardDescription>Card Description</CardDescription>
  </CardHeader>
  <CardContent>
    <p>Card Content</p>
  </CardContent>
  <CardFooter>
    <p>Card Footer</p>
  </CardFooter>
</Card>
```

## Additional Notes
- Built by Supabase with source code available on GitHub
- Design inspired by Radix, shadcn/ui, and Geist design systems
