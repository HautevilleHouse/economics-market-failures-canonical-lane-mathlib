import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.MarketFailureTypes

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure PublicGoodsProvisionPackage {MF : MarketFailureTypesPackage} (E : MarketFailureTypesEvidence MF) where
  nonRivalry : Prop
  nonExcludability : Prop
  freeRiderProblem : Prop
  optimalSamuelsonCondition : Prop
  governmentIntervention : Prop

structure PublicGoodsProvisionEvidence {MF : MarketFailureTypesPackage} {E : MarketFailureTypesEvidence MF}
    (P : PublicGoodsProvisionPackage E) where
  nonRivalryClosed : P.nonRivalry
  nonExcludabilityClosed : P.nonExcludability
  freeRiderProblemClosed : P.freeRiderProblem
  optimalSamuelsonConditionClosed : P.optimalSamuelsonCondition
  governmentInterventionClosed : P.governmentIntervention

def PublicGoodsProvisionClosed {MF : MarketFailureTypesPackage} {E : MarketFailureTypesEvidence MF}
    (P : PublicGoodsProvisionPackage E) : Prop :=
  P.nonRivalry ∧ P.nonExcludability ∧ P.freeRiderProblem ∧
  P.optimalSamuelsonCondition ∧ P.governmentIntervention

theorem public_goods_provision_closed_from_evidence
    {MF : MarketFailureTypesPackage} {E : MarketFailureTypesEvidence MF}
    (P : PublicGoodsProvisionPackage E) (Ev : PublicGoodsProvisionEvidence P) :
    PublicGoodsProvisionClosed P := by
  exact And.intro Ev.nonRivalryClosed
    (And.intro Ev.nonExcludabilityClosed
      (And.intro Ev.freeRiderProblemClosed
        (And.intro Ev.optimalSamuelsonConditionClosed Ev.governmentInterventionClosed)))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse