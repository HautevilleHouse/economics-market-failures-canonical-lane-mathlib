import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_ArrowDebreu

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure FirstWelfareTheoremPackage (A : ArrowDebreuEquilibriumPackage) where
  competitiveEquilibriumAllocation : Type u
  paretoEfficiencyConditions : Prop
  equityConditions : Prop
  firstWelfareTheoremStatement : Prop

structure FirstWelfareTheoremEvidence {A : ArrowDebreuEquilibriumPackage}
    (F : FirstWelfareTheoremPackage A) where
  competitiveEquilibriumAllocationClosed : F.competitiveEquilibriumAllocation
  paretoEfficiencyConditionsClosed : F.paretoEfficiencyConditions
  equityConditionsClosed : F.equityConditions
  firstWelfareTheoremStatementClosed : F.firstWelfareTheoremStatement

def FirstWelfareTheoremClosed {A : ArrowDebreuEquilibriumPackage}
    (F : FirstWelfareTheoremPackage A) : Prop :=
  F.competitiveEquilibriumAllocation ∧ F.paretoEfficiencyConditions ∧
  F.equityConditions ∧ F.firstWelfareTheoremStatement

theorem first_welfare_theorem_closed_from_evidence {A : ArrowDebreuEquilibriumPackage}
    (F : FirstWelfareTheoremPackage A) (E : FirstWelfareTheoremEvidence F) :
    FirstWelfareTheoremClosed F := by
  exact And.intro E.competitiveEquilibriumAllocationClosed
    (And.intro E.paretoEfficiencyConditionsClosed
      (And.intro E.equityConditionsClosed E.firstWelfareTheoremStatementClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse