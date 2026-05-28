---
source: https://supabase.com/design-system/docs/components/sidebar
scraped: 2026-05-27
section: components
---

# Sidebar Component Documentation

## Overview

The Sidebar is a composable, themeable, and customizable component designed to be central to applications. According to the documentation, "Sidebars are one of the most complex components to build" and this implementation provides a solid foundation.

## Installation

```bash
npx shadcn@latest add sidebar
```

## CSS Variables Setup

Add the following color variables to your CSS file:

```css
@layer base {
  :root {
    --sidebar-background: 0 0% 98%;
    --sidebar-foreground: 240 5.3% 26.1%;
    --sidebar-primary: 240 5.9% 10%;
    --sidebar-primary-foreground: 0 0% 98%;
    --sidebar-accent: 240 4.8% 95.9%;
    --sidebar-accent-foreground: 240 5.9% 10%;
    --sidebar-border: 220 13% 91%;
    --sidebar-ring: 217.2 91.2% 59.8%;
  }

  .dark {
    --sidebar-background: 240 5.9% 10%;
    --sidebar-foreground: 240 4.8% 95.9%;
    --sidebar-primary: 224.3 76.3% 48%;
    --sidebar-primary-foreground: 0 0% 100%;
    --sidebar-accent: 240 3.7% 15.9%;
    --sidebar-accent-foreground: 240 4.8% 95.9%;
    --sidebar-border: 240 3.7% 15.9%;
    --sidebar-ring: 217.2 91.2% 59.8%;
  }
}
```

## Component Structure

- **SidebarProvider**: Manages collapsible state
- **Sidebar**: Main container
- **SidebarHeader/Footer**: Sticky positioning
- **SidebarContent**: Scrollable content area
- **SidebarGroup**: Content sections
- **SidebarTrigger**: Toggle button

## SidebarProvider Props

| Name | Type | Description |
|------|------|-------------|
| `defaultOpen` | boolean | Initial open state |
| `open` | boolean | Controlled open state |
| `onOpenChange` | (open: boolean) => void | State change handler |

### Width Configuration

Default width constants:
- Desktop: `16rem`
- Mobile: `18rem`

Customize via CSS variables:
```jsx
<SidebarProvider
  style={{
    '--sidebar-width': '20rem',
    '--sidebar-width-mobile': '20rem',
  }}
>
```

### Keyboard Shortcut

Default: `cmd+b` (Mac) / `ctrl+b` (Windows)

Modify by changing `SIDEBAR_KEYBOARD_SHORTCUT` constant.

### Persisted State

The sidebar uses cookies (`sidebar_state`) to maintain state across page reloads. Access cookie value in Next.js:

```jsx
const cookieStore = await cookies()
const defaultOpen = cookieStore.get('sidebar_state')?.value === 'true'
```

## Sidebar Props

| Property | Type | Description |
|----------|------|-------------|
| `side` | 'left' \| 'right' | Sidebar positioning |
| `variant` | 'sidebar' \| 'floating' \| 'inset' | Visual variant |
| `collapsible` | 'offcanvas' \| 'icon' \| 'none' | Collapse behavior |

### Variant Details

- **sidebar**: Standard sidebar
- **floating**: Floating presentation
- **inset**: Requires wrapping content in `SidebarInset`
- **offcanvas**: Slides from edge
- **icon**: Collapses to icon-only mode
- **none**: Non-collapsible

## useSidebar Hook

```jsx
const { 
  state,           // 'expanded' | 'collapsed'
  open,            // boolean
  setOpen,         // (open: boolean) => void
  openMobile,      // boolean
  setOpenMobile,   // (open: boolean) => void
  isMobile,        // boolean
  toggleSidebar    // () => void
} = useSidebar()
```

## Sub-Components

### SidebarHeader & SidebarFooter
Sticky positioned sections for header/footer content. Commonly used with dropdown menus.

### SidebarContent
Scrollable container for sidebar groups.

### SidebarGroup
Section with optional label and action button.

**Sub-elements:**
- `SidebarGroupLabel`
- `SidebarGroupContent`
- `SidebarGroupAction`

### SidebarMenu & Items
Menu structure components:
- `SidebarMenu`: Container
- `SidebarMenuItem`: Individual item
- `SidebarMenuButton`: Clickable element
- `SidebarMenuAction`: Auxiliary action button
- `SidebarMenuSub`: Submenu container
- `SidebarMenuSubItem`
- `SidebarMenuSubButton`
- `SidebarMenuBadge`: Badge display
- `SidebarMenuSkeleton`: Loading state

### SidebarRail
Toggleable rail element within sidebar.

### SidebarSeparator
Divider element.

### SidebarTrigger
Toggle button (must be within SidebarProvider).

## Code Examples

### Basic Setup

```jsx
// app/layout.tsx
import { AppSidebar } from '@/components/app-sidebar'
import { SidebarProvider, SidebarTrigger } from '@/components/ui/sidebar'

export default function Layout({ children }) {
  return (
    <SidebarProvider>
      <AppSidebar />
      <main>
        <SidebarTrigger />
        {children}
      </main>
    </SidebarProvider>
  )
}
```

### App Sidebar Component

```jsx
// components/app-sidebar.tsx
import { Sidebar, SidebarContent } from '@/components/ui/sidebar'

export function AppSidebar() {
  return <Sidebar><SidebarContent /></Sidebar>
}
```

### Menu with Items

```jsx
import { Calendar, Home, Inbox, Search, Settings } from 'lucide-react'
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from '@/components/ui/sidebar'

const items = [
  { title: 'Home', url: '#', icon: Home },
  { title: 'Inbox', url: '#', icon: Inbox },
  { title: 'Calendar', url: '#', icon: Calendar },
  { title: 'Search', url: '#', icon: Search },
  { title: 'Settings', url: '#', icon: Settings },
]

export function AppSidebar() {
  return (
    <Sidebar>
      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupLabel>Application</SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {items.map((item) => (
                <SidebarMenuItem key={item.title}>
                  <SidebarMenuButton asChild>
                    <a href={item.url}>
                      <item.icon />
                      <span>{item.title}</span>
                    </a>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
    </Sidebar>
  )
}
```

### Collapsible Group

```jsx
import { ChevronDown } from 'lucide-react'
import { Collapsible, CollapsibleTrigger, CollapsibleContent } from '@/components/ui/collapsible'

export function AppSidebar() {
  return (
    <Collapsible defaultOpen className="group/collapsible">
      <SidebarGroup>
        <SidebarGroupLabel asChild>
          <CollapsibleTrigger>
            Help
            <ChevronDown className="ml-auto transition-transform group-data-open/collapsible:rotate-180" />
          </CollapsibleTrigger>
        </SidebarGroupLabel>
        <CollapsibleContent>
          <SidebarGroupContent />
        </CollapsibleContent>
      </SidebarGroup>
    </Collapsible>
  )
}
```

### With Dropdown Menu

```jsx
import { ChevronDown, ChevronUp, User2 } from 'lucide-react'
import {
  DropdownMenu,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuItem,
} from '@/components/ui/dropdown-menu'

export function AppSidebar() {
  return (
    <SidebarProvider>
      <Sidebar>
        <SidebarHeader>
          <SidebarMenu>
            <SidebarMenuItem>
              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <SidebarMenuButton>
                    Select Workspace
                    <ChevronDown className="ml-auto" />
                  </SidebarMenuButton>
                </DropdownMenuTrigger>
                <DropdownMenuContent className="w-(--radix-popper-anchor-width)">
                  <DropdownMenuItem><span>Acme Inc</span></DropdownMenuItem>
                  <DropdownMenuItem><span>Acme Corp.</span></DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
            </SidebarMenuItem>
          </SidebarMenu>
        </SidebarHeader>
        <SidebarContent />
        <SidebarFooter>
          <SidebarMenu>
            <SidebarMenuItem>
              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <SidebarMenuButton>
                    <User2 /> Username
                    <ChevronUp className="ml-auto" />
                  </SidebarMenuButton>
                </DropdownMenuTrigger>
                <DropdownMenuContent side="top" className="w-(--radix-popper-anchor-width)">
                  <DropdownMenuItem><span>Account</span></DropdownMenuItem>
                  <DropdownMenuItem><span>Billing</span></DropdownMenuItem>
                  <DropdownMenuItem><span>Sign out</span></DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
            </SidebarMenuItem>
          </SidebarMenu>
        </SidebarFooter>
      </Sidebar>
    </SidebarProvider>
  )
}
```

### Menu Button with Action

```jsx
import { MoreHorizontal } from 'lucide-react'

<SidebarMenuItem>
  <SidebarMenuButton asChild>
    <a href="#">
      <Home />
      <span>Home</span>
    </a>
  </SidebarMenuButton>
  <DropdownMenu>
    <DropdownMenuTrigger asChild>
      <SidebarMenuAction>
        <MoreHorizontal />
      </SidebarMenuAction>
    </DropdownMenuTrigger>
    <DropdownMenuContent side="right" align="start">
      <DropdownMenuItem><span>Edit Project</span></DropdownMenuItem>
      <DropdownMenuItem><span>Delete Project</span></DropdownMenuItem>
    </DropdownMenuContent>
  </DropdownMenu>
</SidebarMenuItem>
```

### Collapsible Menu

```jsx
<SidebarMenu>
  <Collapsible defaultOpen className="group/collapsible">
    <SidebarMenuItem>
      <CollapsibleTrigger asChild>
        <SidebarMenuButton />
      </CollapsibleTrigger>
      <CollapsibleContent>
        <SidebarMenuSub>
          <SidebarMenuSubItem>
            <SidebarMenuSubButton />
          </SidebarMenuSubItem>
        </SidebarMenuSub>
      </CollapsibleContent>
    </SidebarMenuItem>
  </Collapsible>
</SidebarMenu>
```

### With Badge

```jsx
<SidebarMenuItem>
  <SidebarMenuButton />
  <SidebarMenuBadge>24</SidebarMenuBadge>
</SidebarMenuItem>
```

### Loading Skeleton

```jsx
function NavProjectsSkeleton() {
  return (
    <SidebarMenu>
      {Array.from({ length: 5 }).map((_, index) => (
        <SidebarMenuItem key={index}>
          <SidebarMenuSkeleton showIcon />
        </SidebarMenuItem>
      ))}
    </SidebarMenu>
  )
}
```

### React Server Components

```jsx
async function NavProjects() {
  const projects = await fetchProjects()

  return (
    <SidebarMenu>
      {projects.map((project) => (
        <SidebarMenuItem key={project.name}>
          <SidebarMenuButton asChild>
            <a href={project.url}>
              <project.icon />
              <span>{project.name}</span>
            </a>
          </SidebarMenuButton>
        </SidebarMenuItem>
      ))}
    </SidebarMenu>
  )
}

function AppSidebar() {
  return (
    <Sidebar>
      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupLabel>Projects</SidebarGroupLabel>
          <SidebarGroupContent>
            <React.Suspense fallback={<NavProjectsSkeleton />}>
              <NavProjects />
            </React.Suspense>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
    </Sidebar>
  )
}
```

### SWR Data Fetching

```jsx
function NavProjects() {
  const { data, isLoading } = useSWR("/api/projects", fetcher)

  if (isLoading) {
    return (
      <SidebarMenu>
        {Array.from({ length: 5 }).map((_, index) => (
          <SidebarMenuItem key={index}>
            <SidebarMenuSkeleton showIcon />
          </SidebarMenuItem>
        ))}
      </SidebarMenu>
    )
  }

  if (!data) return null

  return (
    <SidebarMenu>
      {data.map((project) => (
        <SidebarMenuItem key={project.name}>
          <SidebarMenuButton asChild>
            <a href={project.url}>
              <project.icon />
              <span>{project.name}</span>
            </a>
          </SidebarMenuButton>
        </SidebarMenuItem>
      ))}
    </SidebarMenu>
  )
}
```

### Controlled Sidebar

```jsx
export function AppSidebar() {
  const [open, setOpen] = React.useState(false)

  return (
    <SidebarProvider open={open} onOpenChange={setOpen}>
      <Sidebar />
    </SidebarProvider>
  )
}
```

### Persisted State in Next.js

```jsx
import { cookies } from 'next/headers'
import { AppSidebar } from '@/components/app-sidebar'
import { SidebarProvider, SidebarTrigger } from '@/components/ui/sidebar'

export async function Layout({ children }) {
  const cookieStore = await cookies()
  const defaultOpen = cookieStore.get('sidebar_state')?.value === 'true'

  return (
    <SidebarProvider defaultOpen={defaultOpen}>
      <AppSidebar />
      <main>
        <SidebarTrigger />
        {children}
      </main>
    </SidebarProvider>
  )
}
```

### Custom Trigger

```jsx
import { useSidebar } from '@/components/ui/sidebar'

export function CustomTrigger() {
  const { toggleSidebar } = useSidebar()

  return <button onClick={toggleSidebar}>Toggle Sidebar</button>
}
```

## SidebarMenuButton Props

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `asChild` | boolean | false | Render as child component |
| `isActive` | boolean | false | Mark as active state |

## Styling & States

### Collapsible State Styling

Hide elements in icon mode:
```jsx
<SidebarGroup className="group-data-[collapsible=icon]:hidden" />
```

### Active State Styling

Force visibility on active menu items:
```jsx
<SidebarMenuAction className="peer-data-[active=true]/menu-button:opacity-100" />
```

## Theming

The component uses dedicated CSS variables separate from main application styles, enabling different sidebar theming.

Variables:
- `--sidebar-background`
- `--sidebar-foreground`
- `--sidebar-primary`
- `--sidebar-primary-foreground`
- `--sidebar-accent`
- `--sidebar-accent-foreground`
- `--sidebar-border`
- `--sidebar-ring`

## Accessibility

The documentation notes that semantic HTML and proper ARIA attributes should be maintained throughout implementations. Wrap labels in `<span>` elements within menu buttons for proper text handling.

## Key Notes

- The code is designed to be customizable; documentation states "The code is yours. Use `sidebar.tsx` as a starting point."
- Sidebar supports inset layout requiring `SidebarInset` wrapper for main content
- Component manages keyboard shortcuts for accessibility
- Responsive behavior included for mobile/desktop viewports
