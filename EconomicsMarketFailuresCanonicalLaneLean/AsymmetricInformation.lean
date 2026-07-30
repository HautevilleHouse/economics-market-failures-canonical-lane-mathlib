import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure AdverseSelection where
  sellerType : Type u
  buyerType : Type v
  quality : sellerType → Nat
  price : Nat
  lemonsProblem : Prop
  marketFailure : Prop

structure MoralHazard where
  principal : Type u
  agent : Type v
  effort : agent → Nat
  contract : Type w
  incentiveCompatibility : Prop
  participationConstraint : Prop
  optimalContract : (agent → Nat) → Prop

structure Screening (A : AdverseSelection) where
  signaling : A.sellerType → Bool
  separatingEquilibrium : Prop
  reducingInefficiency : Prop

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse