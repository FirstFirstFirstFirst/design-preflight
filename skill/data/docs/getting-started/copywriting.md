---
source: https://supabase.com/design-system/docs/copywriting
scraped: 2026-05-27
section: getting-started
---

# Copywriting Guide - Supabase Design System

## Overview
The Supabase copywriting guide establishes standards for UI text that prioritizes developer efficiency and clarity. The core principle: "Write UI copy that helps developers complete tasks quickly. Be direct, action-oriented, and respectful of developer time."

## Key Voice & Tone Principles

The guidance emphasizes four qualities:
- **Direct**: Explain functionality plainly without abstract language
- **Action-oriented**: Emphasize outcomes rather than capabilities
- **Technical without jargon**: Use precise terminology with explanation when needed
- **Pragmatic**: Acknowledge limitations and tradeoffs

## Buttons and Actions

**Verb-based naming**: Action buttons should use verbs. Rather than generic terms like "Submit," use specific outcomes such as "Create table."

Button text should match the action being performed. Secondary actions should use clear alternatives like "Cancel" instead of "Go back."

## Form Labels and Descriptions

Labels should identify the field directly ("Table name") rather than instructionally ("Name your table"). Descriptions focus on constraints—"Maximum 255 characters"—not conceptual explanations.

Present tense is preferred: "Stores connection pool settings" rather than future tense phrasing.

## Error Messages

Effective error copy should:
- State the specific problem followed by resolution steps
- Avoid generic statements like "An error occurred"
- Skip apologetic language; use neutral, factual phrasing

Example: "Password must be at least 8 characters" provides actionable guidance.

## Success Messages

Keep confirmations brief and specific. Rather than "Success!", use "Table created successfully" to confirm what actually occurred.

## Tooltips and Help Text

These should explain the *why* behind features rather than describing interface elements. Limited to one sentence maximum.

## Navigation and Headings

- **Page titles**: Title case in global navigation ("Database Settings")
- **Section headings**: Sentence case ("Set up authentication")
- **Page descriptions**: Declarative fragments describing content scope

## Empty States

When no data exists, explain what's missing and provide the next action: "No tables yet. Create your first table to get started."

## Loading States

Copy should describe the specific operation: "Creating table..." or "Loading schema..." rather than generic placeholders.

## Confirmation Dialogs

State consequences explicitly using active voice: "Deleting this project will remove all data" rather than passive construction.

## Words to Avoid

- Marketing language ("Easily," "Simply," "Powerful")
- Vague verbs ("Manage," "Handle," "Work with")

## Capitalization Standards

- Sentence case for UI text generally
- Title case for page navigation names
- Product names capitalized: Database, Auth, Storage, Edge Functions, Realtime, Vector
- "Postgres" (not PostgreSQL)

## Formatting Rules

- Bold only when necessary for emphasis
- Inline code for technical terms: `RLS`, `API key`
- No italics for emphasis
- Exclamation marks reserved for critical warnings

## Quality Checklist

Before publishing, verify the copy:
- Uses action verbs
- Specifies outcomes clearly
- Enables task completion without additional documentation
- Avoids promotional language
- Applies sentence case
- Maintains brevity (one sentence for labels/buttons/tooltips)
