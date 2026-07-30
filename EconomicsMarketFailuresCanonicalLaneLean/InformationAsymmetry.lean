import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure InformationAsymmetryPackage where
  marketAdverseSelection : Prop
  moralHazard : Prop
  signalingEfficient : Prop
  screeningEfficient : Prop

structure InformationAsymmetryEvidence (I : InformationAsymmetryPackage) where
  marketAdverseSelectionClosed : I.marketAdverseSelection
  moralHazardClosed : I.moralHazard
  signalingEfficientClosed : I.signalingEfficient
  screeningEfficientClosed : I.screeningEfficient

def InformationAsymmetryClosed (I : InformationAsymmetryPackage) : Prop :=
  I.marketAdverseSelection ∧ I.moralHazard ∧ I.signalingEfficient ∧ I.screeningEfficient

theorem information_asymmetry_closed_from_evidence
    (I : InformationAsymmetryPackage)
    (Ev : InformationAsymmetryEvidence I) : InformationAsymmetryClosed I := by
  exact And.intro Ev.marketAdverseSelectionClosed
    (And.intro Ev.moralHazardClosed
      (And.intro Ev.signalingEfficientClosed Ev.screeningEfficientClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse