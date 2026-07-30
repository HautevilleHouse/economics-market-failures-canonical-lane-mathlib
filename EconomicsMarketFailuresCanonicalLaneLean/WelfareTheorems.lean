import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.ArrowDebreuEquilibrium

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure WelfareTheoremsPackage {M : MarketEquilibriumPackage} {E : MarketEquilibriumEvidence M}
    {A : ArrowDebreuEquilibriumPackage E} (Ev : ArrowDebreuEquilibriumEvidence A) where
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  paretoOptimality : Prop
  lumpSumTransfers : Prop

structure WelfareTheoremsEvidence {M : MarketEquilibriumPackage} {E : MarketEquilibriumEvidence M}
    {A : ArrowDebreuEquilibriumPackage E} {Ev : ArrowDebreuEquilibriumEvidence A}
    (W : WelfareTheoremsPackage Ev) where
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem
  paretoOptimalityClosed : W.paretoOptimality
  lumpSumTransfersClosed : W.lumpSumTransfers

def WelfareTheoremsClosed {M : MarketEquilibriumPackage} {E : MarketEquilibriumEvidence M}
    {A : ArrowDebreuEquilibriumPackage E} {Ev : ArrowDebreuEquilibriumEvidence A}
    (W : WelfareTheoremsPackage Ev) : Prop :=
  W.firstWelfareTheorem ∧ W.secondWelfareTheorem ∧
  W.paretoOptimality ∧ W.lumpSumTransfers

theorem welfare_theorems_closed_from_evidence
    {M : MarketEquilibriumPackage} {E : MarketEquilibriumEvidence M}
    {A : ArrowDebreuEquilibriumPackage E} {Ev : ArrowDebreuEquilibriumEvidence A}
    (W : WelfareTheoremsPackage Ev) (WE : WelfareTheoremsEvidence W) :
    WelfareTheoremsClosed W := by
  exact And.intro WE.firstWelfareTheoremClosed
    (And.intro WE.secondWelfareTheoremClosed
      (And.intro WE.paretoOptimalityClosed WE.lumpSumTransfersClosed))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse