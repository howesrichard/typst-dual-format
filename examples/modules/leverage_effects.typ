// Module: Leverage Effects
// Purpose: Sets out content related to leverage effects on returns, risk, and capital structure
// Reuse contexts: various
// Dependencies: dual_format.typ, document_functions.typ

#import "../../dual_format.typ": *
#import "../../document_functions.typ": *

#content-block(
  title: "MMI: Firm Value Independence",
  center: false,
  summary: [
    #two-column-grid(
      [
        *Key Insight:*

        Since future cash flows are identical under both investments:

        $ (0.01) times V_U = (0.01) times V_L $

        Therefore:
        $ V_U = V_L $

        *MM Proposition I:*
        Firm value is invariant to capital structure
      ],
      [
        #block(width: 100%, height: 100%)[
          #image("../images/firm_value_leverage.png")
        ]
      ]
    )
  ]
)

#content-block(
  title: "MMII: WACC Independence",
  center: false,
  summary: [
    #two-column-grid(
      [
        *WACC Formula:*

        $ "WACC"_L = r_e^L times (E_L)/(V_L) + r_d times (D_L)/(V_L) $

        *MM Proposition II:*
        Weighted average cost of capital is invariant to capital structure

        $ "WACC"_U = "WACC"_L $
      ],
      [
        #block(width: 100%, height: 100%)[
          #image("../images/wacc_leverage.png")
        ]
      ]
    )
  ]
)

#content-block(
  title: "Leverage and Cost of Equity",
  center: false,
  summary: [
    #two-row-grid(
      [
        *Cost of Equity Relationship:*

        $ r_e^L = r_e^U + (r_e^U - r_d) times (D_L)/(E_L) $

        *Components:*
        - $ r_e^U $ = Business risk compensation
        - $ (r_e^U - r_d) times (D_L)/(E_L) $ = Financial risk premium
      ],
      [
        *Key Effects of Increasing Leverage:*

        1. Equity holders demand higher returns (financial risk)
        2. More financing from relatively cheaper debt
        3. In perfect markets, these effects cancel exactly
        4. WACC remains constant
      ]
    )
  ]
)

#content-block(
  title: "Cost of Equity Example",
  center: false,
  summary: [
    #two-column-grid(
      [
        *Jackson Ltd Example:*

        - Unlevered firm: 12% returns
        - Borrowing rate: 9%
        - Desired return: 15%
        - Target leverage: 50% debt

        *Calculation:*
        $ r_e^L = 0.12 + (0.12 - 0.09) times (50)/(50) = 15% $
      ],
      [
        #block(width: 100%, height: 100%)[
          #image("../images/required_return_leverage.png")
        ]
      ]
    )
  ]
)

#content-block(
  title: "Homemade Leverage",
  center: false,
  summary: [
    #two-column-grid(
      [
        *Concept:*

        Investors can create their own leverage through personal borrowing to replicate any firm's capital structure

        *Principle:*
        If you can't get desired leverage from the firm, create it yourself through borrowing
      ],
      [
        #block(width: 100%, height: 85%)[
          *Jackson Ltd Homemade Leverage Example*
          #make-table(
            columns: (1fr, 1fr),
            header-fills: (rgb("#384d81"), rgb("#384d81")),
            header-styles: (("Unlevered Investment", ""), ("Homemade Leverage", "")),
            body-content: (
              ("\$100 Investment", "\$100 Borrowed + \$100 Investment"),
              ("Jackson Ltd.", "Jackson Ltd."),
              ("\$112 Payoff", "\$224 - \$109 Repayment"),
              ("", "\$115 NET Payoff")
            )
          )
        ]
      ]
    )
  ],
  details: [
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
  
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
  ]
)

#content-block(
  title: "Leverage and Risk (Beta Analysis)",
  center: false,
  summary: [
    #two-column-grid(
      [
        *Risk Components:*

        $ r_e^L = r_e^U + (r_e^U - r_d) times (D_L)/(E_L) $

        - Business risk compensation
        - Financial risk compensation

        *Beta Relationship:*
        $ beta_e^L = beta_a + beta_a times (D)/(E) = beta_a (1 + (D)/(E)) $
      ],
      [
        *Beta Definitions:*

        - $ beta_a $ = Asset beta (business risk)
        - $ beta_e^L $ = Equity beta (business + financial risk)

        *Key Insight:*
        Leverage amplifies the systematic risk of equity through the debt-to-equity ratio
      ]
    )
  ],
  details: [
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
  
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam. Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
    
    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.
    
    Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.
    
    At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi.
  ]
)
