// API Showcase — presentation driver.
// Renders api_showcase_content.typ in presentation mode.
#import "../dual_format.typ": *

#set page(width: 29.7cm, height: 20.999cm, margin: 0in, flipped: false,
  footer: [#align(right)[#text(size: 18pt, fill: rgb("#0a0f14"))[#context counter(page).display("1")]]])
#set text(size: 12pt, font: "Arial")
#set heading(numbering: none)
#set-mode("presentation")
// show-advanced honours `--input advanced=` (see document driver note).

// title-slide: the opening slide (image background + title block).
#title-slide(
  title: "Financial Markets Academy (finma)",
  subtitle: "Dual-Format API Showcase",
  author: "Every exported function, on one deck",
)

#set page(width: 29.7cm, height: 20.999cm, margin: (x: 0.5in, y: 0.5in), flipped: false,
  header: [#align(right + horizon)[#v(0.78in)#image("../cropped_FINMA_logo.png", height: 0.4in)]],
  footer: [#line(length: 100%, stroke: (paint: rgb("#609ed6"), thickness: 1.5pt))#v(-0.2cm)
    #align(right)[#text(size: 12pt, fill: rgb("#0a0f14"))[#context counter(page).display("1")]]])

#include "api_showcase_content.typ"

// final-slide: the closing slide (only meaningful in presentation mode).
#final-slide(
  "Thank you",
  subtitle: "That is the complete dual-format API",
  next-topic: "Build your own course from the template",
)
