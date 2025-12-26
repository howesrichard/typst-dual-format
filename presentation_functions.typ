// Reusable Presentation Template Functions for Typst
// No external dependencies - pure Typst
// Import this file to use these functions in any presentation


#let setup-presentation() = {
  // Empty for the moment while I figure out the best way to set up
}

// Define presentation colors
#let blue = rgb("#1f4e79")
#let green = rgb("#006d8f")
#let red = rgb("#c5504b")
#let gray = rgb("#595959")

// Simple slide function - creates new slides with optional titles
#let slide(title: none, body, center: true) = {
  pagebreak()

  if title != none {
    [= #title]
    v(0.5em)

    // Vertically center the body content if center is true
    if center {
      align(horizon, body)
    } else {
      body
    }
  } else {
    // If no title, center entire content if center is true
    if center {
      align(horizon, body)
    } else {
      body
    }
  }
}

// Title slide for beginning of presentation
#let title-slide(title:none, subtitle:none, author:none) = (

  grid(
    rows: (47%, 53%),
    columns: (100%),
    box(
      width: 100%,
      height: 100%,
      {
        image("finma_bg_1.png", width: 100%, height: 100%)
        
        // Overlay title on image
        place(
          left + bottom,
          dx: 5%,      // 5% from left edge
          dy: -8%,     // 5% from bottom of image section
          text(
            fill: rgb("#253356"),  // Dark blue text
            size: 3.5em,
            weight: "bold"
          )[#title]
        )
      }
    ),
    box( 
      width: 100%,
      height: 100%,
      fill: rgb("#253356"),
      inset: (left: 5%, right: 5%, top: 5%, bottom: 10%),
      stack(  
        dir: ttb,
        spacing: 1fr,  // This pushes items apart - first to top, last to bottom
        
        // Top text
        align(left, [
          #set text(fill: white, size: 3em, weight: "bold")
          #subtitle
        ]),
        
        // Bottom text
        align(left, [
          #set text(fill: white, size: 1em, weight: "bold")
          #author
        ])
      )
    )
  )
)

// Section divider slide
#let section-slide(title) = {
  pagebreak()
  align(left)[
    #v(10em)
    #line(length: 100%, stroke: 1.5pt + rgb("#609ed6"))
    #v(2em)
    #text(size: 1.5em, weight: "bold", fill: navy)[#title]
    #v(2em)

  ]

  // align(center + horizon)[
  //   #text(size: 56pt, weight: "bold", fill: blue)[#title]
  // ]
}

// Two-column slide layout
#let two-column-slide(title: none, left, right) = {
  
  if title != none [
    = #title
    #v(0.5em)
  ]
  
  grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    left,
    right
  )
}

// Slide with highlighted box
#let highlight-slide(title: none, content, highlight-text, color: blue) = {
  pagebreak()
  
  if title != none [
    = #title
    #v(0.5em)
  ]
  
  content
  
  v(1em)
  
  rect(
    fill: color.lighten(90%),
    stroke: 2pt + color,
    radius: 8pt,
    inset: 1em,
    width: 100%
  )[
    #text(weight: "bold")[#highlight-text]
  ]
}

// Formula slide with emphasis
#let formula-slide(title: none, formula, explanation: none) = {
  pagebreak()
  
  if title != none [
    = #title
    #v(0.5em)
  ]
  
  align(center)[
    #rect(
      fill: blue.lighten(95%),
      stroke: 2pt + blue,
      radius: 8pt,
      inset: 1.5em
    )[
      #formula
    ]
  ]
  
  if explanation != none [
    #v(1em)
    #explanation
  ]
}

// Final/thank you slide
#let final-slide(title, subtitle: none, next-topic: none) = {
  pagebreak()
  
  align(center + horizon)[
    #rect(
      fill: blue,
      width: 80%,
      inset: 2em,
      radius: 12pt
    )[
      #text(fill: white, size: 32pt, weight: "bold")[#title]
      
      #if subtitle != none [
        #v(1em)
        #line(length: 100%, stroke: 2pt + white)
        #v(1em)
        #text(fill: white, size: 20pt)[#subtitle]
      ]
      
      #if next-topic != none [
        #v(1em)
        #text(fill: white, size: 16pt)[Next: #next-topic]
      ]
    ]
  ]
}

  // Two-by-two slide layout with footer space
#let two-by-two-grid(top-left, top-right, bottom-left, bottom-right) = {  
  grid(
      columns: (1fr, 1fr),
      rows: (1fr, 1fr),
      gutter: 0.5em,
      block(inset: 0em)[#top-left],
      block(inset: 0em)[#top-right],
      block(inset: 0em)[#bottom-left],
      block(inset: 0em)[#bottom-right],
      stroke: (dash: "dashed", paint: gray.lighten(80%)) // light colored dashed border
    )
    
}


// Three-column slide layout
#let three-column-grid(left, middle, right) = {
  grid(
    columns: (1fr, 1fr, 1fr),
    rows: (1fr),
    gutter: 0.5em,
    block(inset: 0em)[#left],
    block(inset: 0em)[#middle],
    block(inset: 0em)[#right],
    stroke: (dash: "dashed", paint: gray.lighten(80%)) // light colored dashed border
  )
}

// Two-column slide layout
#let two-column-grid(left, right, col-height:1) = {
  grid(
    columns: (1fr * col-height, 1fr),
    rows: (1fr),
    gutter: 0.5em,
    block(inset: 0em)[#left],
    block(inset: 0em)[#right],
    stroke: (dash: "dashed", paint: gray.lighten(80%)) // light colored dashed border
  )
}

#let two-row-grid(top, bottom, row-height: 1) = {
  grid(
    columns: (1fr),
    rows: (1fr * row-height, 1fr),
    gutter: 0.5em,
    block(inset: 0em)[#top],
    block(inset: 0em)[#bottom],
    stroke: (dash: "dashed", paint: gray.lighten(80%)) // light colored dashed border
  )
}

#let three-row-grid(top, middle, bottom) = {
  grid(
    columns: (1fr),
    rows: (1fr, 1fr, 1fr),
    gutter: 0.5em,
    block(inset: 0em)[#top],
    block(inset: 0em)[#middle],
    block(inset: 0em)[#bottom],
    stroke: (dash: "dashed", paint: gray.lighten(80%)) // light colored dashed border
  )
}