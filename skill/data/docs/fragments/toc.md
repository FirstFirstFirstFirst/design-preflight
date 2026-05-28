---
source: https://supabase.com/design-system/docs/fragments/toc
scraped: 2026-05-27
section: fragments
---

# Table of Contents (TOC)

## Overview

The Table of Contents (TOC) fragment component displays a list of page anchors for the current page, highlighting elements as they come into view.

## Usage

### Basic Implementation (Multiple Highlights)

The default behavior highlights one or more elements of the TOC simultaneously as users scroll:

```tsx
'use client'

import { createContext, PropsWithChildren, useContext, useEffect, useState } from 'react'
import { AnchorProvider, Toc, TOCItems, TOCScrollArea, type AnchorProviderProps } from 'ui-patterns'

export function MultiSelectDemo() {
  return (
    <TocAnchorsProvider>
      <div
        id="example-toc-demo"
        className="p-4 md:p-8 grid md:grid-cols-4 gap-4 max-h-[600px] overflow-y-auto"
      >
        <div className="md:col-span-3">
          <div className="prose max-w-none">
            <h1>Getting Started with Cloud Computing</h1>
            <h2 id="introduction">
              Introduction
              <a href="#introduction" aria-hidden="true" className="ml-2 opacity-0 group-hover:opacity-100 transition">
                <span aria-hidden="true">#</span>
              </a>
            </h2>
            <p>Cloud computing has revolutionized how we build and deploy applications...</p>
            <h2 id="key-concepts">
              Key Concepts
              <a href="#key-concepts" aria-hidden="true" className="ml-2 opacity-0 group-hover:opacity-100 transition">
                <span aria-hidden="true">#</span>
              </a>
            </h2>
            <p>Understanding basic building blocks is essential before diving deep...</p>
            <h3 id="iaas">
              Infrastructure as a Service (IaaS)
              <a href="#iaas" aria-hidden="true" className="ml-2 opacity-0 group-hover:opacity-100 transition">
                <span aria-hidden="true">#</span>
              </a>
            </h3>
            <p>IaaS provides virtualized computing resources over the internet...</p>
          </div>
        </div>
        <TocComponent />
      </div>
    </TocAnchorsProvider>
  )
}

const TocComponent = () => {
  const { toc } = useTocAnchors()

  return (
    <Toc className="sticky top-0 border-l">
      <h3 className="inline-flex items-center gap-1.5 font-mono text-xs uppercase text-foreground pl-[calc(1.5rem+6px)]">
        On this page
      </h3>
      <TOCScrollArea className="ml-[-2px]">
        <TOCItems items={toc} />
      </TOCScrollArea>
    </Toc>
  )
}

interface TOCHeader {
  id?: string
  text: string
  link: string
  level: number
}

const TocAnchorsContext = createContext<AnchorProviderProps | undefined>(undefined)

const useTocAnchors = () => {
  const context = useContext(TocAnchorsContext)
  if (!context) {
    throw new Error('useTocAnchors must be used within an TocAnchorsContext')
  }
  return context
}

const TocAnchorsProvider = ({ children }: PropsWithChildren) => {
  const [tocList, setTocList] = useState<TOCHeader[]>([])

  const toc = tocList.map((item) => ({
    title: item.text,
    url: item.link,
    depth: item.level,
  }))

  useEffect(() => {
    const timeoutHandle = setTimeout(() => {
      const headings = Array.from(
        document.querySelector('#example-toc-demo')?.querySelectorAll('h2, h3') ?? []
      )

      const newHeadings = headings
        .filter((heading) => heading.id)
        .map((heading) => {
          const text = heading?.textContent?.replace('#', '')
          const link = heading.querySelector('a')?.getAttribute('href')
          if (!link) return null

          const level = heading.tagName === 'H2' ? 2 : 3

          return { text, link, level } as Partial<TOCHeader>
        })
        .filter((x): x is TOCHeader => !!x && !!x.text && !!x.link && !!x.level)

      setTocList(newHeadings)
    }, 100)

    return () => clearTimeout(timeoutHandle)
  }, [typeof window !== 'undefined' && window.location.href])

  return (
    <TocAnchorsContext.Provider value={{ toc }}>
      <AnchorProvider toc={toc} single={false}>
        {children}
      </AnchorProvider>
    </TocAnchorsContext.Provider>
  )
}
```

### Single Selection Variant

Use `single={true}` to highlight one TOC element at a time:

```tsx
<AnchorProvider toc={toc} single={true}>
  {children}
</AnchorProvider>
```

## Key Props

- **`single`**: Boolean flag controlling highlight behavior (false = multiple, true = single)
- **`toc`**: Array of table of contents items with title, URL, and depth properties
- **`className`**: CSS classes for styling the Toc wrapper (e.g., "sticky top-0 border-l")

## Components Used

- **`AnchorProvider`**: Context provider managing TOC state
- **`Toc`**: Main wrapper component
- **`TOCItems`**: Renders individual TOC items
- **`TOCScrollArea`**: Scrollable container for TOC items

## Implementation Notes

- DOM queries execute within a `setTimeout` to ensure proper DOM rendering
- Window location change detection triggers TOC recalculation on page navigation
- Heading elements require `id` attributes and anchor links to be indexed
- Supports hierarchical heading levels (h2 and h3)
