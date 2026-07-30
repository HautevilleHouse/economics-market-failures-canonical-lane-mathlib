import canonicalLaneMathlib.RemediationPolicy

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure RemediationPackage where
  pigouvianTax : Prop
  coaseTheoremApplicable : Prop
  regulationMechanism : Prop
  optimalSubsidy : Prop

structure RemediationEvidence (R : RemediationPackage) where
  pigouvianTaxClosed : R.pigouvianTax
  coaseTheoremApplicableClosed : R.coaseTheoremApplicable
  regulationMechanismClosed : R.regulationMechanism
  optimalSubsidyClosed : R.optimalSubsidy

def RemediationClosed (R : RemediationPackage) : Prop :=
  R.pigouvianTax ∧ R.coaseTheoremApplicable ∧ R.regulationMechanism ∧ R.optimalSubsidy

theorem remediation_closed_from_evidence (R : RemediationPackage)
    (E : RemediationEvidence R) : RemediationClosed R := by
  exact And.intro E.pigouvianTaxClosed
    (And.intro E.coaseTheoremApplicableClosed
      (And.intro E.regulationMechanismClosed E.optimalSubsidyClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
