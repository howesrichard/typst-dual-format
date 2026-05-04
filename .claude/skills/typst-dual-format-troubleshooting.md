# Typst Dual-Format Troubleshooting Skill

Reference for function signatures, container restrictions, and common errors when authoring content with the `typst-dual-format` submodule. Use this when a compilation fails, a slide doesn't render as expected, or a parameter name needs verification.

For the conceptual model (slide ↔ document mapping, what `summary` / `details` / `examples` control, when to use `content-block-doc-only` vs. `content-block`), see the submodule's [CLAUDE.md](../../CLAUDE.md) — that's the durable reference. This skill collects the gotchas that aren't obvious from the source.

## Repository Structure

### Submodule Files (typst-dual-format/)

- `dual_format.typ` - Main entry point, imports and re-exports presentation and document functions
- `presentation_functions.typ` - Slide-specific functions (`title-slide`, `slide-break`, etc.)
- `document_functions.typ` - Document-specific functions (`page-break`, etc.)

### Content Repository Layout

```text
Topic_N/
├── Topic_N_slides.typ      # Presentation driver
├── Topic_N_document.typ    # Document driver
├── Topic_N.typ             # Optional standalone content file
├── Topic_N_Content/        # Content modules
│   ├── Agenda.typ
│   ├── Introduction.typ
│   └── ...
└── Topic_N_QA/             # Optional Q&A files
    ├── Topic_N_questions.typ
    └── Topic_N_answers.typ
```

Driver files import the submodule via `#import "../typst-dual-format/dual_format.typ": *`; content files use `../../typst-dual-format/dual_format.typ`.

## Function Signatures

### `title-slide`

Requires **named parameters only**:

```typst
// WRONG - positional argument not supported:
#title-slide(
  "Topic Title",
  author: "Author Name",
  date: "2025"
)

// CORRECT - use named parameters:
#title-slide(
  title: "Topic Title",
  author: "Author Name",
  subtitle: "2025"  // Note: 'subtitle' not 'date'
)
```

### `content-block`

- Parameter is `centered` (not `center`)
- Default is `centered: false` (left-justified)
- Use `centered: true` only when you specifically want centered content

```typst
#content-block(
  title: "Section Title",
  centered: false,  // Explicit is safer
  summary: [...],
  details: [...]
)
```

### `content-block-doc-only`

Same signature as `content-block`. Renders nothing in presentation mode; in document mode renders with a **dashed** gray border and a **"Summary Slide (not presented):"** label so the reader can see the content has no corresponding slide.

Use this when culling a slide while keeping its underlying material in the document. Converting between `content-block` and `content-block-doc-only` is a one-token rename — no other changes needed.

```typst
#content-block-doc-only(
  title: "Background detail",
  summary: [Brief framing — appears in dashed-border "(not presented)" box],
  details: [Long-form content shown only in the document...]
)
```

**Do not** use `document-only(content-block(...))` for this purpose — that still renders the gray "Summary Slide:" box in the document, falsely implying a slide existed. The dashed-border variant is the correct visual contract for elided slides.

## Container Restrictions

**CRITICAL:** `slide-break()` and `page-break()` cannot be placed inside container parameters.

```typst
// WRONG - will cause "pagebreaks are not allowed inside of containers" error:
#content-block(
  title: "Title",
  summary: [
    Some content here...
    #slide-break()  // ERROR: inside summary container
    More content...
  ]
)

// CORRECT - place breaks between content-blocks:
#content-block(
  title: "First Section",
  summary: [Some content here...]
)

#slide-break()
#page-break()

#content-block(
  title: "Second Section",
  summary: [More content...]
)
```

## Elements Outside Content-Blocks (Overlapping Issue)

**CRITICAL:** ANY content placed **outside** a `content-block` but intended to appear on the same slide will overlap in presentation mode. This includes `#concept-box`, plain text paragraphs, or any other elements.

```typst
// WRONG - concept-box outside content-block causes overlapping:
#content-block(
  title: "Comparison",
  summary: [
    #grid(
      columns: (1fr, 1fr, 1fr),
      concept-box([Box 1]),
      concept-box([Box 2]),
      concept-box([Box 3])
    )
  ],
  details: [...]
)

#concept-box([Summary box])  // THIS OVERLAPS with content above!


// ALSO WRONG - plain text paragraph outside content-block:
#content-block(
  title: "Key Points",
  summary: [...grid content...],
  details: [...]
)

Hence, this summary paragraph will overlap with the slide above!


// CORRECT - move ALL content inside the summary parameter:
#content-block(
  title: "Comparison",
  summary: [
    #grid(
      columns: (1fr, 1fr, 1fr),
      concept-box([Box 1]),
      concept-box([Box 2]),
      concept-box([Box 3])
    )

    #concept-box([Summary box])  // Now flows correctly after the grid

    Hence, this summary paragraph now flows correctly.
  ],
  details: [...]
)
```

**Why this happens:** In presentation mode, each `content-block` defines a slide's content area. Elements outside the block are rendered separately and can overlap with the block's content.

## Verification Steps

After making changes, always verify compilation:

```bash
# Compile slides
typst compile Topic_N/Topic_N_slides.typ --root . /tmp/test_slides.pdf

# Compile document
typst compile Topic_N/Topic_N_document.typ --root . /tmp/test_doc.pdf
```

**Visual checks:**

- Text should be left-justified (not centered) unless `centered: true` is set
- No overlapping or superimposed text
- Page breaks occur at expected locations
- Title slides render correctly

## Reference Examples

Working examples in `typst-dual-format/examples/`:

- `corporate_finance_optimal_capital_structure_slides.typ`
- `corporate_finance_optimal_capital_structure_document.typ`
- Modules in `examples/modules/` demonstrate correct `content-block` usage

## Common Errors and Solutions

| Error | Cause | Solution |
| --- | --- | --- |
| "cannot add alignment and boolean" | Parameter named `center` shadows Typst's built-in `center` alignment | Use `centered` parameter instead |
| "pagebreaks are not allowed inside of containers" | `slide-break()` or `page-break()` inside `summary:` or `details:` | Move breaks outside content-blocks |
| "unexpected argument" on title-slide | Positional argument or wrong parameter name | Use named params: `title:`, `subtitle:`, `author:` |
| Text centered when it shouldn't be | `centered: true` (explicitly or as default) | Set `centered: false` |
| Text overlapping vertically | `centered: true` with `place()` absolute positioning | Set `centered: false` |
| Content overlapping on slides | Any content (concept-box, text, etc.) placed outside `content-block` | Move ALL content inside the `summary:` parameter |

## After a Submodule Bump

When the submodule is updated to a new commit, before relying on existing usage patterns:

1. **Skim the submodule log** (`git -C typst-dual-format log --oneline ORIG_HEAD..HEAD`) for breaking changes
2. **Check function signatures** in `dual_format.typ`, `presentation_functions.typ`, `document_functions.typ` if any function you use was touched
3. **Re-compile both slides and document** for affected sessions and visually verify output
