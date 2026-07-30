import canonicalLaneMathlib.MarketFailureClassification

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketFailurePackage where
  externalityPresent : Prop
  publicGoodProvision : Prop
  marketPower : Prop
  incompleteInformation : Prop
  equityConcern : Prop

structure MarketFailureEvidence (M : MarketFailurePackage) where
  externalityPresentClosed : M.externalityPresent
  publicGoodProvisionClosed : M.publicGoodProvision
  marketPowerClosed : M.marketPower
  incompleteInformationClosed : M.incompleteInformation
  equityConcernClosed : M.equityConcern

def MarketFailureClosed (M : MarketFailurePackage) : Prop :=
  M.externalityPresent ∧ M.publicGoodProvision ∧ M.marketPower ∧
  M.incompleteInformation ∧ M.equityConcern

theorem market_failure_closed_from_evidence (M : MarketFailurePackage)
    (E : MarketFailureEvidence M) : MarketFailureClosed M := by
  exact And.intro E.externalityPresentClosed
    (And.intro E.publicGoodProvisionClosed
      (And.intro E.marketPowerClosed
        (And.intro E.incompleteInformationClosed E.equityConcernClosed)))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
