import canonicalLaneMathlib.AdmissibleClass
import EconomicsMarketFailuresCanonicalLaneLean.MarketFailureTypes

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure PigouvianTax (E : Externality) where
  taxRate : Nat
  productionLevel : Prop
  socialOptimumAchieved : Prop

structure CoaseBargaining (E : Externality) where
  propertyRightAssignment : Agent → Prop
  bargainingSolution : Prop
  efficientOutcome : Prop

structure PublicProvision (G : PublicGood) where
  governmentLevel : Nat
  fundedByTaxation : Prop
  optimalProvision : Prop

structure AntiTrustRegulation (M : Monopoly) where
  priceCap : Nat
  outputRequirement : Nat
  welfareImproved : Prop

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse