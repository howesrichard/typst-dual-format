// Module: Arbitrage Proof Concepts
// Purpose: Sets out content related to arbitrage proofs for MM irrelevance
// Reuse contexts: various
// Dependencies: dual_format.typ, document_functions.typ

#import "../../dual_format.typ": *
#import "../../document_functions.typ": *

#content-block(
  title: "Arbitrage Proof Framework",
  center: false,
  summary: [
    #two-row-grid(
      [- If there are two ways to produce the same cash flows, they must cost the same.
  - If not, it is possible to generate a riskless profit that requires no initial investment:
  - Buy the one with the low price
  - Sell the one with the high price
  Arbitrage opportunity
  - Keep the difference in prices,
  - Future cash flows will cancel out
  - Competition among investors will drive any arbitrage opportunities out of the market],
      [*NOW,*
  - Consider two firms with identical operating cash flows, X, but different capital structures
  - Firm U is all-equity financed (i.e., unlevered)
  - For an unlevered firm, VU = EU
  - Firm L uses both debt and equity financing (i.e., levered)
  - For a levered firm, VL = EL + DL
  - We will show that because these two firms have identical operating cash flows, they must have identical
  total market values, VU = VL, despite having different capital structures (see next page)]
    )
    ]
  )

#content-block(
  title: "Arbitrage Proof Details",
  center: false,
  summary: [
    #two-column-grid(
      [#block(width: 100%, height: 85%)[
  *Investment in Unlevered Firm (1% stake)*
  #make-table(columns: (1fr, 1fr), header-fills: (rgb("#384d81"), rgb("#384d81")), header-styles: (("Component", ""), ("Amount", "")), body-content: (("Investment", "(0.01) $times$ $V_U$"), ("Cash Flow", "(0.01) $times$ X")))
]],
      [#block(width: 100%, height: 85%)[
  *Investment in Levered Firm (1% stake)*
  #make-table(columns: (1fr, 1fr, 1fr), header-fills: (rgb("#384d81"), rgb("#384d81"), rgb("#384d81")), header-styles: (("Position", ""), ("Investment", ""), ("Cash Flow", "")), body-content: (("Equity", "(0.01) $times$ $E_L$", "(0.01)[X - $r_d$ D]"), ("Debt", "(0.01) $times$ $D_L$", "(0.01)[$r_d$ D]"), ("Total", "(0.01) $times$ $V_L$", "(0.01) $times$ X")))
]]
    )
  ]
)

