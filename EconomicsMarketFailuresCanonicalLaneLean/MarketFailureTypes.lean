import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketFailureTypesPackage where
  externalities : Prop
  publicGoods : Prop
  marketPower : Prop
  incompleteInformation : Prop
  coordinationFailures : Prop

structure MarketFailureTypesEvidence (MF : MarketFailureTypesPackage) where
  externalitiesClosed : MF.externalities
  publicGoodsClosed : MF.publicGoods
  marketPowerClosed : MF.marketPower
  incompleteInformationClosed : MF.incompleteInformation
  coordinationFailuresClosed : MF.coordinationFailures

def MarketFailureTypesClosed (MF : MarketFailureTypesPackage) : Prop :=
  MF.externalities ∧ MF.publicGoods ∧ MF.marketPower ∧
  MF.incompleteInformation ∧ MF.coordinationFailures

theorem market_failure_types_closed_from_evidence
    (MF : MarketFailureTypesPackage) (E : MarketFailureTypesEvidence MF) :
    MarketFailureTypesClosed MF := by
  exact And.intro E.externalitiesClosed
    (And.intro E.publicGoodsClosed
      (And.intro E.marketPowerClosed
        (And.intro E.incompleteInformationClosed E.coordinationFailuresClosed)))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse