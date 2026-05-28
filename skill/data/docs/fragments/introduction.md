---
source: https://supabase.com/design-system/docs/fragments/introduction
scraped: 2026-05-27
section: fragments
---

# Fragment Components - Supabase Design System

## Overview

"Fragment components are pre-built composite components that combine multiple atom components to create reusable interface elements."

These components serve as middle-ground solutions between basic atom components (buttons, inputs) and full UI patterns (page-level structures). They address specific, recurring interface needs across Supabase products.

## Purpose

Fragment components enable:
- **Consistency** across Supabase applications through standardized implementations
- **Reduced boilerplate** by encapsulating common component combinations
- **Predictable behavior** via pre-configured solutions for interface patterns

## Available Fragment Components

The design system includes 25 fragment components organized by function:

**Data & Information Display:**
- Admonition
- Empty State Presentational
- Error Display
- Info Tooltip
- Logs Bar Chart
- Metric Card
- Status Codes
- Table of Contents (TOC)

**Navigation & Structure:**
- Inner Side Menu
- Page Breadcrumbs
- Page Container
- Page Header
- Page Nav
- Page Section

**Forms & Input:**
- Collapsible Card Section
- Data Input
- Filter Bar
- Form Item Layout
- Key/Value Field Array
- Multi Select
- Single Value Field Array

**Interaction & Feedback:**
- Assistant Chat
- Collapsible Alert
- Confirmation Modal
- Text Confirm Dialog

## Implementation

Fragment components are imported from the `ui-patterns` package and integrate directly into applications without additional configuration requirements.
