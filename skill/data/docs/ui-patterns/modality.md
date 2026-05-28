---
source: https://supabase.com/design-system/docs/ui-patterns/modality
scraped: 2026-05-27
section: ui-patterns
---

# Supabase Design System: Modality Guide

## Overview
The modality section addresses how to present ephemeral information and demand user action. As stated in the documentation, "Modal elements interrupt the user's current task to ask for input, a decision, or focused attention."

## Primary Use Cases
Modal implementations serve three main purposes:
- Requesting user confirmation
- Collecting ephemeral form data before completing actions
- Alerting users or creating friction before destructive operations

## Two Main Approaches

### Dialogs
Centered overlays designed for brief, focused interactions. Key principles include:
- **Reiterative design** where headers and buttons align with user expectations
- **Simplicity** by eliminating unnecessary layered elements
- **Accessibility** through semantic HTML and proper ARIA attributes

**Available Dialog Components:**
- Alert Dialog: Single-paragraph critical confirmations
- Text Confirm Dialog: Requires typed confirmation strings for destructive actions
- Confirmation Modal: Flexible bodies with context, callouts, or supporting controls
- Dialog: General-purpose modal for custom flows

### Sheets
Side-panel modals appropriate for larger content volumes. Documentation recommends using them for "multi-field forms, editors, settings panels, and detailed views." Default behavior slides panels from the right.

## Best Practices: Dirty Form Dismissal

When forms exist within modals, the documentation outlines a decision flow: attempt closure, check if form has changes, display confirmation dialog if modifications exist, then allow users to either "Keep editing" or "Discard changes."

Implementation guidance includes intercepting close attempts, routing cancel buttons through guards, and rendering separate discard confirmations—without blocking arbitrary unmounts.
