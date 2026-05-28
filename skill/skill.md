---
name: design-preflight
description: Pre-flight design system check before UI work. Spawns a Sonnet sub-agent that reads local Supabase Design System docs, runs a 10-point preflight checklist, and returns a compressed Design Brief.
---

# Skill: Design Preflight

## Usage

```
/design-preflight [depth] [--antipatterns]
```

**Depth levels:**

| Depth     | What you get                                                        | ~Tokens |
|-----------|---------------------------------------------------------------------|---------|
| `quick`   | Component list + design tokens + top 3 warnings                    | ~500    |
| `default` | Full brief: components, composition, tokens, a11y, responsive       | ~1500   |
| `deep`    | Everything + ALL examples + source code + full props + fragments    | ~3000+  |

**Flags:**
- `--antipatterns` -- scan `data/antipatterns/` for project-specific pitfalls

## How It Works

Spawns a **single Sonnet sub-agent** that reads docs and returns compressed result. Main thread never reads doc files directly.

### Agent delegation

```
Agent({
  model: "sonnet",
  prompt: <filled preflight.md template>,
  description: "Design preflight: <what user is building>"
})
```

The agent:
1. Reads `data/index.md` (routing table)
2. Reads relevant files from `data/docs/`
3. At `deep` depth: reads source code if available locally
4. If `--antipatterns`: scans `data/antipatterns/`
5. Runs 10-point preflight checklist
6. Returns compressed result per depth level

## Key Paths (relative to skill root)

| What                        | Path                                             |
|-----------------------------|--------------------------------------------------|
| Index (routing table)       | `data/index.md`                                  |
| Scraped docs (100+ pages)   | `data/docs/`                                     |
| Antipatterns                | `data/antipatterns/`                              |
| Prompt template             | `prompts/preflight.md`                            |
| Refresh (Node)              | `refresh.mjs`                                     |
| Refresh (PowerShell)        | `refresh.ps1`                                     |

## Design System Hierarchy

```
Radix UI (unstyled primitives)
  -> shadcn/ui (styled Radix + Tailwind)
    -> Supabase Design System (wraps shadcn)
      -> Your app
```

- Always prefer Supabase DS over raw shadcn/ui
- If DS doesn't wrap a shadcn component, use shadcn with Supabase tokens
- Never use raw Radix unless nothing else exists
- Check fragments before hand-building

## 10-Point Preflight Checklist

1. **Component Inventory** -- which DS components cover the UI
2. **Pattern Match** -- existing ui-patterns or fragments that solve this
3. **Color & Theming** -- token usage, dark mode
4. **Typography** -- sizes, weights, line heights
5. **Spacing & Layout** -- spacing scale, layout primitives
6. **Accessibility** -- ARIA, keyboard nav, focus, screen reader
7. **Responsive** -- breakpoints, mobile-first
8. **Form Patterns** -- validation, error states (if applicable)
9. **Modality** -- dialogs, sheets, popovers (if applicable)
10. **Anti-pattern Check** -- known pitfalls
