import EconomicsMarketFailuresCanonicalLaneLean.AdmissibleClass

/-!
# Walras Equilibrium Package
-/

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure WalrasEquilibriumPackage {G : ConsumptionSetPackage}
    {P : PreferencePackage G} {E : EndowmentPackage P}
    (M : MarketMechanismPackage E) where
  priceVector : Type u
  individualDemand : Type v
  marketClearing : Prop
  firstWelfareTheoremHolds : Prop
  secondWelfareTheoremHolds : Prop

structure WalrasEquilibriumEvidence {G : ConsumptionSetPackage}
    {P : PreferencePackage G} {E : EndowmentPackage P}
    {M : MarketMechanismPackage E} (W : WalrasEquilibriumPackage M) where
  marketClearingClosed : W.marketClearing
  firstWelfareTheoremClosed : W.firstWelfareTheoremHolds
  secondWelfareTheoremClosed : W.secondWelfareTheoremHolds

def WalrasEquilibriumClosed {G : ConsumptionSetPackage}
    {P : PreferencePackage G} {E : EndowmentPackage P}
    {M : MarketMechanismPackage E} (W : WalrasEquilibriumPackage M) : Prop :=
  W.marketClearing ∧ W.firstWelfareTheoremHolds ∧ W.secondWelfareTheoremHolds

theorem walras_equilibrium_closed_from_evidence
    {G : ConsumptionSetPackage} {P : PreferencePackage G}
    {E : EndowmentPackage P} {M : MarketMechanismPackage E}
    (W : WalrasEquilibriumPackage M) (Ev : WalrasEquilibriumEvidence W) :
    WalrasEquilibriumClosed W := by
  exact And.intro Ev.marketClearingClosed
    (And.intro Ev.firstWelfareTheoremClosed Ev.secondWelfareTheoremClosed)

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
