import EconomicsMarketFailuresCanonicalLaneLean.PublicGoodsAnalysis

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure InformationAsymmetryPackage where
  adverseSelection : Prop
  moralHazard : Prop
  screening : Prop
  signaling : Prop
  principalAgent : Prop

def informationAsymmetryClosed (I : InformationAsymmetryPackage) : Prop :=
  I.adverseSelection ∧ I.moralHazard ∧ I.screening ∧ I.signaling ∧ I.principalAgent

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
