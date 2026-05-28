# Refresh Runbook — Supabase Design System Docs

Maintenance guide for the scraped local copy of Supabase Design System documentation.

## Quick Reference

### Full scrape (all sections)

```powershell
cd ~/.claude/skills/design-preflight
.\refresh.ps1
```

First run downloads everything. Subsequent runs skip pages that already have a local file.
To force re-scrape all pages (overwrite existing files):

```powershell
.\refresh.ps1 -Force
```

### Scrape one section

```powershell
.\refresh.ps1 -Section components
.\refresh.ps1 -Section getting-started
.\refresh.ps1 -Section ui-patterns
.\refresh.ps1 -Section fragments
```

Add `-Force` to overwrite existing files in that section.

### Scrape a single page

```powershell
.\refresh.ps1 -Section components -Page button
.\refresh.ps1 -Section getting-started -Page typography -Force
```

`-Page` requires `-Section` to be a specific section (not `all`).

## Checking for Stale Docs

Every scraped markdown file has a YAML frontmatter block:

```yaml
---
source: https://supabase.com/design-system/docs/components/button
scraped: 2026-05-27
section: components
---
```

To find pages older than 30 days, run in PowerShell:

```powershell
$cutoff = (Get-Date).AddDays(-30)
Get-ChildItem -Recurse "~/.claude/skills/design-preflight\data\docs" -Filter "*.md" |
    ForEach-Object {
        $date = (Select-String -Path $_.FullName -Pattern "^scraped:\s*(.+)$" | Select-Object -First 1)
        if ($date) {
            $scraped = [datetime]::Parse($date.Matches[0].Groups[1].Value)
            if ($scraped -lt $cutoff) {
                [PSCustomObject]@{ File = $_.FullName; Scraped = $scraped }
            }
        }
    } | Format-Table -AutoSize
```

## Diffing Changes After Re-scrape

If the `data/docs/` directory is tracked by git:

```powershell
.\refresh.ps1 -Force
git diff data/docs/
```

This shows exactly what changed upstream since the last scrape — new props, renamed sections, removed components.

For a summary of which files changed:

```powershell
git diff --stat data/docs/
```

## Updating the Supabase Repo Clone

If you also maintain a local clone of the Supabase repository for deeper reference:

```powershell
cd <your-supabase-clone>
git pull
```

The repo clone gives access to source code, component implementations, and Storybook configs that the scraped docs do not cover.

## Recommended Refresh Cadence

- **Monthly**: Re-run `.\refresh.ps1 -Force` to pick up any documentation changes.
- **On unexpected behavior**: If a component does not match what the local docs describe, re-scrape that specific page first: `.\refresh.ps1 -Section components -Page <name> -Force`.
- **After Supabase releases**: Major Supabase releases often update the design system. Check the changelog and re-scrape afterward.

## Directory Structure

After a full scrape, the output tree looks like:

```
data/docs/
  getting-started/
    accessibility.md
    color-usage.md
    copywriting.md
    icons.md
    tailwind-classes.md
    theming.md
    typography.md
  ui-patterns/
    introduction.md
    charts.md
    empty-states.md
    forms.md
    layout.md
    markdown.md
    modality.md
    navigation.md
    tables.md
  fragments/
    admonition.md
    ...
  components/
    accordion.md
    button.md
    ...
```

## Filling In Fragment and Component Lists

The `refresh.ps1` script contains `# TODO` markers for the fragment and component page arrays. To discover the full list of pages:

1. Open `https://supabase.com/design-system/docs` in a browser.
2. Inspect the sidebar navigation for the Fragments and Components sections.
3. Extract every link slug (the last path segment of each URL).
4. Add them to the corresponding arrays in `refresh.ps1`.

Alternatively, scrape the sidebar programmatically:

```powershell
$html = (Invoke-WebRequest -Uri "https://supabase.com/design-system/docs" -UseBasicParsing).Content
[regex]::Matches($html, '/design-system/docs/components/([a-z0-9-]+)') |
    ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
```

Repeat with `/fragments/` to get fragment slugs.

## Troubleshooting

| Problem | Fix |
|---|---|
| `Invoke-WebRequest` times out | Check network; the site may be down. Retry with `-TimeoutSec 60` (edit the script). |
| Page returns 404 | The page name may have changed. Check the live site and update the array in `refresh.ps1`. |
| Markdown output is garbled | The site HTML structure may have changed. Review `Convert-HtmlToMarkdown` and adjust regex patterns. |
| Script won't run (execution policy) | Run `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` first. |
