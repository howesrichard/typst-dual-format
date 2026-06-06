// API Showcase — long-form document driver.
// Renders api_showcase_content.typ in document mode.
#import "../dual_format.typ": *

#set text(size: 12pt)
#set heading(numbering: "1.")
#set par(justify: true)
#set-mode("document")
// NOTE: show-advanced is intentionally NOT overridden here — it honours the
// `--input advanced=` flag, so `make ADVANCED=false` strips advanced-content.

#set page(
  paper: "a4",
  margin: (top: 2in),
  header: [#align(right)[#image("../cropped_FINMA_logo.png", height: 0.3in)]#v(0.9in)],
  footer: none,
)

// document-cover: the library's cover-page helper (build date is auto-filled).
#document-cover(
  title: "Dual-Format API Showcase",
  subtitle: "A complete reference for every exported function",
  author: "Financial Markets Academy",
)

// Reset page settings for content pages
#set page(
  paper: "a4",
  margin: (top: 0.7in, right: 0.7in, bottom: 0.7in, left: 0.7in),
  footer: [#v(0.1in)#line(length: 100%)#v(-6pt)#align(center)[#text(size: 12pt)[#context counter(page).display("1")]]],
  header: [#text(size: 12pt)[#grid(columns: 3, gutter: 1fr, [API Showcase], [Dual-Format System], [finma])]#v(-12pt)#line(length: 100%)#v(0.2in)],
)

#include "api_showcase_content.typ"
