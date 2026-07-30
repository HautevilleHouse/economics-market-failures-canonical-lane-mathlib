import EconomicsMarketFailuresCanonicalLaneLean.Externalities
import EconomicsMarketFailuresCanonicalLaneLean.PublicGoods
import EconomicsMarketFailuresCanonicalLaneLean.IncompleteMarkets

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketFailureCorePackage (E : ExternalitiesPackage) (P : PublicGoodsPackage) (I : IncompleteMarketsPackage) where
  externalityDistortion : Prop
  publicGoodUnderprovision : Prop
  adverseSelection : Prop
  moralHazard : Prop

def MarketFailureCoreClosed (E : ExternalitiesPackage) (P : PublicGoodsPackage) (I : IncompleteMarketsPackage) (C : MarketFailureCorePackage E P I) : Prop :=
  C.externalityDistortion ∧ C.publicGoodUnderprovision ∧ C.adverseSelection ∧ C.moralHazard

theorem market_failure_core_evidence (E : ExternalitiesPackage) (P : PublicGoodsPackage) (I : IncompleteMarketsPackage) (C : MarketFailureCorePackage E P I) (h1 : C.externalityDistortion) (h2 : C.publicGoodUnderprovision) (h3 : C.adverseSelection) (h4 : C.moralHazard) : MarketFailureCoreClosed E P I C :=
  by exact And.intro h1 (And.intro h2 (And.intro h3 h4))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse