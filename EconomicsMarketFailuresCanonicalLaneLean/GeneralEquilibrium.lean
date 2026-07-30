import EconomicsMarketFailuresCanonicalLaneLean.WalrasianAuction

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure GeneralEquilibriumPackage {W : WalrasianAuctionPackage} where
  excessDemandZero : W.price → Prop
  marketClearing : Prop
  paretoOptimality : Prop
  equilibriumExists : Prop

structure GeneralEquilibriumEvidence {W : WalrasianAuctionPackage} (G : GeneralEquilibriumPackage W) where
  excessDemandZeroClosed : G.excessDemandZero W.equilibriumPrice
  marketClearingClosed : G.marketClearing
  paretoOptimalityClosed : G.paretoOptimality
  equilibriumExistsClosed : G.equilibriumExists

def GeneralEquilibriumClosed {W : WalrasianAuctionPackage} (G : GeneralEquilibriumPackage W) : Prop :=
  G.excessDemandZero W.equilibriumPrice ∧ G.marketClearing ∧ G.paretoOptimality ∧ G.equilibriumExists

theorem general_equilibrium_closed_from_evidence
    {W : WalrasianAuctionPackage} (G : GeneralEquilibriumPackage W) (E : GeneralEquilibriumEvidence G) :
    GeneralEquilibriumClosed G := by
  exact And.intro E.excessDemandZeroClosed (And.intro E.marketClearingClosed (And.intro E.paretoOptimalityClosed E.equilibriumExistsClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse