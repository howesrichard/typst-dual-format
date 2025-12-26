// Dual-format Content System for Typst
// Allows same content to be used for both presentations and long-form documents

// Output mode state with environment variable support
#let output-mode = state("output-mode", 
  if sys.inputs.at("mode", default: "document") == "presentation" {
    "presentation"
  } else {
    "document"
  }
)

// Set output mode
#let set-mode(mode) = {
  output-mode.update(mode)
}

// Conditional content functions
#let presentation-only(content) = context {
  if output-mode.get() == "presentation" { content }
}

#let document-only(content) = context {
  if output-mode.get() == "document" { content }
}

#let both-formats(presentation-content, document-content) = context {
  if output-mode.get() == "presentation" { presentation-content }
  else if output-mode.get() == "document" { document-content }
}

// Orange example box with transparency for highlighting examples
#let examples-box(content) = context {
  if output-mode.get() == "presentation" {
    place(horizon)[
      #rect(
        width: 100%,
        stroke: 2pt + rgb("#ea580c"), // Orange border
        fill: rgb("#fed7aa").transparentize(70%), // Light orange with 70% transparency
        radius: 6pt,
        inset: 1em
      )[
        #text(weight: "bold", fill: rgb("#ea580c"))[Examples:]
        #v(0.3em)
        #text(size: 1.2em)[#content]
      ]
    ]
    
    v(0.8em)
    } else {[
       #rect(
        width: 100%,
        stroke: 2pt + rgb("#ea580c"), // Orange border
        fill: rgb("#fed7aa").transparentize(70%), // Light orange with 70% transparency
        radius: 6pt,
        inset: 1em
      )[
        #text(weight: "bold", fill: rgb("#ea580c"))[Examples:]
        #v(0.3em)
        #content
      ]
    ]
  }

}

    // if title != none {
    //   pagebreak()
    //   [= #title]
    //   line(length: 100%, stroke: 2pt + rgb("#000000"))
    //   v(-0.5em)
    //   text(size:1em, weight: "light")[#subtext]
      

    //   if summary != none {
    //     if center {
    //       align(horizon, [
    //     #block(inset: (bottom: 3.5em))[
    //       #text(size: 0.8em)[#summary]
    //     ]
    //       ])
    //     } else {
    //       block(inset: (bottom: 3.5em))[
    //     #text(size: 0.8em)[#summary]
    //       ]
    //     }
    //   }

// Enhanced content blocks
#let content-block(
  title: none,
  subtext: "",
  summary: none,
  details: none,
  examples: none,
  center: true
) = context {
  if output-mode.get() == "presentation" {
    // Presentation format: title + summary only with optional vertical centering
    if title != none {
      pagebreak()
      [= #title]
      
      line(length: 100%, stroke: 1.5pt + rgb("#609ed6"))
      v(-0.5em)
      text(size:1.1em, weight: "light", fill: rgb("#666666"))[#subtext]
      v(1em)

      if summary != none {
        place(
          top + (if center { center } else { left }),
          dy: 65pt,  // 30pt from top of slide
          block(
            width: if center { auto } else { 100% },
            height: if center { 200pt } else { 470pt },
          )[
            #text(size: 1.2em)[#summary]
          ]
        )
      }
    } else if summary != none {
      pagebreak()
      if center {
        align(horizon, [
          #block(inset: (bottom: 2em))[#summary]
        ])
      } else {
        block(inset: (bottom: 2em))[#summary]
      }
    }

    if examples != none {
      pagebreak()
      if title != none [
        = #title (contd./Examples)
        #line(length: 100%, stroke: 1.5pt + rgb("#609ed6"))
        #v(-0.8em)
      ]
      examples-box(examples)
    }

  } else {
    // Document format: full content (unchanged)
    if title != none [
      == #title
      #if subtitle != none [
        #v(-0.2em)
        #text(size: 0.9em, weight: "light", style: "italic")[#subtitle]
      ]
      #v(0.3em)
    ]
    if summary != none { 
      rect(
        width: 100%,
        stroke: 2pt + rgb("#000000"), // Black border
        fill: rgb("#ededed").transparentize(70%), // Light gray with 70% transparency
        radius: 6pt,
        inset: 1em,
      )[
        #text(weight: "bold", fill: rgb("#000000"))[Summary Slide:]
        #block(height: 3.5in, breakable: false)[
          #text(size: 0.7em)[#summary]
      ] 
      ]
    }
    if details != none {
      v(0.5em)
      details
    }
    if examples != none {
      v(0.5em)
      examples-box(examples)
    }
  }
}

// Import presentation functions for slides
#import "presentation_functions.typ": slide, title-slide, section-slide, formula-slide, two-column-slide, highlight-slide, final-slide, two-by-two-grid, three-column-grid, two-column-grid, two-row-grid, three-row-grid

// Import and export document functions for study guides and prereading documents etc
#import "document_functions.typ": section-heading, formula-block, concept-box, example-box, examples-box, definition-box, figure-box, takeaways-box, two-column-content

// Unified section function that chooses appropriate format
#let section(title, subtitle: none) = context {
  if output-mode.get() == "presentation" {
    section-slide(title)
    if subtitle != none {
      align(left)[
        #text(size: 1.2em, weight: "light", fill: rgb("#000000"))[#subtitle]
      ]
    }
  } else {
    section-heading(title)
    if subtitle != none [
      #v(-0.3em)
      #text(size: 1.1em, weight: "light", style: "italic")[#subtitle]
      #v(0.5em)
    ]
  }
}

// Unified formula function that chooses appropriate format
#let formula(title: none, formula, explanation: none, notes: none) = context {
  if output-mode.get() == "presentation" {
    formula-slide(title: title, formula, explanation: explanation)
  } else {
    formula-block(title: title, formula, explanation: explanation, notes: notes)
  }
}

#let make-table(
  columns: (),            // e.g., (1fr, 1fr, 1fr, 1fr)
  header-fills: (),       // list of colors for each column header
  header-styles: (),      // array of (title, subtitle) tuples per column
  body-content: (),       // rows × columns array of content (lists, text, or markdown)
  // Optional parameters with defaults
  header-text-color: white,
  body-inset: (left: 12pt, top: 12pt, bottom: 12pt, right: 12pt),
  header-inset: (left: 8pt, top: 12pt, bottom: 12pt, right: 8pt),
  title-size: 1.1em,
  subtitle-size: 0.85em,
  default-header-fill: rgb("#666666"),  // fallback color
  row-height: auto,       // auto, 1fr, 50pt, or array like (auto, 1fr, 2fr, 50pt)
  border-color: gray,     // color of bottom border
  border-width: 0.5pt,    // width of bottom border
) = {

  let rows = body-content.len()
  let cols = columns.len()

  // Build grid parameters conditionally
  let grid-params = (
    columns: columns,
    column-gutter: 0pt,
    row-gutter: 0pt,
    stroke: (x, y) => (
      bottom: border-width + border-color,
      top: none,
      left: none,
      right: none,
    ),
    inset: 0pt,
    align: top + left,
  )

  // Handle row-height parameter
  if row-height != auto {
    if type(row-height) == array {
      // Use the provided array of heights (header + body rows)
      grid-params.insert("rows", row-height)
    } else {
      // Use uniform height for all rows (header + body)
      grid-params.insert("rows", (row-height,) * (rows + 1))
    }
  }

  grid(
    ..grid-params,

    // TOP HEADER ROW
    ..range(cols).map(c => 
      grid.cell(
        fill: if c < header-fills.len() { header-fills.at(c) } else { default-header-fill },
        inset: header-inset,
        text(header-text-color)[
          #stack(
            spacing: 0.15em,
            text(weight: "bold", size: title-size)[#header-styles.at(c).at(0)],
            text(style: "italic", size: subtitle-size)[#header-styles.at(c).at(1)],
          )
        ]
      )
    ),

    // BODY ROWS
    ..range(rows).map(r => 
      range(cols).map(c => {
        let content = body-content.at(r).at(c)
        grid.cell(
          inset: body-inset,
          content  // Just render the content as-is
        )
      })
    ).flatten()
  )
}

