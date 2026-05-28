# Design Preflight Index

> Routing table for the preflight agent. Read this first, then open only the files relevant to what's being built.

## Getting Started

### Foundations
- `docs/getting-started/introduction.md` — Design system overview, full component/pattern inventory, section map. Use for: orientation, finding what exists.
- `docs/getting-started/color-usage.md` — Semantic color tokens (text-light/muted/destructive/warning/brand, bg-200/alternative/selection, border-default/strong/muted), shorthand classes, contrast guidance. Use for: any color decisions, picking text/bg/border colors.
- `docs/getting-started/theming.md` — Three themes (light/dark/deep-dark + system), CSS custom properties migration, centralized theme management. Use for: theme-aware components, dark mode support.
- `docs/getting-started/tailwind-classes.md` — Six core tokens (background/foreground/border/brand/warning/destructive), shorthand classes (text-muted, bg-surface, border-strong), shade variants, opacity support, Figma-to-Tailwind pipeline. Use for: choosing correct utility classes, understanding token hierarchy.
- `docs/getting-started/typography.md` — CSS variable shorthands (text-code-inline, text-brand-link), Tailwind-based patterns not components. Use for: inline code styling, brand links, typography decisions.
- `docs/getting-started/icons.md` — Lucide as default icon set, custom icons (REST-api, analytics-bucket, auth, database, etc.), tinting rules (use text-foreground-muted, never text-destructive on icons), size defaults (24px). Use for: icon selection, icon styling, adding custom icons.
- `docs/getting-started/accessibility.md` — Keyboard focus (tabIndex, focus-visible, inset-focus), screen reader requirements, interactive table row patterns, radio group keyboard behavior, Safari quirks. Use for: any interactive element, keyboard navigation, a11y compliance.
- `docs/getting-started/copywriting.md` — UI copy voice (direct, action-oriented, pragmatic), verb-based buttons ("Create table" not "Submit"), label/description rules, error/success message patterns, tooltip guidance, heading casing, empty state copy, loading text. Use for: writing any UI text, labels, errors, tooltips, empty states.

## UI Patterns

### Data Visualization
- `docs/ui-patterns/charts.md` — Chart composition (Chart > ChartCard > ChartHeader+ChartContent+ChartFooter), ChartLine/ChartBar types, useChart context for loading/disabled states, syncId for multi-chart dashboards, Recharts-based. Use for: any data visualization, dashboards, observability.

### Content States
- `docs/ui-patterns/empty-states.md` — Initial state vs zero-results patterns, presentational vs informational approach, table empty rows (dampened headers, no hover), data grid empty states (illustration+title+description), search result persistence. Use for: any list/table/grid with no data, onboarding flows.
- `docs/ui-patterns/markdown.md` — Markdown renderer (react-markdown), props (children, codeBlock, components, remarkPlugins), syntax highlighting via lazy-loaded CodeBlock, GFM support, component overrides. Use for: rendering markdown content, blog posts, documentation pages.

### Page Composition
- `docs/ui-patterns/layout.md` — Page hierarchy (breadcrumbs first > PageNav > PageHeader > content), width variants (small/default/full), action placement (breadcrumb row vs header aside), PageSection usage, padding rules, scrolling containers. Use for: building any new page, page structure decisions.
- `docs/ui-patterns/forms.md` — Form patterns in page layouts and side panels, field types (text/password/copyable/number/textarea/switch/checkbox/select/radio/upload), FormItemLayout with flex-row-reverse, PageSection+Card composition. Use for: any settings page, form-heavy UI, field type selection.
- `docs/ui-patterns/tables.md` — Three table patterns: Table (static/simple), Data Table (TanStack Table, filtering, sorting, pagination), Data Grid (spreadsheet-like). Use for: choosing table implementation, data-heavy pages.

### Navigation & Modality
- `docs/ui-patterns/navigation.md` — NavMenu for horizontal sub-navigation (URL-driven), page title format (Entity|Section|Surface|Project|Org|Supabase), hierarchy structure. Use for: sub-navigation, browser tab titles, wayfinding.
- `docs/ui-patterns/modality.md` — Dialog selection guide: AlertDialog (single-paragraph critical), TextConfirmDialog (typed confirmation for destructive), ConfirmationModal (extra context/callouts), Dialog (general non-critical), Sheet (side panel forms). Use for: choosing the right modal/dialog type, confirmation flows.
- `docs/ui-patterns/introduction.md` — Purpose of UI patterns vs atoms, six pattern categories overview. Use for: understanding pattern-level vs component-level abstraction.

## Fragments

### Layout Fragments
- `docs/fragments/page-container.md` — Max-width wrapper with size variants (small: 768px, default: 1200px, large: 1600px, full: none). Use for: page width decisions, content containment.
- `docs/fragments/page-header.md` — Compound header (PageHeader > PageHeaderMeta > Icon+Summary+Aside), size variants, h1 title, description, action buttons. Use for: any page needing title/description/actions at top.
- `docs/fragments/page-breadcrumbs.md` — Full-width bordered breadcrumb bar, wraps shadcn Breadcrumb, PageBreadcrumbsActions for right-aligned buttons. Use for: page chrome, top-of-page location indicator.
- `docs/fragments/page-nav.md` — Full-width sub-navigation row below breadcrumbs, wraps NavMenu+NavMenuItem. Use for: tabbed page sections, sub-route navigation.
- `docs/fragments/page-section.md` — Compound section (PageSection > PageSectionMeta+Content), horizontal/vertical orientation, h2 headings, section-level actions. Use for: dividing page content into titled sections, settings groups.
- `docs/fragments/inner-side-menu.md` — Collapsible side menu with sections, items, separators, search/filter/sort, loading skeletons, empty panel. Use for: secondary navigation panels, resource browsers, sidebar menus within pages.

### Form Fragments
- `docs/fragments/form-item-layout.md` — Wrapper replacing manual FormItem+FormLabel+FormMessage+FormDescription composition, layout prop (flex-row-reverse for horizontal). Use for: any form field, simplifying form field boilerplate.
- `docs/fragments/data-input.md` — Specialized Input for read-only copyable values, distinct from atomic Input, keyboard+mouse friendly. Use for: displaying connection strings, API keys, read-only config values.
- `docs/fragments/key-value-field-array.md` — Repeated key/value text pair rows with react-hook-form, add/remove behavior, validation helpers. Use for: HTTP headers, environment variables, metadata key-value editors.
- `docs/fragments/single-value-field-array.md` — Repeated single text input rows with react-hook-form, add/remove, placeholder and label customization. Use for: redirect URIs, allowed origins, tag lists.
- `docs/fragments/filter-bar.md` — Advanced filtering with multiple conditions (AND/OR), string/number/date/boolean types, async options, free-form search, custom actions (AI filtering, saved queries). Use for: log filtering, data table filtering, search interfaces.
- `docs/fragments/collapsible-card-section.md` — Mono-uppercase collapsible trigger for hiding optional/advanced settings inside cards or panels. Use for: advanced settings sections, progressive disclosure in forms.
- `docs/fragments/multi-select.md` — Multiple selection dropdown (MultiSelector > Trigger+Content+List+Item+Input), optional search. Use for: multi-tag selection, multi-option pickers.
- `docs/fragments/assistant-chat.md` — Chat textarea with command popover, loading/disabled states, icon slot, submit handler. Use for: AI chat interfaces, conversational inputs.

### Data Display Fragments
- `docs/fragments/admonition.md` — Standard product callout (preferred over raw Alert), variants by type, optional title+description, button color guidance. Use for: info/warning/error callouts, product notices, inline guidance.
- `docs/fragments/collapsible-alert.md` — Alert-styled block with expandable content section, toggle button, owns alert styling. Use for: callouts with optional expanded details, expandable warnings.
- `docs/fragments/empty-state-presentational.md` — Empty state encouraging action: icon (Lucide/custom, defaults to SquarePlus), title prompting action, description explaining value, children for CTA buttons. Use for: first-time empty collections, feature onboarding.
- `docs/fragments/error-display.md` — Card surfacing API errors: warning header, monospace error block, optional troubleshooting slot, persistent support footer link. Use for: API error pages, failed-to-load states.
- `docs/fragments/info-tooltip.md` — Tooltip with info icon, Radix-based, side prop for placement. Use for: inline help hints, field explanations.
- `docs/fragments/metric-card.md` — Dashboard KPI card: label+tooltip, large value, differential (positive/negative), sparkline, loading state. Use for: dashboard metrics, analytics summaries, KPI displays.
- `docs/fragments/logs-bar-chart.md` — Stacked bar chart for logs (ok_count/error_count/warning_count over timestamps). Use for: logs pages, error rate visualization.
- `docs/fragments/status-codes.md` — HTTP status code display with method indicator (GET/POST/DELETE/PUT), color-coded by status range. Use for: API documentation, request logs, endpoint status display.
- `docs/fragments/toc.md` — Table of contents with scroll-aware anchor highlighting, single or multi-highlight modes, AnchorProvider context. Use for: long-form documentation pages, settings pages with sections.

### Modality Fragments
- `docs/fragments/confirmation-modal.md` — Dialog for confirmations needing extra context (explanatory copy, callouts, small form elements), not for critical destruction. Use for: moderate-risk confirmations, context-rich confirm flows.
- `docs/fragments/text-confirm-dialog.md` — Speed-bump modal requiring typed confirmation string for destructive actions, wraps Dialog. Use for: delete project/bucket, irreversible operations, explicit intent verification.

### Introduction
- `docs/fragments/introduction.md` — Fragment overview, 25 fragments listed by category (data display, forms, layout, modality, navigation). Use for: understanding fragment-level abstraction, browsing available fragments.

## Components

### Inputs & Forms
- `docs/components/button.md` — Button variants (primary/default/secondary/warning/destructive/outline/ghost/link), sizes (tiny-huge), loading state, icon left/right, asChild for custom elements. Use for: any clickable action.
- `docs/components/input.md` — Base form input field (shadcn), single-line text entry. Use for: text fields, email, search inputs.
- `docs/components/textarea.md` — Multi-line form text area (shadcn). Use for: long-form text input, descriptions, notes.
- `docs/components/expanding-textarea.md` — Auto-height textarea that grows/shrinks with content. Use for: chat inputs, comment fields, dynamic-height text areas.
- `docs/components/select.md` — Dropdown selection from list (Radix), Select > SelectTrigger+SelectContent+SelectItem. Use for: single-choice dropdowns, enum selection.
- `docs/components/combobox.md` — Autocomplete input combining Popover+Command, searchable dropdown with type-ahead. Use for: searchable selects, large option lists, entity pickers.
- `docs/components/checkbox.md` — Boolean toggle control (Radix), checked/unchecked states. Use for: boolean options, multi-select in forms, terms acceptance.
- `docs/components/radio-group.md` — Mutually exclusive radio buttons (Radix), RadioGroup+RadioGroupItem. Use for: single selection from small option set.
- `docs/components/radio-group-card.md` — Card-styled radio group (Radix), visual card selection with flex layout. Use for: plan selection, prominent single-choice with descriptions.
- `docs/components/radio-group-stacked.md` — Vertically stacked radio buttons with label+description per item. Use for: settings with explanatory text per option.
- `docs/components/switch.md` — On/off toggle (Radix), boolean state control. Use for: feature toggles, enable/disable settings.
- `docs/components/slider.md` — Range value input (Radix), defaultValue/max/step props. Use for: numeric range selection, volume/threshold controls.
- `docs/components/toggle.md` — Two-state on/off button (Radix). Use for: formatting toggles (bold/italic), mode switches.
- `docs/components/toggle-group.md` — Set of toggleable buttons (Radix), single or multi-select modes. Use for: view mode switchers, alignment pickers, filter chips.
- `docs/components/label.md` — Accessible form label (Radix), associates with controls via htmlFor. Use for: labeling any form input.
- `docs/components/field.md` — Compound accessible form field: Field > FieldLabel+FieldContent+FieldDescription+FieldError+FieldGroup+FieldSeparator. Use for: composing accessible form fields with labels, help text, errors.
- `docs/components/form.md` — React Hook Form integration with Zod validation, composable FormField/FormItem/FormLabel/FormControl/FormMessage, ARIA handling, useId. Use for: validated forms, schema-driven forms.
- `docs/components/input-otp.md` — One-time password input with copy-paste support, slot-based digit display. Use for: verification codes, 2FA inputs, OTP flows.
- `docs/components/date-picker.md` — Composable date picker (Popover+Calendar), range selection, presets support, date-fns formatting. Use for: date selection, date range pickers.
- `docs/components/calendar.md` — Date grid interface (react-day-picker), standalone calendar display. Use for: date picking UI, inline calendars.

### Data Display
- `docs/components/table.md` — Semantic HTML table (Table > TableHeader+TableBody+TableFooter+TableRow+TableCell+TableCaption), TableHeadSort for sortable columns. Use for: simple static tabular data, read-only tables.
- `docs/components/card.md` — Content container (Card > CardHeader+CardTitle+CardDescription+CardContent+CardFooter). Use for: grouping related content, settings panels, info blocks.
- `docs/components/badge.md` — Contextual metadata label, variants (default/secondary/outline/destructive), self-evident purpose from context. Use for: status indicators, tags, categories, counts.
- `docs/components/avatar.md` — User image with fallback text (Radix), Avatar > AvatarImage+AvatarFallback. Use for: user profile pictures, team member displays.
- `docs/components/aspect-ratio.md` — Maintains content within a fixed ratio (Radix). Use for: responsive images, video embeds, media containers.
- `docs/components/carousel.md` — Swipeable content slider (Embla Carousel), Carousel > CarouselContent+CarouselItem+CarouselNext+CarouselPrevious. Use for: image galleries, feature showcases, onboarding slides.
- `docs/components/mermaid.md` — Renders diagrams from Mermaid syntax (flowcharts, ER diagrams, sequences), works in JSX and MDX. Use for: technical documentation, visual diagrams, architecture illustrations.
- `docs/components/keyboard-shortcut.md` — Platform-aware shortcut label (pill or inline variant), renders logical key names (Meta+S). Use for: shortcut hints in menus, tooltips, command palettes.

### Navigation & Menus
- `docs/components/nav-menu.md` — Horizontal underline-style sub-navigation (NavMenu+NavMenuItem with active prop), URL-driven tab switching. Use for: page-level tab navigation, section switching.
- `docs/components/navigation-menu.md` — Full navigation menu with dropdown content panels (Radix), link collections for site navigation. Use for: top-level site navigation, mega menus.
- `docs/components/breadcrumb.md` — Hierarchical path display (Breadcrumb > BreadcrumbList+BreadcrumbItem+BreadcrumbLink+BreadcrumbSeparator). Use for: location breadcrumbs, path indicators.
- `docs/components/pagination.md` — Page navigation with next/previous links and ellipsis. Use for: paginated lists, table pagination controls.
- `docs/components/tabs.md` — Layered content panels (Radix), Tabs > TabsList+TabsTrigger+TabsContent. Use for: in-place content switching, tabbed interfaces.
- `docs/components/sidebar.md` — Composable app sidebar with CSS variables theming, collapsible, complex sub-component tree. Use for: primary app navigation, collapsible side panels.
- `docs/components/tree-view.md` — Accordion-based hierarchical tree (react-accessible-treeview), flattenTree utility, keyboard accessible. Use for: file browsers, nested category navigation, org hierarchies.
- `docs/components/menubar.md` — Persistent desktop-style menu bar (Radix), top-level menus with submenus and keyboard shortcuts. Use for: desktop-app-like menu bars, editor toolbars.
- `docs/components/command.md` — Fast composable command palette (cmdk), searchable command list with groups and shortcuts. Use for: command palettes, quick-action search, keyboard-driven navigation.
- `docs/components/commandmenu.md` — Central command menu (cmd-k), searchable actions, CommandProvider+useRegisterCommands for dynamic registration. Use for: app-wide command center, global search, action launcher.

### Overlays & Modality
- `docs/components/dialog.md` — General-purpose modal for non-critical flows (Radix), closable by click-outside/Escape, safe dismissal. Use for: forms in modals, multi-step flows, non-urgent information.
- `docs/components/alert-dialog.md` — Critical confirmation modal requiring explicit action (Radix), interrupts workflow, AlertDialog > Header+Title+Description+Body+Footer+Action+Cancel. Use for: destructive confirmations, critical acknowledgements.
- `docs/components/drawer.md` — Slide-out panel (Vaul), swipe-dismissible. Use for: mobile-friendly modals, bottom sheets.
- `docs/components/sheet.md` — Side panel extending Dialog (Radix), supplementary content alongside main screen. Use for: detail panels, side forms, property editors.
- `docs/components/popover.md` — Rich content portal triggered by button (Radix). Use for: inline forms, color pickers, settings popovers.
- `docs/components/hover-card.md` — Preview content on hover (Radix), for sighted users to preview behind a link. Use for: user profile previews, link previews, rich tooltips.
- `docs/components/tooltip.md` — Contextual popup on focus/hover (Radix), TooltipProvider+Tooltip+TooltipTrigger+TooltipContent. Use for: icon explanations, abbreviated text expansion, help hints.
- `docs/components/dropdown-menu.md` — Action/function menu triggered by button (Radix), items+labels+separators+submenus. Use for: action menus, more-options dropdowns, context actions.
- `docs/components/context-menu.md` — Right-click triggered action menu (Radix), same structure as dropdown menu. Use for: right-click menus, contextual actions on elements.

### Layout & Structure
- `docs/components/accordion.md` — Vertically stacked collapsible sections (Radix), WAI-ARIA compliant, animation keyframes. Use for: FAQ sections, expandable content groups, settings panels.
- `docs/components/collapsible.md` — Low-level reveal/hide primitive (shadcn), generic disclosure for rows/sections/menus. Use for: custom show/hide behavior, collapsible sections without alert styling.
- `docs/components/separator.md` — Visual/semantic content divider, horizontal or vertical. Use for: section dividers, menu separators, visual breaks.
- `docs/components/resizable.md` — Draggable panel groups (react-resizable-panels), ResizablePanelGroup+ResizablePanel+ResizableHandle. Use for: split-pane layouts, resizable editors, adjustable panels.
- `docs/components/scroll-area.md` — Cross-browser custom scrollbar (Radix), augments native scroll. Use for: scrollable containers needing custom scrollbar styling.

### Feedback & Status
- `docs/components/alert.md` — Low-level callout primitive (shadcn), Alert+AlertTitle+AlertDescription, variant-based styling. Prefer Admonition for standard callouts. Use for: custom alert compositions needing bespoke icons or layouts.
- `docs/components/skeleton.md` — Loading placeholder with animated pulse. Use for: content loading states, placeholder layouts.
- `docs/components/progress.md` — Task completion indicator bar (Radix). Use for: upload progress, step completion, loading bars.
- `docs/components/sonner.md` — Toast notification system (sonner by emilkowalski), add Toaster to root layout. Use for: success/error/info notifications, action confirmations.

### Introduction
- `docs/components/introduction.md` — Atom component overview, shadcn/ui foundation, full component inventory by category. Use for: browsing all available atoms, understanding component-level abstraction.

## Antipatterns (opt-in: --antipatterns flag)

- `antipatterns/sidebar-icon-centering.md` — Fixed-width inner container with px-* padding inside collapsible sidebar shifts icon off-center when collapsed. Fix: conditional padding (px-1.5 when expanded, px-0 when collapsed). Applies when: hand-rolled collapsible sidebar with overflow-hidden collapse and horizontal padding.
- `antipatterns/sidebar-label-overflow-clip.md` — Labels hidden only by overflow-hidden remain in DOM, cause choppy partial-text flash during transition, and leak to screen readers. Fix: animate labels with opacity+translate, pass isExpanded state. Applies when: collapsible sidebar with icon-only collapsed state using overflow-hidden to hide labels.

## Source Code (deep depth only)

- Supabase UI components: local clone or `node_modules/@supabase/ui/src/components/` — Real component implementations, prop types, internal logic
- Supabase UI layout: local clone or `node_modules/@supabase/ui/src/layout/` — Layout primitives, page structure internals
