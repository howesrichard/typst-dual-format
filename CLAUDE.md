# Typst Dual-Format Submodule

> **Usage:** When asking Claude to migrate content repos to use this submodule, reference this file:
> "Update Topic_N to use the submodule per `typst-dual-format/CLAUDE.md`"

This submodule provides a dual-format system for generating both presentation slides and long-form documents from the same Typst content.

## Conceptual Model

The same source generates two outputs that are designed to be **faithful companions**: the long-form document includes a representation of every slide (in a gray "Summary Slide:" box) alongside its long-form expansion, so a reader of the document sees what the audience saw plus the deeper material that didn't fit on the slide.

The primary authoring unit is `content-block`. Its parameters map to the two outputs as follows:

| Parameter | Presentation | Document |
| --- | --- | --- |
| `title` / `subtext` | Slide header | Section heading (`==`) |
| `summary` | Slide body | Gray "Summary Slide:" box |
| `details` | (not shown) | Long-form prose below the box |
| `examples` | Separate "Examples" slide | Orange examples box inline |

**Visual contract in the document:**

- **Solid black border + "Summary Slide:" label** → there is a corresponding slide in the presentation
- **Dashed gray border + "Summary Slide (not presented):" label** → the content is document-only; no corresponding slide (produced by `content-block-doc-only`)

This contract lets a reader of the document tell at a glance which sections were actually presented as slides and which are reference-only.

### Other primitives

- `content-block-doc-only(...)` — same signature as `content-block`, but renders nothing in presentation mode and uses the dashed-border treatment in document mode. Use this when culling a slide while keeping the underlying material in the document.
- `presentation-only(content)` / `document-only(content)` — fine-grained per-snippet wrappers for content that doesn't fit the content-block model.
- `advanced-content(content)` — wraps optional/advanced material that can be hidden in core teaching versions via the `--input advanced=false` compiler flag.
- `slide-break()` / `page-break()` — emit a break only in the relevant output mode.

## Key Files

- `dual_format.typ` - Main entry point (import this in content files)
- `presentation_functions.typ` - Slide-specific functions
- `document_functions.typ` - Document-specific functions

## Available Skills

When working with repositories that use this submodule, use the following skill:

- **typst-dual-format-troubleshooting** - Reference for function signatures, container restrictions, and common errors. Use this skill when:
  - Encountering compilation errors related to `content-block`, `title-slide`, or other dual-format functions
  - Debugging formatting issues (overlapping content, centered text, unexpected layout)
  - Looking up function signatures or parameter names
  - Verifying usage patterns after a submodule bump

Invoke with: `/typst-dual-format-troubleshooting`

## Quick Reference

### Import Paths

```typst
// Driver files (Topic_N/*.typ):
#import "../typst-dual-format/dual_format.typ": *

// Content files (Topic_N/Topic_N_Content/*.typ):
#import "../../typst-dual-format/dual_format.typ": *
```

### Document-Only Content Blocks

Use `content-block-doc-only(...)` to keep content in the document while excluding it from the slides. It takes the same parameters as `content-block`, so converting a slide-bearing block into a doc-only block (or back) is a one-token rename:

```typst
#content-block-doc-only(
  title: "Background detail",
  summary: [Brief framing — appears in a dashed box labeled "Summary Slide (not presented):"],
  details: [Long-form content...]
)
```

Do **not** wrap a regular `content-block(...)` in `document-only(...)` to achieve this — that still renders the gray "Summary Slide:" box in the document, which falsely implies a slide existed. `content-block-doc-only` uses the dashed-border treatment so readers can distinguish elided slides from real ones.

### Common Pitfalls

1. `title-slide` requires named parameters: `title:`, `subtitle:`, `author:`
2. `content-block` uses `centered:` parameter (default: `false`)
3. `slide-break()` and `page-break()` cannot be inside `summary:` or `details:` containers
4. To exclude a content-block from slides while keeping it in the document, use `content-block-doc-only(...)` rather than `document-only(content-block(...))`
