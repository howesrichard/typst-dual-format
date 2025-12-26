#import "../dual_format.typ": *

#document-only[
  #pagebreak()
  #outline()
]

#section("Session Objectives",
subtitle: [
  - Exploring how to determine what mix of debt and equity is optimal for a firm
  #v(1em)
  - Seeing how we can add value to a firm by financial engineering (changing the mix of debt and equity financing)
  #v(1em)
  - Investigating how capital structure issues affect the discount rate for investment project analysis
])

#section("Agenda",
subtitle: [
  1. *Capital Structure - No Taxes*
  #v(1em)
  2. *MM Irrelevance Propositions*
  #v(1em)
  3. *Arbitrage and Proof Concepts*
  #v(1em)
  4. *Leverage Effects on Returns and Risk*
])

#content-block(
  title: "Capital Structure - No Taxes",
  center: false,
  summary: [
    #two-row-grid(
      ["TOP"],
      ["BOTTOM"]
    )
  ]
)

#content-block(
  title: "MM Irrelevance Proposition", subtext: "Two professors Franco Modigliani and Merton Miller developed the theory of capital structure (Modigliani-Miller or MM theory) in the 1950s and 1960s",
  center: false,
  summary: [
    #two-row-grid(
      [Assume perfect capital markets:
1. No corporate or personal taxes
2. No transaction costs
3. Symmetric information
4. No financial distress costs
5. No agency costs],
      [*Modigliani-Miller Irrelevance Proposition:*
- Under perfect capital markets, the firm’s capital structure choice (i.e., mix of debt and equity) has no effect on its total market value or its cost of funds (i.e., the cost of financing its investments)]
    )
  ]
)

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

#content-block(
  title: "MMI: Firm Value Independence",
  center: false,
  summary: [
    #two-column-grid(
      [*Key Insight:*

Since future cash flows are identical under both investments:

$ (0.01) times V_U = (0.01) times V_L $

Therefore:
$ V_U = V_L $

*MM Proposition I:*
Firm value is invariant to capital structure],
      [#block(width: 100%, height: 100%)[
  #image("images/firm_value_leverage.png")
]]
    )
  ]
)

#content-block(
  title: "MMII: WACC Independence",
  center: false,
  summary: [
    #two-column-grid(
      [*WACC Formula:*

$ "WACC"_L = r_e^L times (E_L)/(V_L) + r_d times (D_L)/(V_L) $

*MM Proposition II:*
Weighted average cost of capital is invariant to capital structure

$ "WACC"_U = "WACC"_L $],
      [#block(width: 100%, height: 100%)[
  #image("images/wacc_leverage.png")
]]
    )
  ]
)

#content-block(
  title: "Leverage and Cost of Equity",
  center: false,
  summary: [
    #two-row-grid(
      [*Cost of Equity Relationship:*

$ r_e^L = r_e^U + (r_e^U - r_d) times (D_L)/(E_L) $

*Components:*
- $ r_e^U $ = Business risk compensation
- $ (r_e^U - r_d) times (D_L)/(E_L) $ = Financial risk premium],
      [*Key Effects of Increasing Leverage:*

1. Equity holders demand higher returns (financial risk)
2. More financing from relatively cheaper debt
3. In perfect markets, these effects cancel exactly
4. WACC remains constant]
    )
  ]
)

#content-block(
  title: "Cost of Equity Example",
  center: false,
  summary: [
    #two-column-grid(
      [*Jackson Ltd Example:*

- Unlevered firm: 12% returns
- Borrowing rate: 9%
- Desired return: 15%
- Target leverage: 50% debt

*Calculation:*
$ r_e^L = 0.12 + (0.12 - 0.09) times (50)/(50) = 15% $],
      [#block(width: 100%, height: 100%)[
  #image("images/required_return_leverage.png")
]]
    )
  ]
)

#content-block(
  title: "Homemade Leverage",
  center: false,
  summary: [
    #two-column-grid(
      [*Concept:*

Investors can create their own leverage through personal borrowing to replicate any firm's capital structure

*Principle:*
If you can't get desired leverage from the firm, create it yourself through borrowing],
      [#block(width: 100%, height: 85%)[
  *Jackson Ltd Homemade Leverage Example*
  #make-table(columns: (1fr, 1fr), header-fills: (rgb("#384d81"), rgb("#384d81")), header-styles: (("Unlevered Investment", ""), ("Homemade Leverage", "")), body-content: (("\$100 Investment", "\$100 Borrowed + \$100 Investment"), ("Jackson Ltd.", "Jackson Ltd."), ("\$112 Payoff", "\$224 - \$109 Repayment"), ("", "\$115 NET Payoff")))
]]
    )
  ]
)

#content-block(
  title: "Leverage and Risk (Beta Analysis)",
  center: false,
  summary: [
    #two-column-grid(
      [*Risk Components:*

$ r_e^L = r_e^U + (r_e^U - r_d) times (D_L)/(E_L) $

- Business risk compensation
- Financial risk compensation

*Beta Relationship:*
$ beta_e^L = beta_a + beta_a times (D)/(E) = beta_a (1 + (D)/(E)) $],
      [*Beta Definitions:*

- $ beta_a $ = Asset beta (business risk)
- $ beta_e^L $ = Equity beta (business + financial risk)

*Key Insight:*
Leverage amplifies the systematic risk of equity through the debt-to-equity ratio]
    )
  ]
)

