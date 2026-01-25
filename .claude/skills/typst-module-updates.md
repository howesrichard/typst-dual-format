# Typst Dual-Format Module Update Skill

This skill guides updates to content repositories that use the `typst-dual-format` submodule for generating both presentation slides and long-form documents from shared content.

## Repository Structure

### Submodule Files (typst-dual-format/)
- `dual_format.typ` - Main entry point, imports and re-exports presentation and document functions
- `presentation_functions.typ` - Slide-specific functions (`title-slide`, `slide-break`, etc.)
- `document_functions.typ` - Document-specific functions (`page-break`, etc.)

### Content Repository Structure
```
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

## Migration Checklist

When updating content files to use the submodule (or when submodule is updated):

### 1. Update Import Paths

**Driver files** (in `Topic_N/`):
```typst
// OLD:
#import "../dual_format.typ": *

// NEW:
#import "../typst-dual-format/dual_format.typ": *
```

**Content files** (in `Topic_N/Topic_N_Content/` or `Topic_N/Topic_N_QA/`):
```typst
// OLD:
#import "../../dual_format.typ": *

// NEW:
#import "../../typst-dual-format/dual_format.typ": *
```

### 2. Function Signature Compatibility

#### `title-slide` function
The submodule version requires **named parameters only**:

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

#### `content-block` function
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

### 3. Container Restrictions

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

### 4. Elements Outside Content-Blocks (Overlapping Issue)

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

### 5. Verification Steps

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

### 6. Reference Examples

Working examples in `typst-dual-format/examples/`:
- `corporate_finance_optimal_capital_structure_slides.typ`
- `corporate_finance_optimal_capital_structure_document.typ`
- Modules in `examples/modules/` demonstrate correct `content-block` usage

## Common Errors and Solutions

| Error | Cause | Solution |
|-------|-------|----------|
| "cannot add alignment and boolean" | Parameter named `center` shadows Typst's built-in `center` alignment | Use `centered` parameter instead |
| "pagebreaks are not allowed inside of containers" | `slide-break()` or `page-break()` inside `summary:` or `details:` | Move breaks outside content-blocks |
| "unexpected argument" on title-slide | Positional argument or wrong parameter name | Use named params: `title:`, `subtitle:`, `author:` |
| Text centered when it shouldn't be | `centered: true` (explicitly or as default) | Set `centered: false` |
| Text overlapping vertically | `centered: true` with `place()` absolute positioning | Set `centered: false` |
| Content overlapping on slides | Any content (concept-box, text, etc.) placed outside `content-block` | Move ALL content inside the `summary:` parameter |

## Updating Multiple Topics

When migrating multiple Topic folders:

1. **Identify all files needing updates:**
   ```bash
   grep -r "import.*dual_format" Topic_*/
   ```

2. **Update systematically:**
   - Driver files first (`*_slides.typ`, `*_document.typ`)
   - Then content files (`Topic_N_Content/*.typ`)
   - Then QA files if present (`Topic_N_QA/*.typ`)

3. **Test each topic before moving to next:**
   - Compile both slides and document
   - Visually verify output

## Submodule Version Changes

When the submodule is updated with new features or breaking changes:

1. **Check the submodule changelog/commits** for breaking changes
2. **Review function signatures** in `dual_format.typ`, `presentation_functions.typ`, `document_functions.typ`
3. **Compare with example files** to see correct usage patterns
4. **Update content files** as needed
5. **Re-verify compilation** of all affected Topic folders
