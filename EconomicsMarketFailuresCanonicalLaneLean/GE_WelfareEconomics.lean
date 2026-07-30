import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_ArrowDebreu

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure SocialWelfareFunction (A : ArrowDebreuEquilibriumPackage) where
  utilityPossibilitySet : Type u
  socialWelfareConditions : Prop
  equityConstraints : Prop
  redistributionMechanisms : Prop
  welfareMaximization : Prop
  socialWelfareConditionsClosed : socialWelfareConditions
  equityConstraintsClosed : equityConstraints
  redistributionMechanismsClosed : redistributionMechanisms
  welfareMaximizationClosed : welfareMaximization

def WelfareEconomicsClosed {A : ArrowDebreuEquilibriumPackage} (S : SocialWelfareFunction A) : Prop :=
  S.socialWelfareConditions ∧ S.equityConstraints ∧
  S.redistributionMechanisms ∧ S.welfareMaximization

theorem welfare_economics_closed_from_evidence {A : ArrowDebreuEquilibriumPackage}
    (S : SocialWelfareFunction A) : WelfareEconomicsClosed S := by
  exact And.intro S.socialWelfareConditionsClosed
    (And.intro S.equityConstraintsClosed
      (And.intro S.redistributionMechanismsClosed S.welfareMaximizationClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse