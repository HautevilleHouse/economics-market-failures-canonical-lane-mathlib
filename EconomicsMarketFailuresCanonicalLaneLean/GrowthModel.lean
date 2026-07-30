import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure GrowthModelPackage where
  productionFunction : ℝ → ℝ → ℝ  -- capital, labor to output
  capitalAccumulation : ℝ → ℝ → ℝ  -- capital today, investment to capital tomorrow
  utilityDiscount : ℝ
  householdOptimization : Prop
  firmProfitMaximization : Prop
  marketClearingGoods : Prop
  steadyStateExistence : Prop
  balancedGrowthPath : Prop

structure GrowthModelEvidence (G : GrowthModelPackage) where
  householdOptimizationClosed : G.householdOptimization
  firmProfitMaximizationClosed : G.firmProfitMaximization
  marketClearingGoodsClosed : G.marketClearingGoods
  steadyStateExistenceClosed : G.steadyStateExistence
  balancedGrowthPathClosed : G.balancedGrowthPath

def GrowthModelClosed (G : GrowthModelPackage) : Prop :=
  G.householdOptimization ∧ G.firmProfitMaximization ∧
  G.marketClearingGoods ∧ G.steadyStateExistence ∧ G.balancedGrowthPath

theorem growth_model_closed_from_evidence (G : GrowthModelPackage)
    (E : GrowthModelEvidence G) : GrowthModelClosed G := by
  exact And.intro E.householdOptimizationClosed
    (And.intro E.firmProfitMaximizationClosed
      (And.intro E.marketClearingGoodsClosed
        (And.intro E.steadyStateExistenceClosed E.balancedGrowthPathClosed)))

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse