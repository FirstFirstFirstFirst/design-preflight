# @anthropic-skills/design-preflight

Supabase Design System preflight check skill for [Claude Code](https://claude.ai/claude-code).

Runs a 10-point checklist against 100+ scraped component, fragment, and pattern docs before you start building UI.

## Install

```bash
npx @anthropic-skills/design-preflight
```

Copies skill into `~/.claude/skills/design-preflight/`. Use `--force` to overwrite.

## Usage

In Claude Code:

```
/design-preflight              # default depth (~1500 tokens)
/design-preflight quick        # ~500 token brief
/design-preflight deep         # full props + source snippets
/design-preflight --antipatterns  # include known pitfalls
```

## What it does

Spawns a Sonnet sub-agent that:

1. Reads routing index for relevant docs
2. Reads component/fragment/pattern/foundation docs
3. Runs 10-point preflight checklist
4. Returns compressed Design Brief

### Checklist

1. Component Inventory
2. Pattern Match
3. Color & Theming
4. Typography
5. Spacing & Layout
6. Accessibility
7. Responsive
8. Form Patterns
9. Modality
10. Anti-pattern Check

## Design System Hierarchy

```
Radix UI -> shadcn/ui -> Supabase Design System -> Your app
```

## Updating docs

**Node (cross-platform):**
```bash
cd ~/.claude/skills/design-preflight
node refresh.mjs --force
```

**PowerShell (Windows):**
```powershell
.\refresh.ps1 -Force
```

## Contents

- 57 component docs, 25 fragment docs, 9 pattern docs, 8 foundation docs
- 2 antipattern files
- Cross-platform scraper (Node + PowerShell)
- Agent prompt template

## License

MIT
