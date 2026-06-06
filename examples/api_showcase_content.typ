// API Showcase — shared content for both the slides and document drivers.
//
// Purpose: exercise EVERY public symbol exported by dual_format.typ at least
// once, so the examples/ directory is a complete, compile-checked reference
// for the dual-format API. Unlike the corporate-finance example (a realistic
// lecture), this file is organised by API surface, not by subject matter.
//
// Routing convention used below:
//   - Mode-aware functions (content-block, section, formula, make-table,
//     examples-box, advanced-content) are called directly — they render in
//     BOTH slides and document.
//   - Slide-only layout builders are wrapped in `presentation-only[...]`.
//   - Document-only building blocks are wrapped in `document-only[...]`.

#import "../dual_format.typ": *

#document-only[
  #pagebreak()
  #outline()
]

// ---------------------------------------------------------------------------
#section("1 · Unified, mode-aware functions",
subtitle: [
  These render in *both* formats. Write once; the system adapts the output.
])

// content-block: the primary authoring unit. This call uses every parameter.
#content-block(
  title: "content-block — the core authoring unit",
  subtext: "subtext renders under the title in both formats",
  centered: false,
  summary: [
    - `summary:` is the slide body — and the gray "Summary Slide:" box in the document
    - Keep it sparse: 2–4 bullets
    - `details:` (below) is document-only long-form prose
    - `examples:` produces a separate "Examples" slide + an orange box in the document
  ],
  details: [
    The `details:` parameter holds the long-form expansion that appears *only*
    in the document, beneath the summary box. This is the core dual-format
    contract: a document reader sees what the audience saw (the boxed summary)
    plus the surrounding depth that did not fit on the slide.

    `level:` controls the heading depth of the title in document mode
    (default `2`); pass `level: 3` to nest a block under a parent section.
  ],
  examples: [
    - *Hedging:* lock in a price today against an uncertain future cost
    - *Speculation:* take a directional position to profit from a view
    - *Arbitrage:* exploit a price discrepancy for a riskless profit
  ]
)

// content-block-doc-only: same signature, but excluded from slides. In the
// document it uses a DASHED border + "(not presented)" label so the reader can
// tell at a glance that no slide existed for this material.
#content-block-doc-only(
  title: "content-block-doc-only — document-only, dashed border",
  summary: [
    This block never appears in the slides. In the document it gets a dashed
    gray border labelled "Summary Slide (not presented):" — the visual
    counterpart to the solid-bordered "Summary Slide:" above.
  ],
  details: [
    Use this to cull a slide while keeping its material in the study guide.
    Never wrap a regular `content-block(...)` in `document-only(...)` for this —
    that still draws the solid "Summary Slide:" box and falsely implies a slide
    existed.
  ]
)

// formula: titled formula box, mode-aware (formula-slide vs formula-block).
#formula(
  title: "formula — unified formula box",
  $ "WACC" = r_e times E/V + r_d times (1 - tau) times D/V $,
  explanation: [The weighted average cost of capital, blending levered equity
    and after-tax debt costs.],
  notes: [`notes:` appears only in the document version (formula-block).]
)

// make-table: styled table, renders in both formats.
#content-block(
  title: "make-table — styled tables",
  centered: false,
  summary: [
    #make-table(
      columns: (1fr, 1fr, 1fr),
      header-fills: (rgb("#384d81"), rgb("#384d81"), rgb("#384d81")),
      header-styles: (("Instrument", ""), ("Payoff", ""), ("Risk", "")),
      body-content: (
        ("Forward", "Linear", "Symmetric"),
        ("Option", "Convex", "Asymmetric"),
        ("Swap", "Linear (netted)", "Counterparty"),
      )
    )
  ]
)

// examples-box: the mode-aware orange box, used standalone (outside a
// content-block). This is the canonical definition from dual_format.typ.
#content-block(
  title: "examples-box — standalone orange box",
  centered: false,
  summary: [
    #examples-box[
      - Works in *both* slides and document (mode-aware)
      - Use it for a cluster of brief worked examples outside a content-block
    ]
  ]
)

// advanced-content: hidden when compiled with `--input advanced=false`
// (or `make ADVANCED=false`). Honours the flag here — no set-show-advanced
// override — so the showcase demonstrates the strip-down capability.
#content-block(
  title: "advanced-content — tiered material",
  centered: false,
  summary: [
    The block below is wrapped in `advanced-content`. It is visible in the
    default build and removed by `make ADVANCED=false`.
    #advanced-content[
      *Advanced:* the Modigliani–Miller adjusted-present-value decomposition,
      $ V_L = V_U + tau D - "PV(financial distress)" $, shown only in the
      full-detail build.
    ]
  ]
)

// ---------------------------------------------------------------------------
#section("2 · Conditional content wrappers",
subtitle: [
  Fine-grained per-snippet control when the content-block model is too coarse.
])

#content-block(
  title: "presentation-only / document-only / both-formats",
  centered: false,
  summary: [
    #presentation-only[*presentation-only:* you are seeing this on a slide.]
    #document-only[*document-only:* you are reading this in the document.]

    #both-formats(
      [*both-formats* (slide branch): this text is the presentation variant.],
      [*both-formats* (document branch): this text is the document variant.],
    )
  ]
)

// slide-break() / page-break(): mode-aware breaks. Called at top level (NOT
// inside a summary:/details: container, which Typst disallows).
#presentation-only[
  This sentence is just before a `slide-break()`.
]
#slide-break()
#document-only[
  This sentence is just before a `page-break()`.
]
#page-break()

// ---------------------------------------------------------------------------
#section("3 · Presentation layout primitives",
subtitle: [
  Slide builders — wrapped in `presentation-only`, so they appear only in the
  slides. (The document equivalents are in section 4.)
])

#presentation-only[
  // slide: the low-level titled-slide builder.
  #slide(title: "slide() — low-level titled slide")[
    A plain slide with a title and vertically-centred body.
  ]

  // two-column-slide: full-slide two-column layout.
  #two-column-slide(title: "two-column-slide()")[
    *Left column*

    Risk-neutral pricing discounts expected payoffs at the risk-free rate.
  ][
    *Right column*

    Replication: build a portfolio that matches the derivative's payoff.
  ]

  // highlight-slide: content plus an emphasised box (custom colour).
  #highlight-slide(
    title: "highlight-slide()",
    [Put–call parity links calls, puts, the underlying, and a bond.],
    [Key result: $C - P = S - K e^(-r T)$],
    color: rgb("#006d8f"),
  )

  // formula-slide: emphasised formula box (the slide half of `formula`).
  #formula-slide(
    title: "formula-slide()",
    $ C = S N(d_1) - K e^(-r T) N(d_2) $,
    explanation: [The Black–Scholes price of a European call.],
  )

  // section-slide: a bare section divider (what `section()` calls in slides).
  #section-slide("section-slide() — a divider")

  // The grid layout helpers. two-column-grid / two-row-grid also appear inside
  // content-block summaries in the finance example; here are the rest.
  #slide(title: "two-by-two-grid()", center: false)[
    #two-by-two-grid(
      [*Top-left*\ Forwards], [*Top-right*\ Futures],
      [*Bottom-left*\ Options], [*Bottom-right*\ Swaps],
    )
  ]

  #slide(title: "three-column-grid()", center: false)[
    #three-column-grid(
      [*Left*\ Underlying], [*Middle*\ Derivative], [*Right*\ Hedge],
    )
  ]

  #slide(title: "two-column-grid() · two-row-grid()", center: false)[
    #two-column-grid(
      [*two-column-grid* left], [*two-column-grid* right],
    )
    #v(0.5em)
    #two-row-grid(
      [*two-row-grid* top], [*two-row-grid* bottom],
    )
  ]

  #slide(title: "three-row-grid()", center: false)[
    #three-row-grid(
      [*Top*\ Spot], [*Middle*\ Forward], [*Bottom*\ Option],
    )
  ]
]

// ---------------------------------------------------------------------------
#section("4 · Document building blocks",
subtitle: [
  Document-mode helpers — wrapped in `document-only`, so they enrich the study
  guide without affecting the slides.
])

#document-only[
  // section-heading: the document equivalent of section-slide (what
  // `section()` calls in document mode).
  #section-heading("section-heading() — document divider")

  // formula-block: the document half of `formula`, with a notes line.
  #formula-block(
    title: "formula-block()",
    $ "PV" = sum_(t=1)^T C_t / (1 + r)^t $,
    explanation: [Present value as the sum of discounted cash flows.],
    notes: [`formula-block` supports a `notes:` line; `formula-slide` does not.],
  )

  // concept-box: four semantic types (info / warning / success / note).
  #concept-box(title: "concept-box — info", type: "info")[
    The default informational callout.
  ]
  #concept-box(title: "concept-box — warning", type: "warning")[
    Use for caveats and common pitfalls.
  ]
  #concept-box(title: "concept-box — success", type: "success")[
    Use for confirmations and good-practice notes.
  ]
  #concept-box(title: "concept-box — note", type: "note")[
    A neutral aside.
  ]

  // example-box / definition-box / takeaways-box: thin wrappers over
  // concept-box with preset titles and colours.
  #example-box(title: "example-box")[
    A worked example: a 1-year forward on a non-dividend stock priced at
    $F = S e^(r T)$.
  ]

  #definition-box("Arbitrage")[
    A set of trades with no net cost and no risk that yields a certain profit.
  ]

  #takeaways-box[
    - `concept-box` is the base; `example-box`, `definition-box`, and
      `takeaways-box` are its specialised forms
    - Reach for these in `details:` prose to structure long-form content
  ]

  // two-column-content: simple side-by-side document layout.
  #two-column-content(
    [*Left.* Document-mode two-column layout for comparisons.],
    [*Right.* Unlike two-column-slide, this is plain flowing content.],
  )

  // figure-box: a captioned, centred image with spacing.
  #figure-box(
    image("images/wacc_leverage.png", width: 100%),
    caption: "figure-box() — captioned, centred image",
    width: 70%,
  )
]
