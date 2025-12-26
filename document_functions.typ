// Document Functions for Typst
// Functions designed specifically for document/study guide formatting

// Document section heading - equivalent to section-slide for presentations
#let section-heading(title) = {
  pagebreak(weak: true)
  v(0.5em)
  [
    = #title
    #v(0.5em)
    #line(length: 100%, stroke: 2pt + rgb("#2563eb"))
    #v(0.2em)
  ]
}

// Formula block for documents - equivalent to formula-slide
#let formula-block(
  title: none,
  formula,
  explanation: none,
  notes: none
) = {
  if title != none [
    === #title
    #v(0.3em)
  ]
  
  // Centered formula in a bordered box
  rect(
    width: 100%,
    stroke: 1pt + rgb("#e5e7eb"),
    fill: rgb("#f8fafc"),
    radius: 8pt,
    inset: 1em
  )[
    #align(center)[
      #text(size: 14pt)[#formula]
    ]
  ]
  
  if explanation != none [
    #v(0.5em)
    #explanation
  ]
  
  if notes != none [
    #v(0.5em)
    #text(style: "italic", fill: rgb("#6b7280"))[
      *Note:* #notes
    ]
  ]
  
  v(1em)
}

// Text box for highlighting key concepts
#let concept-box(
  title: none,
  content,
  type: "info" // "info", "warning", "success", "note"
) = {
  let colors = (
    info: (border: rgb("#3b82f6"), bg: rgb("#eff6ff")),
    warning: (border: rgb("#f59e0b"), bg: rgb("#fffbeb")),
    success: (border: rgb("#10b981"), bg: rgb("#ecfdf5")),
    note: (border: rgb("#6b7280"), bg: rgb("#f9fafb"))
  )

  let color-scheme = colors.at(type, default: colors.info)

  block(breakable: false)[
    #rect(
      width: 100%,
      stroke: 2pt + color-scheme.border,
      fill: color-scheme.bg,
      radius: 6pt,
      inset: 1em
    )[
      #if title != none [
        #text(weight: "bold", fill: color-scheme.border)[#title]
        #v(0.3em)
      ]
      #content
    ]
  ]

  v(0.8em)
}

// Example box for worked examples
#let example-box(
  title: "Example",
  content
) = {
  concept-box(
    title: title,
    content,
    type: "success"
  )
}

// Definition box for key terms
#let definition-box(
  term,
  definition
) = {
  concept-box(
    title: [*Definition:* #term],
    definition,
    type: "note"
  )
}

// Image figure with caption and proper spacing
#let figure-box(
  image,
  caption: none,
  width: 80%
) = {
  v(1em)
  align(center)[
    #box(width: width)[#image]
    #if caption != none [
      #v(0.3em)
      #text(size: 10pt, style: "italic")[#caption]
    ]
  ]
  v(1em)
}

// Key takeaways box for document summaries
#let takeaways-box(content) = {
  concept-box(
    title: "Key Takeaways",
    content,
    type: "info"
  )
}

// Multi-column layout for document content
#let two-column-content(left, right) = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    left, right
  )
}

// Orange example box with transparency for highlighting examples
#let examples-box(content) = {
  block(breakable: false)[
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

  v(0.8em)
}