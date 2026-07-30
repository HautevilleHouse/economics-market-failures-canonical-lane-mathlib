import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EconomicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EconomicsAdmittedObject where
  space : EconomicsSpace
  closedEconomy : Prop
  completeMarkets : Prop
  equilibriumModel : Type
  equilibriumTopology : TopologicalSpace equilibriumModel
  equilibriumExists : Prop
  conclusion : equilibriumExists

structure EconomicsEndgameState where
  object : EconomicsAdmittedObject

def EconomicsWitnessClosed (O : EconomicsAdmittedObject) : Prop :=
  O.equilibriumExists

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
