import EconomicsMarketFailuresCanonicalLaneLean.UtilityTheory
import EconomicsMarketFailuresCanonicalLaneLean.ConsumerSurplus

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure SocialWelfarePackage {U : UtilityTheoryPackage} {C : ConsumerSurplusPackage} where
  utilityAggregation : U.agent → U.utility → ℝ
  deadweightLoss : Prop
  compensationPrinciple : Prop
  socialWelfareFunction : Type u

structure WelfareEvidence {U : UtilityTheoryPackage} {C : ConsumerSurplusPackage} (W : SocialWelfarePackage U C) where
  deadweightLossClosed : W.deadweightLoss
  compensationPrincipleClosed : W.compensationPrinciple

def WelfareClosed {U : UtilityTheoryPackage} {C : ConsumerSurplusPackage} (W : SocialWelfarePackage U C) : Prop :=
  W.deadweightLoss ∧ W.compensationPrinciple

theorem welfare_closed_from_evidence {U : UtilityTheoryPackage} {C : ConsumerSurplusPackage} (W : SocialWelfarePackage U C) (E : WelfareEvidence W) : WelfareClosed W :=
  by exact And.intro E.deadweightLossClosed E.compensationPrincipleClosed

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse