import EconomicsMarketFailuresCanonicalLaneLean.ArrowDebreuEquilibrium

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketFailureBridge where
  equilibrium : ArrowDebreuEquilibrium
  failureTypes : List String
  failureConditions : Prop
  welfareTheorems : Prop
  governmentIntervention : Prop

def marketFailureBridgeClosed (M : MarketFailureBridge) : Prop :=
  M.failureConditions ∧ M.welfareTheorems ∧ M.governmentIntervention

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
