// This file renders corporate_finance_optimal_capital_structure_content.typ in long-form document format
#import "../dual_format.typ": *

#set text(size: 12pt)
#set heading(numbering: "1.")
#set par(justify: true)
#set-mode("document")

// Title page with logo
#set page(
  paper: "a4",
  margin: (top: 2in),
  header: [#align(right)[#image("../cropped_FINMA_logo.png", height: 0.3in)]#v(0.9in)],
  footer: none
)

#align(center)[
  #text(size: 18pt, weight: "bold")[Corporate Finance - Optimal Capital Structure]
  #v(0.5em)
  #text(size: 14pt)[Financial Markets Academy]
  #v(0.5em)
  #text(size: 12pt)[December 2025]
]


// Reset page settings for content pages
#set page(
  paper: "a4",
  margin: (top: 0.7in, right: 0.7in, bottom: 0.7in, left: 0.7in),
  footer: [#v(0.1in)#line(length: 100%)#v(-6pt)#align(center)[#text(size: 12pt)[#context counter(page).display("1")]]],
  header: [#text(size: 12pt)[#grid(columns: 3, gutter: 1fr, [fill in here], [fill in here], [fill in here])]#v(-12pt)#line(length: 100%)#v(0.2in)]
)

#include "corporate_finance_optimal_capital_structure_content.typ"
