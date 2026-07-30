import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure ExternalityPackage where
  productionExternality : Prop
  consumptionExternality : Prop
  pigouvianTax : Prop
  coaseTheoremApplicable : Prop
  propertyRightsDefined : Prop

structure ExternalityEvidence (E : ExternalityPackage) where
  productionExternalityClosed : E.productionExternality
  consumptionExternalityClosed : E.consumptionExternality
  pigouvianTaxClosed : E.pigouvianTax
  coaseTheoremApplicableClosed : E.coaseTheoremApplicable
  propertyRightsDefinedClosed : E.propertyRightsDefined

def ExternalityClosed (E : ExternalityPackage) : Prop :=
  E.productionExternality ∧ E.consumptionExternality ∧ E.pigouvianTax ∧ E.coaseTheoremApplicable ∧ E.propertyRightsDefined

theorem externality_closed_from_evidence (E : ExternalityPackage) (Ev : ExternalityEvidence E) :
    ExternalityClosed E := by
  exact And.intro Ev.productionExternalityClosed (And.intro Ev.consumptionExternalityClosed (And.intro Ev.pigouvianTaxClosed (And.intro Ev.coaseTheoremApplicableClosed Ev.propertyRightsDefinedClosed)))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse