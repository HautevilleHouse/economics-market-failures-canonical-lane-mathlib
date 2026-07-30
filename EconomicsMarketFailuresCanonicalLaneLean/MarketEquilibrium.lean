import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketEquilibriumPackage where
  priceVector : Type u
  excessDemandFunction : priceVector -> priceVector
  equilibriumExists : Prop
  equilibriumUnique : Prop
  priceAdjustmentStable : Prop

structure MarketEquilibriumEvidence (M : MarketEquilibriumPackage) where
  equilibriumExistsClosed : M.equilibriumExists
  equilibriumUniqueClosed : M.equilibriumUnique
  priceAdjustmentStableClosed : M.priceAdjustmentStable

def MarketEquilibriumClosed (M : MarketEquilibriumPackage) : Prop :=
  M.equilibriumExists ∧ M.equilibriumUnique ∧ M.priceAdjustmentStable

theorem market_equilibrium_closed_from_evidence (M : MarketEquilibriumPackage)
    (E : MarketEquilibriumEvidence M) : MarketEquilibriumClosed M := by
  exact And.intro E.equilibriumExistsClosed
    (And.intro E.equilibriumUniqueClosed E.priceAdjustmentStableClosed)

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse