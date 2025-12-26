// Typst Dual-Format System User Manual
// Documentation for the derivatives course content management system

#set page(paper: "a4", margin: 1in)
#set text(size: 11pt)
#set heading(numbering: "1.")
#set par(justify: true)

#align(center)[
  #text(size: 22pt, weight: "bold")[
    Typst Dual-Format System
  ]
  
  #v(0.5em)
  #text(size: 16pt)[
    User Manual & Technical Documentation
  ]
  
  #v(0.5em)
  #text(size: 12pt, style: "italic")[
    Derivatives Course Content Management System
  ]
]

#v(2em)

#outline()

#pagebreak()

= Overview

The Typst Dual-Format System is a sophisticated content management architecture that enables you to write course content *once* and automatically render it in two different formats:

1. *Presentation slides* (16:9 format for lectures)
2. *Study guide documents* (A4 format for student reference)

This system eliminates content duplication, ensures consistency across materials, and dramatically reduces maintenance overhead when updating course content.

== Key Benefits

- *Write Once, Render Twice:* Single source content automatically formats for both presentations and documents
- *Intelligent Conditional Rendering:* Content adapts based on output format (slides vs. documents)
- *Advanced Content Filtering:* Control visibility of complex content for different audience levels
- *Consistent Styling:* Unified visual language across all course materials
- *Maintainability:* Updates propagate automatically to both formats

= System Architecture

== File Structure Overview

The system consists of three core utility files and a dual-driver approach:

```
utility/
├── dual_format.typ           # Core logic and mode switching
├── document_functions.typ    # Document-specific functions
└── presentation_functions.typ # Presentation-specific functions

Week_X_Topic/
├── Week_X_Topic_content.typ   # Single source content file
├── Week_X_Topic_document.typ  # Document driver (imports content)
└── Week_X_Topic_slides.typ    # Presentation driver (imports content)
```

== Visual System Diagram

#align(center)[
  #box(
    width: 100%,
    stroke: 2pt + rgb("#2563eb"),
    radius: 8pt,
    inset: 1.2em
  )[
    #set text(size: 9.5pt)
    #grid(
      columns: (1fr, auto, 1.2fr, auto, 0.8fr),
      gutter: 0.5em,
      
      // Column 1: Utility Files
      align(center)[
        #rect(
          width: 100%,
          fill: rgb("#dbeafe"),
          stroke: 1pt + rgb("#3b82f6"),
          radius: 4pt,
          inset: 0.8em
        )[
          *UTILITY FILES*
        ]
        
        #v(0.5em)
        
        // dual_format at the top
        #rect(
          width: 100%,
          fill: rgb("#dbeafe"),
          stroke: 2pt + rgb("#3b82f6"),
          radius: 4pt,
          inset: 0.6em
        )[
          #text(size: 9pt, weight: "bold")[
            `dual_format.typ`
          ]
          
          #v(0.2em)
          #align(left)[
            #text(size: 7.5pt)[
              • Mode switching\
              • Conditional content\
              • Content filtering\
              • *Imports both functions*
            ]
          ]
        ]
        
        #v(0.3em)
        
        // Upward arrows
        #grid(
          columns: (1fr, 1fr),
          column-gutter: 2em,
          align(center)[#text(size: 16pt)[↑]],
          align(center)[#text(size: 16pt)[↑]]
        )
        
        #v(0.3em)
        
        // document_functions and presentation_functions side by side
        #grid(
          columns: (1fr, 1fr),
          column-gutter: 0.3em,
          
          rect(
            width: 100%,
            fill: rgb("#eff6ff"),
            stroke: 1pt + rgb("#93c5fd"),
            radius: 4pt,
            inset: 0.6em
          )[
            #text(size: 8pt)[
              `document_`\
              `functions.typ`
            ]
            
            #v(0.2em)
            #align(left)[
              #text(size: 6pt)[
                • Formula blocks\
                • Concept boxes\
                • Examples boxes
              ]
            ]
          ],
          
          rect(
            width: 100%,
            fill: rgb("#eff6ff"),
            stroke: 1pt + rgb("#93c5fd"),
            radius: 4pt,
            inset: 0.6em
          )[
            #text(size: 8pt)[
              `presentation_`\
              `functions.typ`
            ]
            
            #v(0.2em)
            #align(left)[
              #text(size: 6pt)[
                • Slides\
                • Title slides\
                • Formula slides
              ]
            ]
          ]
        )
      ],
      
      // Arrow column between utility and content
      align(center)[
        // Match vertical spacing of utility files column
        #v(1.3em) // Match header height
        #v(0.5em) // Match spacing
        
        #v(4.3em) // Position arrow at dual_format level
        #text(size: 20pt)[→]
      ],
      
      // Column 2: Content & Drivers
      align(center)[
        #rect(
          width: 100%,
          fill: rgb("#dcfce7"),
          stroke: 1pt + rgb("#22c55e"),
          radius: 4pt,
          inset: 0.8em
        )[
          *CONTENT & DRIVERS*
        ]
        
        #v(0.5em)
        
        #rect(
          width: 100%,
          fill: rgb("#f0fdf4"),
          stroke: 1pt + rgb("#86efac"),
          radius: 4pt,
          inset: 0.6em
        )[
          `Week_X_content.typ`
          
          #v(0.2em)
          #align(left)[
            #text(size: 8pt)[
              • Single source\
              • Format-agnostic\
              • Imports dual_format
            ]
          ]
        ]
        
        #v(1em)
        
        #grid(
          columns: (1fr, 1fr),
          column-gutter: 2em,
          align(center)[#text(size: 20pt)[↓]],
          align(center)[#text(size: 20pt)[↓]]
        )
        
        #v(0.5em)
        
        #grid(
          columns: (1fr, 1fr),
          column-gutter: 0.4em,
          row-gutter: 0.8em,
          
          // Document driver in top-left
          rect(
            width: 100%,
            fill: rgb("#fef3c7"),
            stroke: 1pt + rgb("#fbbf24"),
            radius: 4pt,
            inset: 0.5em
          )[
            #text(size: 8.5pt)[
              *Document\
              Driver*
              
              #v(0.2em)
              `_document.typ`
              
              #v(0.2em)
              #align(left)[
                #text(size: 6pt)[
                  • A4 format\
                  • Sets doc mode\
                  • Includes content
                ]
              ]
            ]
          ],
          
          // Empty cell in top-right for vertical spacing
          [],
          
          // Empty cell in bottom-left
          [],
          
          // Slides driver in bottom-right
          rect(
            width: 100%,
            fill: rgb("#fce7f3"),
            stroke: 1pt + rgb("#f472b6"),
            radius: 4pt,
            inset: 0.5em
          )[
            #text(size: 8.5pt)[
              *Slides Driver*
              
              #v(0.2em)
              `_slides.typ`
              
              #v(0.2em)
              #align(left)[
                #text(size: 6pt)[
                  • 16:9 format\
                  • Sets pres mode\
                  • Includes content
                ]
              ]
            ]
          ]
        )
      ],
      
      // Arrow column between drivers and outputs
      align(center)[
        // Arrow for document driver to study guide
        #v(18em)
        #text(size: 20pt)[→]
        
        // Spacing between arrows
        #v(4em)
        
        // Arrow for slides driver to presentation PDF
        #text(size: 20pt)[→]
      ],
      
      // Column 3: Outputs
      align(center)[
        #rect(
          width: 100%,
          fill: rgb("#fef2f2"),
          stroke: 1pt + rgb("#ef4444"),
          radius: 4pt,
          inset: 0.8em
        )[
          *OUTPUT*
        ]
        
        #v(.5em)
        
        // Spacing to align with Week_X_content box
        #v(3em)
        
        // Spacing to align with down arrows
        #v(8.5em)
        
        #rect(
          width: 100%,
          fill: rgb("#fef3c7"),
          stroke: 1pt + rgb("#fbbf24"),
          radius: 4pt,
          inset: 0.6em
        )[
          *Study Guide PDF*
          
          #v(0.2em)
          #align(left)[
            #text(size: 6pt)[
              • Detailed content\
              • Numbered sections\
              • Examples & notes\
              • Full explanations
            ]
          ]
        ]
        
        #v(.1em)
        
        #rect(
          width: 100%,
          fill: rgb("#fce7f3"),
          stroke: 1pt + rgb("#f472b6"),
          radius: 4pt,
          inset: 0.6em
        )[
          *Presentation PDF*
          
          #v(0.2em)
          #align(left)[
            #text(size: 6pt)[
              • Summary points\
              • One slide per topic\
              • Visual focus\
              • Concise content
            ]
          ]
        ]
      ]
    )
    
    #v(1em)
    
    // Bottom arrow showing data flow
    #align(center)[
      #text(size: 9pt, weight: "bold")[
        Content flows through dual_format logic → Drivers set mode → Functions render appropriately
      ]
    ]
  ]
]

#pagebreak()

= Core Components

== dual_format.typ

This is the heart of the system, providing mode switching, conditional rendering, and content filtering capabilities.

=== Key Functions

==== Mode Management

```typst
#set-mode("document")      // Set document mode
#set-mode("presentation")  // Set presentation mode
```

The mode is automatically set by driver files but can be overridden if needed. Mode is stored in a state variable that persists throughout compilation.

==== Conditional Content

```typst
// Show only in presentations
#presentation-only[
  This content appears only in slide decks
]

// Show only in documents
#document-only[
  This detailed explanation appears only in study guides
]

// Different content for each format
#both-formats(
  [Slide version: bullet points],
  [Document version: full paragraph explanation]
)
```

==== Advanced Content Filtering

```typst
#set-show-advanced(true)   // Show all content (default)
#set-show-advanced(false)  // Hide advanced content

// Wrap complex content
#advanced-content[
  #formula(
    title: "Black-Scholes-Merton Model",
    $ C = S_0 N(d_1) - K e^(-r T) N(d_2) $
  )
]

// Core content (always visible)
#core-content[
  Options give the right to buy or sell an asset.
]
```

This allows you to create two-tier content: core teaching materials for introductory students and advanced materials for self-study or reference.

==== Content Blocks

```typst
#content-block(
  title: "What are Derivatives?",
  summary: [
    - Brief bullet points
    - Key concepts only
    - Presented on slides
  ],
  details: [
    Full paragraphs explaining concepts in depth.
    This content only appears in documents.
  ],
  examples: [
    Worked examples and case studies.
    Also document-only content.
  ],
  center: true  // Vertically center slide content
)
```

The `content-block` is the most powerful function for dual-format content. In presentation mode, it shows only the title and summary (optionally centered). In document mode, it renders all components sequentially.

==== Unified Functions

```typst
// Section divider - adapts to format
#section("Risk Management")

// Formula display - adapts to format
#formula(
  title: "Put-Call Parity",
  $ C - P = S_0 - K e^(-r T) $,
  explanation: [
    This relationship must hold to prevent arbitrage...
  ],
  notes: [Document-only additional notes]
)
```

These functions automatically call the appropriate format-specific function based on the current mode.

#pagebreak()

== document_functions.typ

Provides specialized formatting functions for study guide documents.

=== Available Functions

==== section-heading(title)

Creates a formatted section heading with decorative underline:

```typst
#section-heading("Options Fundamentals")
// Renders: bold title with blue underline
```

==== formula-block(title, formula, explanation, notes)

Displays mathematical formulas in bordered, highlighted boxes:

```typst
#formula-block(
  title: "European Call Option",
  $ C = S_0 N(d_1) - K e^(-r T) N(d_2) $,
  explanation: [
    Where $N(·)$ is the cumulative normal distribution...
  ],
  notes: [
    Assumes constant volatility and no dividends
  ]
)
```

*Renders as:* Gray-bordered box with centered formula, followed by explanation and italicized notes.

==== concept-box(title, content, type)

Highlight key concepts with colored boxes. Type options: `"info"` (blue), `"warning"` (orange), `"success"` (green), `"note"` (gray).

```typst
#concept-box(
  title: "Key Insight",
  [Options provide asymmetric payoff profiles],
  type: "info"
)
```

==== example-box(title, content)

Green-bordered box for worked examples:

```typst
#example-box(
  title: "Example: Call Option Payoff",
  [
    Stock price: \$50\
    Strike price: \$45\
    Premium: \$7\
    
    Profit = max(S - K, 0) - Premium = \$5 - \$7 = *-\$2 loss*
  ]
)
```

==== examples-box(content)

Orange-bordered box with transparent background for multiple examples:

```typst
#examples-box[
  - *Hedging:* Airline buys oil futures to lock in fuel costs
  - *Speculation:* Trader buys call options on tech stock
  - *Arbitrage:* Exploiting put-call parity violations
]
```

==== definition-box(term, definition)

Gray box for formal definitions:

```typst
#definition-box(
  "Derivative",
  [
    A financial instrument whose value derives from 
    an underlying asset, index, or rate.
  ]
)
```

==== figure-box(image, caption, width)

Properly formatted figures with captions:

```typst
#figure-box(
  image("payoff_diagram.png"),
  caption: "Call option payoff diagram",
  width: 70%
)
```

==== takeaways-box(content)

Blue information box for section summaries:

```typst
#takeaways-box[
  - Derivatives transfer risk between market participants
  - Options limit downside while preserving upside potential
  - Futures markets provide price discovery function
]
```

==== two-column-content(left, right)

Split content into two columns for documents:

```typst
#two-column-content(
  [Left column content...],
  [Right column content...]
)
```

#pagebreak()

== presentation_functions.typ

Provides slide creation and formatting functions for presentations.

=== Available Functions

==== slide(title, body, center)

Creates a basic slide with optional title and vertical centering:

```typst
#slide(
  title: "Options Strategies",
  [
    - Covered calls
    - Protective puts
    - Straddles and strangles
  ],
  center: true
)
```

==== title-slide(title, subtitle, author, date)

Opening slide for presentations:

```typst
#title-slide(
  "Week 5: Commodity Derivatives",
  subtitle: "Energy, Metals, and Agricultural Markets",
  author: "Derivatives Course - FMA",
  date: "March 2024"
)
```

==== section-slide(title)

Full-slide section divider with large centered text:

```typst
#section-slide("Risk Management")
// Creates pagebreak with large centered title
```

==== formula-slide(title, formula, explanation)

Displays mathematical formulas in blue highlighted boxes:

```typst
#formula-slide(
  title: "Black-Scholes Formula",
  $ C = S_0 N(d_1) - K e^(-r T) N(d_2) $,
  explanation: [Brief explanation for slide]
)
```

==== two-column-slide(title, left, right)

Split slide into two columns:

```typst
#two-column-slide(
  title: "Comparison",
  [*Futures:*
   - Exchange traded
   - Standardized],
  [*Forwards:*
   - OTC traded
   - Customizable]
)
```

==== highlight-slide(title, content, highlight-text, color)

Creates emphasized content box at bottom of slide:

```typst
#highlight-slide(
  title: "Key Risk",
  [Standard content on slide...],
  [COUNTERPARTY RISK IS CRITICAL],
  color: red
)
```

==== final-slide(title, subtitle, next-topic)

Closing slide with styled box:

```typst
#final-slide(
  "Thank You",
  subtitle: "Questions?",
  next-topic: "Week 6: Index Derivatives"
)
```

==== Predefined Colors

```typst
blue  = rgb("#1f4e79")
green = rgb("#70ad47")
red   = rgb("#c5504b")
gray  = rgb("#595959")
```

Use these for consistent color scheme: `#text(fill: blue)[...]`

#pagebreak()

= Creating Course Content

== Step-by-Step Workflow

=== 1. Create Content File

Create `Week_X_Topic_content.typ` that imports dual_format:

```typst
// Week 5 Commodity Derivatives - Course Content
#import "../utility/dual_format.typ": *
#import "../utility/document_functions.typ": *

// Optional: Document-only table of contents
#document-only[
  #pagebreak()
  #outline()
]

// Section divider
#section("Introduction to Commodities")

// Main content using content blocks
#content-block(
  title: "What are Commodity Derivatives?",
  summary: [
    - Financial contracts based on physical goods
    - Energy: Oil, natural gas, electricity
    - Metals: Gold, silver, copper
    - Agriculture: Wheat, corn, soybeans
  ],
  details: [
    Commodity derivatives are financial instruments that derive
    their value from physical commodities. Unlike equity or fixed
    income derivatives, these instruments are ultimately tied to
    tangible goods that can be stored, transported, and delivered.
    
    The commodity markets serve crucial functions beyond speculation,
    including price discovery, risk management for producers and
    consumers, and efficient allocation of resources across time.
  ],
  examples: [
    #examples-box[
      - *Oil producer* hedges price risk by selling crude futures
      - *Airline* locks in fuel costs with jet fuel forwards
      - *Gold miner* uses options to establish price floor
    ]
  ]
)

// More content blocks...
```

=== 2. Create Document Driver

Create `Week_X_Topic_document.typ`:

```typst
// Week 5 Commodity Derivatives - Document Driver
#import "../utility/dual_format.typ": *

// Configure document format
#set page(
  paper: "a4",
  margin: 1in,
  footer: [
    #align(right)[
      #text(size: 12pt, fill: rgb("#2c3e50"))[
        #context counter(page).display("1")
      ]
    ]
  ]
)
#set text(size: 12pt)
#set heading(numbering: "1.")
#set par(justify: true)

// Set document mode
#set-mode("document")

// Document title
#align(center)[
  #text(size: 18pt, weight: "bold")[
    Week 5: Commodity Derivatives Study Guide
  ]
  #v(0.5em)
  #text(size: 14pt)[
    Energy, Metals, and Agricultural Markets
  ]
]

#v(2em)

// Include content
#include "Week_5_Commodity_Derivatives_content.typ"
```

=== 3. Create Presentation Driver

Create `Week_X_Topic_slides.typ`:

```typst
// Week 5 Commodity Derivatives - Presentation Driver
#import "../utility/dual_format.typ": *

// Configure presentation format
#set page(
  width: 16in,
  height: 9in,
  margin: (x: 0.5in, y: 0.5in),
  footer: [
    #align(right)[
      #text(size: 18pt, fill: rgb("#2c3e50"))[
        #context counter(page).display("1")
      ]
    ]
  ]
)
#set text(size: 24pt)
#set heading(numbering: none)

// Set presentation mode
#set-mode("presentation")

// Title slide
#title-slide(
  "Week 5: Commodity Derivatives",
  subtitle: "Energy, Metals, and Agricultural Markets",
  author: "Derivatives Course - FMA"
)

// Include content
#include "Week_5_Commodity_Derivatives_content.typ"
```

=== 4. Compile Both Formats

Compile the document:
```bash
typst compile Week_5_Commodity_Derivatives_document.typ
```

Compile the presentation:
```bash
typst compile Week_5_Commodity_Derivatives_slides.typ
```

#pagebreak()

= Best Practices

== Content Organization

=== Use Content Blocks Effectively

*Good:*
```typst
#content-block(
  title: "Forward Contracts",
  summary: [
    - Customized OTC agreements
    - Fixed future delivery
    - Counterparty risk
  ],
  details: [
    Forward contracts are bilateral agreements traded over-the-counter...
    (detailed explanation)
  ]
)
```

*Avoid:*
```typst
// Don't write separate content for each format
#presentation-only[Forward Contracts]
#document-only[= Forward Contracts]
// This defeats the purpose of the system!
```

=== Leverage Conditional Content Sparingly

Use `presentation-only` and `document-only` for genuinely different content, not just formatting:

```typst
// Good use case: different depth of explanation
#content-block(
  title: "Greeks",
  summary: [
    - Delta: sensitivity to underlying price
    - Gamma: rate of Delta change
    - Vega: sensitivity to volatility
  ],
  details: [
    #document-only[
      Each Greek measures a specific dimension of option sensitivity.
      Understanding these measures is crucial for risk management...
      
      #formula-block(
        title: "Delta Definition",
        $ Delta = (partial C)/(partial S) $
      )
    ]
  ]
)
```

=== Structure Large Content Files

For complex weeks, consider organizing content into logical sections:

```typst
#import "../utility/dual_format.typ": *
#import "../utility/document_functions.typ": *

// Part 1: Introduction
#section("Introduction")
#content-block(...)

// Part 2: Core Concepts
#section("Core Concepts")
#content-block(...)

// Part 3: Advanced Topics
#section("Advanced Topics")
#advanced-content[
  #content-block(...)
]

// Part 4: Summary
#section("Summary")
#takeaways-box[...]
```

== Styling Consistency

=== Use Predefined Boxes

Always use the appropriate box type for content:

- `concept-box` for theoretical explanations
- `example-box` for single worked examples
- `examples-box` for multiple brief examples
- `definition-box` for formal definitions
- `formula-block` for mathematical formulas
- `takeaways-box` for section summaries

=== Maintain Visual Hierarchy

```typst
// Main topic
#section("Options Fundamentals")

// Subtopic
#content-block(title: "Call Options", ...)

// Sub-subtopic (in details)
details: [
  === Intrinsic Value
  The intrinsic value is...
  
  === Time Value
  The time value represents...
]
```

== Advanced Content Management

=== Two-Tier Content Strategy

Create core and advanced versions by controlling visibility:

```typst
// Core teaching file (set in driver)
#set-show-advanced(false)

// Content file can include both tiers
#core-content[
  #content-block(
    title: "Basic Option Concepts",
    summary: [Essential concepts everyone needs]
  )
]

#advanced-content[
  #content-block(
    title: "Stochastic Volatility Models",
    summary: [Advanced topic for reference]
  )
]
```

Compile two versions:
```bash
# Core teaching materials
typst compile --input advanced=false Week_X_content.typ

# Complete reference materials
typst compile --input advanced=true Week_X_content.typ
```

=== Mode Override

If you need to temporarily override mode (rare cases):

```typst
#set-mode("presentation")
// Content here renders as presentation regardless of driver

#set-mode("document")
// Content here renders as document regardless of driver
```

⚠️ *Warning:* Mode overrides break the dual-format paradigm. Use only when absolutely necessary.

#pagebreak()

= Troubleshooting

== Common Issues

=== Content Not Appearing in One Format

*Problem:* Content shows in document but not presentation (or vice versa).

*Solution:* Check if content is accidentally wrapped in `#document-only` or `#presentation-only`. For most content, use `#content-block` instead.

=== Formulas Render Incorrectly

*Problem:* Mathematical expressions don't display properly.

*Solution:* 
- Ensure formulas are wrapped in `$ $` for inline math or `$ ... $` for display math
- Use `#formula` unified function rather than format-specific variants
- Check that special characters are properly escaped

=== Import Errors

*Problem:* `error: package not found: dual_format`

*Solution:*
- Verify the relative import path is correct: `#import "../utility/dual_format.typ": *`
- Check that the utility folder exists in the expected location
- Ensure file names match exactly (case-sensitive)

=== Pagebreaks in Wrong Places

*Problem:* Content splits awkwardly in document mode.

*Solution:*
- Use `block(breakable: false)` for content that should stay together
- Most built-in boxes already have this setting
- For presentations, each `#content-block` creates a new slide automatically

=== State Not Updating

*Problem:* Mode changes don't take effect.

*Solution:*
- State updates require `context` blocks to read
- All built-in functions already use `context`
- If creating custom conditional functions, wrap in `context { ... }`

== Debug Mode

To check which mode is active, temporarily add:

```typst
#context [
  Current mode: #output-mode.get() \
  Show advanced: #show-advanced.get()
]
```

This displays the current state values in the output.

#pagebreak()

= Advanced Techniques

== Custom Conditional Functions

Create your own format-aware functions:

```typst
#let my-custom-block(content) = context {
  if output-mode.get() == "presentation" {
    // Presentation version
    rect(fill: blue.lighten(90%), inset: 1em)[
      #content
    ]
  } else {
    // Document version
    block(
      fill: gray.lighten(95%),
      inset: 1em,
      width: 100%
    )[
      #content
    ]
  }
}
```

== Parameterized Content

Use Typst's native parameters for flexible content:

```typst
#let market-example(
  market,
  instrument,
  use-case
) = content-block(
  title: [#market Market Example],
  summary: [
    *Instrument:* #instrument \
    *Use Case:* #use-case
  ],
  details: [
    In the #market market, #instrument are commonly
    used for #use-case...
  ]
)

// Usage
#market-example(
  "equity",
  "call options",
  "directional speculation"
)
```

== Including External Content

Reference diagrams or data that exist as separate files:

```typst
// In content file
#document-only[
  #figure-box(
    image("diagrams/payoff_diagram.svg"),
    caption: "Long call payoff structure"
  )
]

#presentation-only[
  #align(center)[
    #image("diagrams/payoff_diagram.svg", width: 70%)
  ]
]
```

== Interactive Elements (Presentation)

For HTML presentations (using tools like Polylux), extend functions:

```typst
// Example: Progressive reveal
#let reveal-list(items) = {
  for (i, item) in items.enumerate() [
    #only(i + 1)[- #item]
  ]
}
```

Note: The current system targets PDF output, so interactive features require additional libraries.

#pagebreak()

= System Maintenance

== Updating Utility Files

When modifying utility files:

1. *Test thoroughly* - Changes affect all course materials
2. *Maintain backwards compatibility* - Existing content files should continue to work
3. *Document changes* - Update this manual
4. *Version control* - Commit utility changes separately from content

== Adding New Functions

To add a new document function:

```typst
// In document_functions.typ
#let my-new-function(args) = {
  // Implementation for documents
}
```

To add a new presentation function:

```typst
// In presentation_functions.typ
#let my-new-function(args) = {
  // Implementation for presentations
}
```

To create a unified function:

```typst
// In dual_format.typ
#import "document_functions.typ": my-new-function as my-new-function-doc
#import "presentation_functions.typ": my-new-function as my-new-function-pres

#let my-new-function(args) = context {
  if output-mode.get() == "presentation" {
    my-new-function-pres(args)
  } else {
    my-new-function-doc(args)
  }
}
```

== Quality Assurance

Before finalizing content:

- [ ] Compile document version successfully
- [ ] Compile presentation version successfully
- [ ] Verify all formulas render correctly in both formats
- [ ] Check that images load properly
- [ ] Review page breaks and slide transitions
- [ ] Ensure consistent terminology across content
- [ ] Test with `advanced=false` if using advanced content filtering

#pagebreak()

= Appendix: Quick Reference

== Essential Imports

```typst
#import "../utility/dual_format.typ": *
#import "../utility/document_functions.typ": *
```

== Most Common Functions

```typst
// Section dividers
#section("Topic Name")

// Main content
#content-block(
  title: "Subtitle",
  summary: [Bullet points for slides],
  details: [Full explanation for documents],
  examples: [Optional examples]
)

// Formulas
#formula(
  title: "Formula Name",
  $ math expression $,
  explanation: [What it means]
)

// Examples
#examples-box[
  - Example 1
  - Example 2
]

// Definitions
#definition-box(
  "Term",
  [Definition text]
)

// Key insights
#concept-box(
  title: "Key Point",
  [Explanation],
  type: "info"
)
```

== Driver Template (Document)

```typst
#import "../utility/dual_format.typ": *

#set page(paper: "a4", margin: 1in)
#set text(size: 12pt)
#set heading(numbering: "1.")
#set par(justify: true)
#set-mode("document")

#align(center)[
  #text(size: 18pt, weight: "bold")[Title]
  #v(0.5em)
  #text(size: 14pt)[Subtitle]
]

#v(2em)
#include "content_file.typ"
```

== Driver Template (Presentation)

```typst
#import "../utility/dual_format.typ": *

#set page(width: 16in, height: 9in, margin: 0.5in)
#set text(size: 24pt)
#set heading(numbering: none)
#set-mode("presentation")

#title-slide(
  "Title",
  subtitle: "Subtitle",
  author: "Author"
)

#include "content_file.typ"
```

== Compilation Commands

```bash
# Compile document
typst compile Week_X_document.typ

# Compile presentation  
typst compile Week_X_slides.typ

# With advanced content filtered
typst compile --input advanced=false Week_X_document.typ

# Watch mode (auto-recompile on changes)
typst watch Week_X_document.typ
```

---

#align(center)[
  #text(size: 14pt, style: "italic")[
    For questions or suggestions about this system,\
    contact the course development team.
  ]
  
  #v(1em)
  
  #text(size: 10pt, fill: gray)[
    Last updated: December 2024\
    Version 1.0
  ]
]
