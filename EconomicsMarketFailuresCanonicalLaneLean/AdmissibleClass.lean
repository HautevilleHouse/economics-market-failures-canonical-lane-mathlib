import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure MarketAdmittedObject where
  economy : Type u
  agents : Nat
  goods : Nat
  initialEndowments : economy → List ℚ
  preferencesComplete : Prop
  rationality : Prop
  walrasLawSatisfied : Prop
  conclusion : preferencesComplete ∧ rationality ∧ walrasLawSatisfied

structure AdmissibleClass where
  object : MarketAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
