import EconomicsMarketFailuresCanonicalLaneLean.ExternalitiesPackage

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure PublicGoodsAnalysis where
  nonrivalry : Prop
  nonexcludability : Prop
  freeRiderProblem : Prop
  lindahlEquilibrium : Prop
  samuelsonCondition : Prop

def publicGoodsClosed (P : PublicGoodsAnalysis) : Prop :=
  P.nonrivalry ∧ P.nonexcludability ∧ P.freeRiderProblem ∧ P.lindahlEquilibrium ∧ P.samuelsonCondition

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
