import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.WelfareTheorems
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GrowthModel
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.AssetPricing

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketFailuresPackage
    {P : PreferenceUtilityPackage} {E : ArrowDebreuEquilibriumPackage P}
    (W : WelfareTheoremsPackage E) (G : GrowthModelPackage) (A : AssetPricingPackage) where
  externalities : Prop
  publicGoods : Prop
  incompleteMarkets : Prop
  asymmetricInformation : Prop
  marketPower : Prop
  governmentInterventionNeeded : Prop

structure MarketFailuresEvidence
    {P : PreferenceUtilityPackage} {E : ArrowDebreuEquilibriumPackage P}
    {W : WelfareTheoremsPackage E} {G : GrowthModelPackage} {A : AssetPricingPackage}
    (M : MarketFailuresPackage W G A) where
  externalitiesClosed : M.externalities
  publicGoodsClosed : M.publicGoods
  incompleteMarketsClosed : M.incompleteMarkets
  asymmetricInformationClosed : M.asymmetricInformation
  marketPowerClosed : M.marketPower
  governmentInterventionNeededClosed : M.governmentInterventionNeeded

def MarketFailuresClosed
    {P : PreferenceUtilityPackage} {E : ArrowDebreuEquilibriumPackage P}
    {W : WelfareTheoremsPackage E} {G : GrowthModelPackage} {A : AssetPricingPackage}
    (M : MarketFailuresPackage W G A) : Prop :=
  M.externalities ∧ M.publicGoods ∧ M.incompleteMarkets ∧
  M.asymmetricInformation ∧ M.marketPower ∧ M.governmentInterventionNeeded

theorem market_failures_closed_from_evidence
    {P : PreferenceUtilityPackage} {E : ArrowDebreuEquilibriumPackage P}
    {W : WelfareTheoremsPackage E} {G : GrowthModelPackage} {A : AssetPricingPackage}
    (M : MarketFailuresPackage W G A) (Ev : MarketFailuresEvidence M) :
    MarketFailuresClosed M := by
  exact And.intro Ev.externalitiesClosed
    (And.intro Ev.publicGoodsClosed
      (And.intro Ev.incompleteMarketsClosed
        (And.intro Ev.asymmetricInformationClosed
          (And.intro Ev.marketPowerClosed Ev.governmentInterventionNeededClosed))))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse