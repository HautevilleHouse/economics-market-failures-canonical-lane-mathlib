import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketPowerPackage where
  monopolyPricing : Prop
  oligopolyCournotNash : Prop
  priceDiscrimination : Prop
  regulationAntitrust : Prop
  consumerWelfare : Prop

structure MarketPowerEvidence (M : MarketPowerPackage) where
  monopolyPricingClosed : M.monopolyPricing
  oligopolyCournotNashClosed : M.oligopolyCournotNash
  priceDiscriminationClosed : M.priceDiscrimination
  regulationAntitrustClosed : M.regulationAntitrust
  consumerWelfareClosed : M.consumerWelfare

def MarketPowerClosed (M : MarketPowerPackage) : Prop :=
  M.monopolyPricing ∧ M.oligopolyCournotNash ∧ M.priceDiscrimination ∧ M.regulationAntitrust ∧ M.consumerWelfare

theorem market_power_closed_from_evidence (M : MarketPowerPackage) (E : MarketPowerEvidence M) :
    MarketPowerClosed M := by
  exact And.intro E.monopolyPricingClosed (And.intro E.oligopolyCournotNashClosed (And.intro E.priceDiscriminationClosed (And.intro E.regulationAntitrustClosed E.consumerWelfareClosed)))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse