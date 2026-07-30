import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_ArrowDebreu
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_FirstWelfareTheorem

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure ExternalitiesPackage where
  productionExternalities : Prop
  consumptionExternalities : Prop
  pigouvianTaxConditions : Prop
  coaseTheoremConditions : Prop

structure PublicGoodsPackage where
  nonrivalrousConsumption : Prop
  nonexcludability : Prop
  samuelsonConditions : Prop
  freeRiderProblem : Prop

structure MarketPowerPackage where
  monopolyPower : Prop
  monopsonyPower : Prop
  barriersToEntry : Prop
  priceDiscrimination : Prop

structure AsymmetricInformationPackage where
  adverseSelection : Prop
  moralHazard : Prop
  screeningSignaling : Prop
  principalAgentProblem : Prop

structure MarketFailuresClassification where
  externalities : ExternalitiesPackage
  publicGoods : PublicGoodsPackage
  marketPower : MarketPowerPackage
  asymmetricInformation : AsymmetricInformationPackage
  equilibriumFailure : Prop
  regulatoryIntervention : Prop
  welfareLoss : Prop
  externalitiesClosed : externalities
  publicGoodsClosed : publicGoods
  marketPowerClosed : marketPower
  asymmetricInformationClosed : asymmetricInformation
  equilibriumFailureClosed : equilibriumFailure
  regulatoryInterventionClosed : regulatoryIntervention
  welfareLossClosed : welfareLoss

def MarketFailuresClassificationClosed (M : MarketFailuresClassification) : Prop :=
  M.equilibriumFailure ∧ M.regulatoryIntervention ∧ M.welfareLoss

theorem market_failures_classification_from_evidence (M : MarketFailuresClassification) :
    MarketFailuresClassificationClosed M := by
  exact And.intro M.equilibriumFailureClosed
    (And.intro M.regulatoryInterventionClosed M.welfareLossClosed)

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse