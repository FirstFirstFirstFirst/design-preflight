#!/usr/bin/env node

import { existsSync, mkdirSync, cpSync, readFileSync } from "node:fs";
import { join, dirname } from "node:path";
import { homedir } from "node:os";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const pkgRoot = join(__dirname, "..");
const skillSource = join(pkgRoot, "skill");
const skillName = "design-preflight";

const claudeDir = join(homedir(), ".claude", "skills", skillName);
const force = process.argv.includes("--force");

if (existsSync(claudeDir) && !force) {
  console.log(`\n  Skill already installed at: ${claudeDir}`);
  console.log(`  Use --force to overwrite.\n`);
  process.exit(0);
}

console.log(`\n  Installing ${skillName} skill...`);
console.log(`  Target: ${claudeDir}\n`);

mkdirSync(claudeDir, { recursive: true });
cpSync(skillSource, claudeDir, { recursive: true, force: true });

const pkg = JSON.parse(readFileSync(join(pkgRoot, "package.json"), "utf8"));

console.log(`  Done! Installed ${skillName} v${pkg.version}`);
console.log(`  Location: ${claudeDir}`);
console.log(`\n  Usage in Claude Code:`);
console.log(`    /design-preflight`);
console.log(`    /design-preflight quick`);
console.log(`    /design-preflight deep --antipatterns`);
console.log(`\n  To update docs: cd ${claudeDir} && node refresh.mjs --force`);
console.log();
