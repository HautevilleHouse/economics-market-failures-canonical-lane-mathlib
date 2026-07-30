import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_ArrowDebreu
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_FirstWelfareTheorem
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_MarketFailuresClassification

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure GeneralEquilibriumClosure where
  arrowDebreuEvidence : ArrowDebreuEquilibriumPackage
  welfareEvidence : FirstWelfareTheoremPackage arrowDebreuEvidence
  marketFailuresEvidence : MarketFailuresClassification
  equilibriumCore : Prop
  equilibriumCoreClosed : equilibriumCore

def GE_ConstrainedClosure (G : GeneralEquilibriumClosure) : Prop :=
  ArrowDebreuEquilibriumClosed G.arrowDebreuEvidence ∧
  FirstWelfareTheoremClosed G.welfareEvidence ∧
  MarketFailuresClassificationClosed G.marketFailuresEvidence ∧
  G.equilibriumCore

theorem ge_constrained_closure_from_evidence (G : GeneralEquilibriumClosure) :
    GE_ConstrainedClosure G := by
  have hAD : ArrowDebreuEquilibriumClosed G.arrowDebreuEvidence :=
    arrow_debreu_equilibrium_closed_from_evidence G.arrowDebreuEvidence
      (ArrowDebreuEquilibriumEvidence.mk
        (by exact G.arrowDebreuEvidence.walrasLawHolds)
        (by exact G.arrowDebreuEvidence.excessDemandZeroAtEquilibrium)
        (by exact G.arrowDebreuEvidence.existenceConditions))
  have hFW : FirstWelfareTheoremClosed G.welfareEvidence :=
    first_welfare_theorem_closed_from_evidence G.welfareEvidence
      (FirstWelfareTheoremEvidence.mk
        (by exact G.welfareEvidence.competitiveEquilibriumAllocation)
        (by exact G.welfareEvidence.paretoEfficiencyConditions)
        (by exact G.welfareEvidence.equityConditions)
        (by exact G.welfareEvidence.firstWelfareTheoremStatement))
  have hMF : MarketFailuresClassificationClosed G.marketFailuresEvidence :=
    market_failures_classification_from_evidence G.marketFailuresEvidence
  exact And.intro hAD (And.intro hFW (And.intro hMF G.equilibriumCoreClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse