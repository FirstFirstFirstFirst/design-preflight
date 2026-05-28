#!/usr/bin/env node

import { existsSync, mkdirSync, writeFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));

const PAGES_BY_SECTION = {
  "getting-started": [
    "accessibility", "color-usage", "copywriting", "icons",
    "tailwind-classes", "theming", "typography",
  ],
  "ui-patterns": [
    "introduction", "charts", "empty-states", "forms",
    "layout", "markdown", "modality", "navigation", "tables",
  ],
  fragments: [
    "introduction", "admonition", "assistant-chat", "collapsible-alert",
    "collapsible-card-section", "confirmation-modal", "data-input",
    "empty-state-presentational", "error-display", "filter-bar",
    "form-item-layout", "info-tooltip", "inner-side-menu",
    "key-value-field-array", "logs-bar-chart", "metric-card",
    "multi-select", "page-breadcrumbs", "page-container", "page-header",
    "page-nav", "page-section", "single-value-field-array", "status-codes",
    "toc", "text-confirm-dialog",
  ],
  components: [
    "introduction", "accordion", "alert", "alert-dialog", "aspect-ratio",
    "avatar", "badge", "breadcrumb", "button", "calendar", "card",
    "carousel", "checkbox", "collapsible", "combobox", "command",
    "commandmenu", "context-menu", "date-picker", "dialog", "drawer",
    "dropdown-menu", "expanding-textarea", "field", "form", "hover-card",
    "input", "input-otp", "keyboard-shortcut", "label", "menubar",
    "mermaid", "nav-menu", "navigation-menu", "pagination", "popover",
    "progress", "radio-group", "radio-group-card", "radio-group-stacked",
    "resizable", "scroll-area", "select", "separator", "sheet", "sidebar",
    "skeleton", "slider", "sonner", "switch", "table", "tabs", "textarea",
    "toggle", "toggle-group", "tooltip", "tree-view",
  ],
};

function getPageUrl(section, page) {
  const base = "https://supabase.com/design-system/docs";
  if (section === "getting-started") return `${base}/${page}`;
  return `${base}/${section}/${page}`;
}

function decodeEntities(str) {
  return str
    .replace(/&amp;/g, "&").replace(/&lt;/g, "<").replace(/&gt;/g, ">")
    .replace(/&quot;/g, '"').replace(/&#39;/g, "'").replace(/&#x27;/g, "'")
    .replace(/&nbsp;/g, " ");
}

function htmlToMarkdown(html) {
  let c = html;
  const m = c.match(/<main[^>]*>([\s\S]*)<\/main>/i);
  if (m) c = m[1];
  else { const a = c.match(/<article[^>]*>([\s\S]*)<\/article>/i); if (a) c = a[1]; }

  c = c.replace(/<script[^>]*>[\s\S]*?<\/script>/gi, "");
  c = c.replace(/<style[^>]*>[\s\S]*?<\/style>/gi, "");
  c = c.replace(/<nav[^>]*>[\s\S]*?<\/nav>/gi, "");
  c = c.replace(/<footer[^>]*>[\s\S]*?<\/footer>/gi, "");
  c = c.replace(/<aside[^>]*>[\s\S]*?<\/aside>/gi, "");
  c = c.replace(/<svg[^>]*>[\s\S]*?<\/svg>/gi, "");
  c = c.replace(/<!--[\s\S]*?-->/g, "");

  c = c.replace(/<pre[^>]*>\s*<code[^>]*class="[^"]*language-([^"]*)"[^>]*>([\s\S]*?)<\/code>\s*<\/pre>/gi,
    (_, lang, code) => `\n\`\`\`${lang.trim()}\n${decodeEntities(code.replace(/<[^>]+>/g, ""))}\n\`\`\`\n`);
  c = c.replace(/<pre[^>]*>\s*<code[^>]*>([\s\S]*?)<\/code>\s*<\/pre>/gi,
    (_, code) => `\n\`\`\`\n${decodeEntities(code.replace(/<[^>]+>/g, ""))}\n\`\`\`\n`);
  c = c.replace(/<pre[^>]*>([\s\S]*?)<\/pre>/gi,
    (_, code) => `\n\`\`\`\n${decodeEntities(code.replace(/<[^>]+>/g, ""))}\n\`\`\`\n`);
  c = c.replace(/<code[^>]*>(.*?)<\/code>/gi, "`$1`");

  for (let i = 6; i >= 1; i--)
    c = c.replace(new RegExp(`<h${i}[^>]*>([\\s\\S]*?)<\\/h${i}>`, "gi"), `\n${"#".repeat(i)} $1\n`);

  c = c.replace(/<strong[^>]*>(.*?)<\/strong>/gi, "**$1**");
  c = c.replace(/<b[^>]*>(.*?)<\/b>/gi, "**$1**");
  c = c.replace(/<em[^>]*>(.*?)<\/em>/gi, "*$1*");
  c = c.replace(/<a[^>]*href="([^"]*)"[^>]*>(.*?)<\/a>/gi, "[$2]($1)");
  c = c.replace(/<img[^>]*src="([^"]*)"[^>]*\/?>/gi, "![]($1)");

  c = c.replace(/<table[^>]*>([\s\S]*?)<\/table>/gi, (_, t) => {
    const rows = [...t.matchAll(/<tr[^>]*>([\s\S]*?)<\/tr>/gi)];
    let md = "\n";
    rows.forEach((row, idx) => {
      const cells = [...row[1].matchAll(/<t[hd][^>]*>([\s\S]*?)<\/t[hd]>/gi)];
      const texts = cells.map(c => c[1].replace(/<[^>]+>/g, "").trim());
      md += `| ${texts.join(" | ")} |\n`;
      if (idx === 0) md += `| ${texts.map(() => "---").join(" | ")} |\n`;
    });
    return md;
  });

  c = c.replace(/<ul[^>]*>([\s\S]*?)<\/ul>/gi, (_, l) => {
    return "\n" + [...l.matchAll(/<li[^>]*>([\s\S]*?)<\/li>/gi)].map(i => `- ${i[1].replace(/<[^>]+>/g, "").trim()}`).join("\n") + "\n";
  });
  c = c.replace(/<ol[^>]*>([\s\S]*?)<\/ol>/gi, (_, l) => {
    return "\n" + [...l.matchAll(/<li[^>]*>([\s\S]*?)<\/li>/gi)].map((i, n) => `${n+1}. ${i[1].replace(/<[^>]+>/g, "").trim()}`).join("\n") + "\n";
  });

  c = c.replace(/<p[^>]*>([\s\S]*?)<\/p>/gi, "\n$1\n");
  c = c.replace(/<br\s*\/?>/gi, "\n");
  c = c.replace(/<hr\s*\/?>/gi, "\n---\n");
  c = c.replace(/<[^>]+>/g, "");
  c = decodeEntities(c);
  c = c.replace(/(\r?\n){3,}/g, "\n\n");
  return c.split("\n").map(l => l.trimEnd()).join("\n").trim();
}

async function scrapePage(section, page, force) {
  const outDir = section === "getting-started"
    ? join(__dirname, "data", "docs", "getting-started")
    : join(__dirname, "data", "docs", section);
  const outFile = join(outDir, `${page}.md`);

  if (existsSync(outFile) && !force) return { status: "skipped", section, page };

  mkdirSync(outDir, { recursive: true });
  const url = getPageUrl(section, page);
  process.stdout.write(`  [${section}] ${page}... `);

  try {
    const res = await fetch(url, { signal: AbortSignal.timeout(30000) });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const html = await res.text();
    const md = htmlToMarkdown(html);
    const today = new Date().toISOString().split("T")[0];
    const content = `---\nsource: ${url}\nscraped: ${today}\nsection: ${section}\n---\n\n${md}`;
    writeFileSync(outFile, content, "utf8");
    const kb = (Buffer.byteLength(content, "utf8") / 1024).toFixed(1);
    console.log(`done (${kb} KB)`);
    return { status: "scraped", section, page, size: kb };
  } catch (err) {
    console.log(`FAILED (${err.message})`);
    return { status: "failed", section, page, error: err.message };
  }
}

const args = process.argv.slice(2);
const force = args.includes("--force");
let section = "all", page = "";
const si = args.indexOf("--section"); if (si !== -1 && args[si+1]) section = args[si+1];
const pi = args.indexOf("--page"); if (pi !== -1 && args[pi+1]) page = args[pi+1];

if (page && section === "all") { console.error("--page requires --section"); process.exit(1); }

const secs = section === "all" ? ["getting-started","ui-patterns","fragments","components"] : [section];
console.log("\n=== Supabase DS Docs Scraper ===\n");
const res = { scraped: 0, failed: 0, skipped: 0, failures: [] };

for (const sec of secs) {
  let pages = PAGES_BY_SECTION[sec];
  if (!pages) { console.log(`[${sec}] No pages.`); continue; }
  if (page) {
    if (!pages.includes(page)) { console.error(`'${page}' not in '${sec}'.`); process.exit(1); }
    pages = [page];
  }
  console.log(`--- ${sec} (${pages.length}) ---`);
  for (const pg of pages) {
    const r = await scrapePage(sec, pg, force);
    if (r.status === "scraped") res.scraped++;
    else if (r.status === "failed") { res.failed++; res.failures.push(`${r.section}/${r.page}: ${r.error}`); }
    else { res.skipped++; console.log(`  [${sec}] ${pg}... skipped`); }
  }
  console.log();
}

console.log(`=== Done: ${res.scraped} scraped, ${res.skipped} skipped, ${res.failed} failed ===`);
if (res.failures.length) res.failures.forEach(f => console.log(`  FAIL: ${f}`));
console.log();
