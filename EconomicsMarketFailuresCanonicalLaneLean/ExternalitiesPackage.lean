import EconomicsMarketFailuresCanonicalLaneLean.MarketFailureBridge

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure ExternalitiesPackage where
  productionExternalities : Prop
  consumptionExternalities : Prop
  pigouvianTax : Prop
  coaseTheorem : Prop
  propertyRights : Prop

def externalitiesClosed (E : ExternalitiesPackage) : Prop :=
  E.productionExternalities ∧ E.consumptionExternalities ∧ E.pigouvianTax ∧ E.coaseTheorem ∧ E.propertyRights

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
