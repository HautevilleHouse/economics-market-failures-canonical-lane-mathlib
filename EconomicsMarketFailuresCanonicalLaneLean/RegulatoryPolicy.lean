import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.MarketFailureTypes

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure RegulatoryPolicyPackage {MF : MarketFailureTypesPackage} (E : MarketFailureTypesEvidence MF) where
  pigouvianTax : Prop
  quantityRegulation : Prop
  propertyRightsAllocation : Prop
  antitrustEnforcement : Prop
  informationDisclosure : Prop

structure RegulatoryPolicyEvidence {MF : MarketFailureTypesPackage} {E : MarketFailureTypesEvidence MF}
    (R : RegulatoryPolicyPackage E) where
  pigouvianTaxClosed : R.pigouvianTax
  quantityRegulationClosed : R.quantityRegulation
  propertyRightsAllocationClosed : R.propertyRightsAllocation
  antitrustEnforcementClosed : R.antitrustEnforcement
  informationDisclosureClosed : R.informationDisclosure

def RegulatoryPolicyClosed {MF : MarketFailureTypesPackage} {E : MarketFailureTypesEvidence MF}
    (R : RegulatoryPolicyPackage E) : Prop :=
  R.pigouvianTax ∧ R.quantityRegulation ∧ R.propertyRightsAllocation ∧
  R.antitrustEnforcement ∧ R.informationDisclosure

theorem regulatory_policy_closed_from_evidence
    {MF : MarketFailureTypesPackage} {E : MarketFailureTypesEvidence MF}
    (R : RegulatoryPolicyPackage E) (Ev : RegulatoryPolicyEvidence R) :
    RegulatoryPolicyClosed R := by
  exact And.intro Ev.pigouvianTaxClosed
    (And.intro Ev.quantityRegulationClosed
      (And.intro Ev.propertyRightsAllocationClosed
        (And.intro Ev.antitrustEnforcementClosed Ev.informationDisclosureClosed)))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse