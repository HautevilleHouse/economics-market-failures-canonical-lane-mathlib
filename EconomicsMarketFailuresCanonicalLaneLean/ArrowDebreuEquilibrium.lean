import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.MarketEquilibrium

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure ArrowDebreuEquilibriumPackage {M : MarketEquilibriumPackage} (E : MarketEquilibriumEvidence M) where
  commoditySpace : Type
  priceSystem : Type
  consumerPreferences : Prop
  firmProductionSets : Prop
  utilityMaximization : Prop
  profitMaximization : Prop
  marketClearing : Prop

structure ArrowDebreuEquilibriumEvidence {M : MarketEquilibriumPackage} {E : MarketEquilibriumEvidence M}
    (A : ArrowDebreuEquilibriumPackage E) where
  commoditySpaceClosed : A.commoditySpace
  priceSystemClosed : A.priceSystem
  consumerPreferencesClosed : A.consumerPreferences
  firmProductionSetsClosed : A.firmProductionSets
  utilityMaximizationClosed : A.utilityMaximization
  profitMaximizationClosed : A.profitMaximization
  marketClearingClosed : A.marketClearing

def ArrowDebreuEquilibriumClosed {M : MarketEquilibriumPackage} {E : MarketEquilibriumEvidence M}
    (A : ArrowDebreuEquilibriumPackage E) : Prop :=
  A.commoditySpace ∧ A.priceSystem ∧ A.consumerPreferences ∧
  A.firmProductionSets ∧ A.utilityMaximization ∧ A.profitMaximization ∧
  A.marketClearing

theorem arrow_debreu_equilibrium_closed_from_evidence
    {M : MarketEquilibriumPackage} {E : MarketEquilibriumEvidence M}
    (A : ArrowDebreuEquilibriumPackage E) (Ev : ArrowDebreuEquilibriumEvidence A) :
    ArrowDebreuEquilibriumClosed A := by
  exact And.intro Ev.commoditySpaceClosed
    (And.intro Ev.priceSystemClosed
      (And.intro Ev.consumerPreferencesClosed
        (And.intro Ev.firmProductionSetsClosed
          (And.intro Ev.utilityMaximizationClosed
            (And.intro Ev.profitMaximizationClosed Ev.marketClearingClosed)))))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse