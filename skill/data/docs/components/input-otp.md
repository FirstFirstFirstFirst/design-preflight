---
source: https://supabase.com/design-system/docs/components/input-otp
scraped: 2026-05-27
section: components
---

# Input OTP Component Documentation

## Overview

The Input OTP component provides an accessible one-time password interface with integrated copy-paste functionality. It's built on the `input-otp` library by Guilherme Rodz.

## Installation

```bash
npx shadcn-ui@latest add input-otp
```

### Tailwind Configuration

Add the following keyframes to `tailwind.config.js`:

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  theme: {
    extend: {
      keyframes: {
        'caret-blink': {
          '0%,70%,100%': { opacity: '1' },
          '20%,50%': { opacity: '0' },
        },
      },
      animation: {
        'caret-blink': 'caret-blink 1.25s ease-out infinite',
      },
    },
  },
}
```

## Components

### Main Components

- **InputOTP** - Root wrapper container
- **InputOTPGroup** - Groups input slots together
- **InputOTPSlot** - Individual input field (requires `index` prop)
- **InputOTPSeparator** - Visual divider between groups

## Import Statement

```javascript
import { InputOTP, InputOTPGroup, InputOTPSeparator, InputOTPSlot } from '@/components/ui/input-otp'
```

## Basic Usage

```jsx
export function InputOTPDemo() {
  return (
    <InputOTP maxLength={6}>
      <InputOTPGroup>
        <InputOTPSlot index={0} />
        <InputOTPSlot index={1} />
        <InputOTPSlot index={2} />
      </InputOTPGroup>
      <InputOTPSeparator />
      <InputOTPGroup>
        <InputOTPSlot index={3} />
        <InputOTPSlot index={4} />
        <InputOTPSlot index={5} />
      </InputOTPGroup>
    </InputOTP>
  )
}
```

## Props

### InputOTP
- **maxLength** (number) - Maximum number of characters
- **pattern** (RegExp, optional) - Custom validation pattern
- **value** (string, optional) - Controlled input value
- **onChange** (function, optional) - Change handler for controlled inputs

### InputOTPSlot
- **index** (number, required) - Position of the slot

## Example Variants

### Pattern Validation

```jsx
import { REGEXP_ONLY_DIGITS_AND_CHARS } from "input-otp"

<InputOTP
  maxLength={6}
  pattern={REGEXP_ONLY_DIGITS_AND_CHARS}
>
  <InputOTPGroup>
    <InputOTPSlot index={0} />
  </InputOTPGroup>
</InputOTP>
```

### With Separator

```jsx
<InputOTP maxLength={4}>
  <InputOTPGroup>
    <InputOTPSlot index={0} />
    <InputOTPSlot index={1} />
  </InputOTPGroup>
  <InputOTPSeparator />
  <InputOTPGroup>
    <InputOTPSlot index={2} />
    <InputOTPSlot index={3} />
  </InputOTPGroup>
</InputOTP>
```

### Controlled Component

The documentation indicates support for controlled inputs via `value` and `onChange` props, with form integration examples available.

## Key Features

- Accessible design following WAI standards
- Native copy-paste support
- Customizable patterns for validation
- Blinking caret animation
- Flexible grouping and separator options
