import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure AssetPricingPackage where
  stateSpace : Type u
  assetPayoffs : stateSpace → ℝ
  price : ℝ
  stochasticDiscountFactor : stateSpace → ℝ
  noArbitrage : Prop
  riskNeutralValuation : Prop
  marketComplete : Prop
  equilibriumPricing : Prop

structure AssetPricingEvidence (A : AssetPricingPackage) where
  noArbitrageClosed : A.noArbitrage
  riskNeutralValuationClosed : A.riskNeutralValuation
  marketCompleteClosed : A.marketComplete
  equilibriumPricingClosed : A.equilibriumPricing

def AssetPricingClosed (A : AssetPricingPackage) : Prop :=
  A.noArbitrage ∧ A.riskNeutralValuation ∧ A.marketComplete ∧ A.equilibriumPricing

theorem asset_pricing_closed_from_evidence (A : AssetPricingPackage)
    (E : AssetPricingEvidence A) : AssetPricingClosed A := by
  exact And.intro E.noArbitrageClosed
    (And.intro E.riskNeutralValuationClosed
      (And.intro E.marketCompleteClosed E.equilibriumPricingClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse