#Requires -Version 5.1
<#
.SYNOPSIS
    Scrapes Supabase Design System docs and saves them as markdown files.

.DESCRIPTION
    Fetches HTML pages from https://supabase.com/design-system/docs/,
    converts them to clean markdown, and stores them under data/docs/.

.PARAMETER Section
    Which section to scrape: getting-started, ui-patterns, fragments, components, or all.
    Default: all.

.PARAMETER Page
    Specific page name within a section. Requires -Section to be set (not "all").

.PARAMETER Force
    Re-scrape even if the local markdown file already exists.

.EXAMPLE
    .\refresh.ps1
    .\refresh.ps1 -Section components
    .\refresh.ps1 -Section components -Page button
    .\refresh.ps1 -Force
#>
[CmdletBinding()]
param(
    [ValidateSet("getting-started", "ui-patterns", "fragments", "components", "all")]
    [string]$Section = "all",

    [string]$Page = "",

    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Continue"

# ---------------------------------------------------------------------------
# Page registry per section
# ---------------------------------------------------------------------------

$PagesBySection = @{
    "getting-started" = @(
        "accessibility"
        "color-usage"
        "copywriting"
        "icons"
        "tailwind-classes"
        "theming"
        "typography"
    )

    "ui-patterns" = @(
        "introduction"
        "charts"
        "empty-states"
        "forms"
        "layout"
        "markdown"
        "modality"
        "navigation"
        "tables"
    )

    "fragments" = @(
        "introduction"
        "admonition"
        "assistant-chat"
        "collapsible-alert"
        "collapsible-card-section"
        "confirmation-modal"
        "data-input"
        "empty-state-presentational"
        "error-display"
        "filter-bar"
        "form-item-layout"
        "info-tooltip"
        "inner-side-menu"
        "key-value-field-array"
        "logs-bar-chart"
        "metric-card"
        "multi-select"
        "page-breadcrumbs"
        "page-container"
        "page-header"
        "page-nav"
        "page-section"
        "single-value-field-array"
        "status-codes"
        "toc"
        "text-confirm-dialog"
    )

    "components" = @(
        "introduction"
        "accordion"
        "alert"
        "alert-dialog"
        "aspect-ratio"
        "avatar"
        "badge"
        "breadcrumb"
        "button"
        "calendar"
        "card"
        "carousel"
        "checkbox"
        "collapsible"
        "combobox"
        "command"
        "commandmenu"
        "context-menu"
        "date-picker"
        "dialog"
        "drawer"
        "dropdown-menu"
        "expanding-textarea"
        "field"
        "form"
        "hover-card"
        "input"
        "input-otp"
        "keyboard-shortcut"
        "label"
        "menubar"
        "mermaid"
        "nav-menu"
        "navigation-menu"
        "pagination"
        "popover"
        "progress"
        "radio-group"
        "radio-group-card"
        "radio-group-stacked"
        "resizable"
        "scroll-area"
        "select"
        "separator"
        "sheet"
        "sidebar"
        "skeleton"
        "slider"
        "sonner"
        "switch"
        "table"
        "tabs"
        "textarea"
        "toggle"
        "toggle-group"
        "tooltip"
        "tree-view"
    )
}

# ---------------------------------------------------------------------------
# URL builder
# ---------------------------------------------------------------------------

function Get-PageUrl {
    param([string]$SectionName, [string]$PageName)

    $base = "https://supabase.com/design-system/docs"

    if ($SectionName -eq "getting-started") {
        return "$base/$PageName"
    }
    return "$base/$SectionName/$PageName"
}

# ---------------------------------------------------------------------------
# HTML to Markdown converter
# ---------------------------------------------------------------------------

function Convert-HtmlToMarkdown {
    param([string]$Html)

    # --- Extract main content area ---
    # Try common main content selectors in order of specificity
    $content = $Html

    # Remove everything before main content
    if ($content -match '(?s)<main[^>]*>(.*)</main>') {
        $content = $Matches[1]
    }
    elseif ($content -match '(?s)<article[^>]*>(.*)</article>') {
        $content = $Matches[1]
    }
    elseif ($content -match '(?s)<div[^>]*class="[^"]*content[^"]*"[^>]*>(.*?)</div>\s*</div>') {
        $content = $Matches[1]
    }

    # --- Strip elements we never want ---
    # Remove script tags and contents
    $content = [regex]::Replace($content, '(?s)<script[^>]*>.*?</script>', '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    # Remove style tags and contents
    $content = [regex]::Replace($content, '(?s)<style[^>]*>.*?</style>', '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    # Remove nav elements
    $content = [regex]::Replace($content, '(?s)<nav[^>]*>.*?</nav>', '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    # Remove footer elements
    $content = [regex]::Replace($content, '(?s)<footer[^>]*>.*?</footer>', '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    # Remove aside / sidebar
    $content = [regex]::Replace($content, '(?s)<aside[^>]*>.*?</aside>', '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    # Remove SVG blocks (inline icons etc.)
    $content = [regex]::Replace($content, '(?s)<svg[^>]*>.*?</svg>', '', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    # Remove HTML comments
    $content = [regex]::Replace($content, '(?s)<!--.*?-->', '')

    # --- Convert code blocks (pre > code) BEFORE inline code ---
    # Fenced code blocks: <pre><code class="language-xyz">...</code></pre>
    $content = [regex]::Replace($content, '(?s)<pre[^>]*>\s*<code[^>]*class="[^"]*language-([^"]*)"[^>]*>(.*?)</code>\s*</pre>', {
        param($m)
        $lang = $m.Groups[1].Value.Trim()
        $code = $m.Groups[2].Value
        $code = [System.Net.WebUtility]::HtmlDecode($code)
        $code = $code -replace '<[^>]+>', ''
        "`n``````$lang`n$code`n```````n"
    })

    # Fenced code blocks without language hint
    $content = [regex]::Replace($content, '(?s)<pre[^>]*>\s*<code[^>]*>(.*?)</code>\s*</pre>', {
        param($m)
        $code = $m.Groups[1].Value
        $code = [System.Net.WebUtility]::HtmlDecode($code)
        $code = $code -replace '<[^>]+>', ''
        "`n```````n$code`n```````n"
    })

    # Bare <pre> without <code>
    $content = [regex]::Replace($content, '(?s)<pre[^>]*>(.*?)</pre>', {
        param($m)
        $code = $m.Groups[1].Value
        $code = [System.Net.WebUtility]::HtmlDecode($code)
        $code = $code -replace '<[^>]+>', ''
        "`n```````n$code`n```````n"
    })

    # --- Convert inline code ---
    $content = [regex]::Replace($content, '<code[^>]*>(.*?)</code>', '`$1`')

    # --- Convert headings ---
    for ($i = 6; $i -ge 1; $i--) {
        $hashes = "#" * $i
        $content = [regex]::Replace($content, "(?s)<h$i[^>]*>(.*?)</h$i>", "`n$hashes `$1`n")
    }

    # --- Convert emphasis ---
    $content = [regex]::Replace($content, '<strong[^>]*>(.*?)</strong>', '**$1**')
    $content = [regex]::Replace($content, '<b[^>]*>(.*?)</b>', '**$1**')
    $content = [regex]::Replace($content, '<em[^>]*>(.*?)</em>', '*$1*')
    $content = [regex]::Replace($content, '<i[^>]*>(.*?)</i>', '*$1*')

    # --- Convert links ---
    $content = [regex]::Replace($content, '<a[^>]*href="([^"]*)"[^>]*>(.*?)</a>', '[$2]($1)')

    # --- Convert images ---
    $content = [regex]::Replace($content, '<img[^>]*alt="([^"]*)"[^>]*src="([^"]*)"[^>]*/?\s*>', '![$1]($2)')
    $content = [regex]::Replace($content, '<img[^>]*src="([^"]*)"[^>]*alt="([^"]*)"[^>]*/?\s*>', '![$2]($1)')
    $content = [regex]::Replace($content, '<img[^>]*src="([^"]*)"[^>]*/?\s*>', '![]($1)')

    # --- Convert tables ---
    # This is a best-effort approach for simple HTML tables.
    # Extract rows, build markdown table.
    $content = [regex]::Replace($content, '(?s)<table[^>]*>(.*?)</table>', {
        param($m)
        $tableHtml = $m.Groups[1].Value
        $rows = [regex]::Matches($tableHtml, '(?s)<tr[^>]*>(.*?)</tr>')
        $mdTable = "`n"
        $rowIndex = 0
        foreach ($row in $rows) {
            $cells = [regex]::Matches($row.Groups[1].Value, '(?s)<t[hd][^>]*>(.*?)</t[hd]>')
            $cellTexts = @()
            foreach ($cell in $cells) {
                $text = $cell.Groups[1].Value -replace '<[^>]+>', ''
                $text = $text.Trim()
                $cellTexts += $text
            }
            $mdTable += "| " + ($cellTexts -join " | ") + " |`n"
            if ($rowIndex -eq 0) {
                $separator = @()
                foreach ($_ in $cellTexts) { $separator += "---" }
                $mdTable += "| " + ($separator -join " | ") + " |`n"
            }
            $rowIndex++
        }
        $mdTable
    })

    # --- Convert lists ---
    # Unordered lists
    $content = [regex]::Replace($content, '(?s)<ul[^>]*>(.*?)</ul>', {
        param($m)
        $listHtml = $m.Groups[1].Value
        $items = [regex]::Matches($listHtml, '(?s)<li[^>]*>(.*?)</li>')
        $mdList = "`n"
        foreach ($item in $items) {
            $text = $item.Groups[1].Value -replace '<[^>]+>', ''
            $text = $text.Trim()
            $mdList += "- $text`n"
        }
        $mdList
    })

    # Ordered lists
    $content = [regex]::Replace($content, '(?s)<ol[^>]*>(.*?)</ol>', {
        param($m)
        $listHtml = $m.Groups[1].Value
        $items = [regex]::Matches($listHtml, '(?s)<li[^>]*>(.*?)</li>')
        $mdList = "`n"
        $num = 1
        foreach ($item in $items) {
            $text = $item.Groups[1].Value -replace '<[^>]+>', ''
            $text = $text.Trim()
            $mdList += "$num. $text`n"
            $num++
        }
        $mdList
    })

    # --- Convert paragraphs ---
    $content = [regex]::Replace($content, '(?s)<p[^>]*>(.*?)</p>', "`n`$1`n")

    # --- Convert <br> ---
    $content = $content -replace '<br\s*/?>', "`n"

    # --- Convert <hr> ---
    $content = $content -replace '<hr\s*/?>', "`n---`n"

    # --- Strip all remaining HTML tags ---
    $content = $content -replace '<[^>]+>', ''

    # --- Decode HTML entities ---
    $content = [System.Net.WebUtility]::HtmlDecode($content)

    # --- Clean up whitespace ---
    # Collapse 3+ consecutive newlines to 2
    $content = [regex]::Replace($content, '(\r?\n){3,}', "`n`n")
    # Trim leading/trailing whitespace per line
    $lines = $content -split "`n" | ForEach-Object { $_.TrimEnd() }
    $content = ($lines -join "`n").Trim()

    return $content
}

# ---------------------------------------------------------------------------
# Scrape a single page
# ---------------------------------------------------------------------------

function Scrape-Page {
    param(
        [string]$SectionName,
        [string]$PageName,
        [switch]$ForceScrape
    )

    $scriptRoot = $PSScriptRoot
    if (-not $scriptRoot) { $scriptRoot = Split-Path -Parent $MyInvocation.ScriptName }
    if (-not $scriptRoot) { $scriptRoot = (Get-Location).Path }

    # Build output path
    if ($SectionName -eq "getting-started") {
        $outDir = Join-Path $scriptRoot "data\docs\getting-started"
    } else {
        $outDir = Join-Path $scriptRoot "data\docs\$SectionName"
    }
    $outFile = Join-Path $outDir "$PageName.md"

    # Skip if exists and not forcing
    if ((Test-Path $outFile) -and (-not $ForceScrape)) {
        return @{ Status = "skipped"; Page = $PageName; Section = $SectionName; Size = 0 }
    }

    # Ensure directory exists
    if (-not (Test-Path $outDir)) {
        New-Item -ItemType Directory -Path $outDir -Force | Out-Null
    }

    $url = Get-PageUrl -SectionName $SectionName -PageName $PageName

    Write-Host -NoNewline "  Scraping [$SectionName] $PageName... "

    try {
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 30 -ErrorAction Stop
        $html = $response.Content
        $markdown = Convert-HtmlToMarkdown -Html $html

        # Build frontmatter
        $today = (Get-Date).ToString("yyyy-MM-dd")
        $frontmatter = @"
---
source: $url
scraped: $today
section: $SectionName
---
"@

        $fullContent = "$frontmatter`n`n$markdown"

        Set-Content -Path $outFile -Value $fullContent -Encoding UTF8 -Force

        $sizeKb = [math]::Round((Get-Item $outFile).Length / 1024, 1)
        Write-Host "done ($sizeKb KB)"

        return @{ Status = "scraped"; Page = $PageName; Section = $SectionName; Size = $sizeKb }
    }
    catch {
        $errMsg = $_.Exception.Message
        Write-Host "FAILED ($errMsg)"
        return @{ Status = "failed"; Page = $PageName; Section = $SectionName; Error = $errMsg }
    }
}

# ---------------------------------------------------------------------------
# Main execution
# ---------------------------------------------------------------------------

Write-Host ""
Write-Host "=== Supabase Design System Docs Scraper ==="
Write-Host ""

# Determine which sections to process
if ($Section -eq "all") {
    $sectionsToProcess = @("getting-started", "ui-patterns", "fragments", "components")
} else {
    $sectionsToProcess = @($Section)
}

# Validate -Page usage
if ($Page -ne "" -and $Section -eq "all") {
    Write-Host "ERROR: -Page requires a specific -Section (not 'all')." -ForegroundColor Red
    Write-Host "Usage: .\refresh.ps1 -Section components -Page button"
    exit 1
}

# Collect results
$results = @{
    scraped  = 0
    failed   = 0
    skipped  = 0
    failures = @()
}

$totalPages = 0

foreach ($sec in $sectionsToProcess) {
    $pages = $PagesBySection[$sec]

    if (-not $pages -or $pages.Count -eq 0) {
        Write-Host "[$sec] No pages registered - skipping." -ForegroundColor Yellow
        continue
    }

    # Filter to single page if specified
    if ($Page -ne "") {
        if ($pages -contains $Page) {
            $pages = @($Page)
        } else {
            Write-Host "ERROR: Page '$Page' not found in section '$sec'." -ForegroundColor Red
            Write-Host "Known pages: $($PagesBySection[$sec] -join ', ')"
            exit 1
        }
    }

    Write-Host "--- $sec ($($pages.Count) pages) ---"

    foreach ($pg in $pages) {
        $totalPages++
        $result = Scrape-Page -SectionName $sec -PageName $pg -ForceScrape:$Force

        switch ($result.Status) {
            "scraped"  { $results.scraped++ }
            "failed"   {
                $results.failed++
                $results.failures += "$($result.Section)/$($result.Page): $($result.Error)"
            }
            "skipped"  {
                $results.skipped++
                Write-Host "  Scraping [$sec] $pg... skipped (already exists)"
            }
        }
    }

    Write-Host ""
}

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------

Write-Host "=== Summary ==="
Write-Host "  Total pages:  $totalPages"
Write-Host "  Scraped:      $($results.scraped)" -ForegroundColor Green
Write-Host "  Skipped:      $($results.skipped)" -ForegroundColor Cyan
Write-Host "  Failed:       $($results.failed)" -ForegroundColor $(if ($results.failed -gt 0) { "Red" } else { "Green" })

if ($results.failures.Count -gt 0) {
    Write-Host ""
    Write-Host "  Failed pages:"
    foreach ($f in $results.failures) {
        Write-Host "    - $f" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Output directory: $(Join-Path $PSScriptRoot 'data\docs')"
Write-Host ""
