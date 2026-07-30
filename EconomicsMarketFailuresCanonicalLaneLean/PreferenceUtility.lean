import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure PreferenceUtilityPackage where
  agentSet : Type u
  consumptionSet : Type v
  preferenceRelation : agentSet → consumptionSet → consumptionSet → Prop
  utilityFunction : agentSet → consumptionSet → ℝ
  utilityRepresentsPreference : ∀ (a : agentSet) (x y : consumptionSet),
    preferenceRelation a x y ↔ utilityFunction a x ≤ utilityFunction a y
  continuity : Prop
  monotonicity : Prop
  convexity : Prop

structure PreferenceUtilityEvidence (P : PreferenceUtilityPackage) where
  utilityRepresentsPreferenceClosed : P.utilityRepresentsPreference
  continuityClosed : P.continuity
  monotonicityClosed : P.monotonicity
  convexityClosed : P.convexity

def PreferenceUtilityClosed (P : PreferenceUtilityPackage) : Prop :=
  P.utilityRepresentsPreference ∧ P.continuity ∧ P.monotonicity ∧ P.convexity

theorem preference_utility_closed_from_evidence (P : PreferenceUtilityPackage)
    (E : PreferenceUtilityEvidence P) : PreferenceUtilityClosed P := by
  exact And.intro E.utilityRepresentsPreferenceClosed
    (And.intro E.continuityClosed (And.intro E.monotonicityClosed E.convexityClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse