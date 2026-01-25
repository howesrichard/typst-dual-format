# Typst Dual-Format Submodule

> **Usage:** When asking Claude to migrate content repos to use this submodule, reference this file:
> "Update Topic_N to use the submodule per `typst-dual-format/CLAUDE.md`"

This submodule provides a dual-format system for generating both presentation slides and long-form documents from the same Typst content.

## Key Files

- `dual_format.typ` - Main entry point (import this in content files)
- `presentation_functions.typ` - Slide-specific functions
- `document_functions.typ` - Document-specific functions

## Available Skills

When working with repositories that use this submodule, use the following skill:

- **typst-module-updates** - Guidance for migrating content files to use the submodule and handling function signature changes. Use this skill when:
  - Updating import paths from root `dual_format.typ` to submodule path
  - Encountering compilation errors after submodule updates
  - Migrating multiple Topic folders to use the submodule
  - Debugging formatting issues (centered text, overlapping content)

Invoke with: `/typst-module-updates`

## Quick Reference

### Import Paths
```typst
// Driver files (Topic_N/*.typ):
#import "../typst-dual-format/dual_format.typ": *

// Content files (Topic_N/Topic_N_Content/*.typ):
#import "../../typst-dual-format/dual_format.typ": *
```

### Common Pitfalls
1. `title-slide` requires named parameters: `title:`, `subtitle:`, `author:`
2. `content-block` uses `centered:` parameter (default: `false`)
3. `slide-break()` and `page-break()` cannot be inside `summary:` or `details:` containers
