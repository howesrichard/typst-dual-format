// This file renders corporate_finance_optimal_capital_structure_content.typ in long-form document format
#import "../dual_format.typ": *

#set text(size: 12pt)
#set heading(numbering: "1.")
#set par(justify: true)
#set-mode("document")
#set-show-advanced(false)

// Single source of truth for title-page and running-header text
#let doc-title = "Corporate Finance - Optimal Capital Structure"
#let doc-date = "December 2025"

// Title page with logo
#set page(
  paper: "a4",
  margin: (top: 2in),
  header: [#align(right)[#image("../cropped_FINMA_logo.png", height: 0.3in)]#v(0.9in)],
  footer: none
)

#align(center)[
  #text(size: 18pt, weight: "bold")[#doc-title]
  #v(0.5em)
  #text(size: 14pt)[Financial Markets Academy]
  #v(0.5em)
  #text(size: 12pt)[#doc-date]
]


// Reset page settings for content pages
#set page(
  paper: "a4",
  margin: (top: 1in, right: 0.7in, bottom: 0.7in, left: 0.7in),
  header-ascent: 0.25in,
  footer: [#v(0.1in)#line(length: 100%)#v(-6pt)#align(center)[#text(size: 12pt)[#context counter(page).display("1")]]],
  header: [#grid(
    columns: (auto, 1fr, auto),
    align: (left + horizon, center + horizon, right + horizon),
    image("../cropped_FINMA_logo.png", height: 0.22in),
    text(size: 10pt)[#doc-title],
    text(size: 10pt)[#doc-date],
  )#v(-6pt)#line(length: 100%)#v(0.2in)]
)

#include "corporate_finance_optimal_capital_structure_content.typ"
