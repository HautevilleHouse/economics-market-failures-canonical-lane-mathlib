import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.GE_GeneralEquilibriumClosure

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure GE_AdmissibleObject where
  closure : GeneralEquilibriumClosure
  bridgeSatisfied : Prop
  gateSatisfied : Prop
  conclusion : bridgeSatisfied ∧ gateSatisfied
  conclusionTerm : conclusion

def GE_AdmissibleClosure (A : AdmissibleClass) (O : GE_AdmissibleObject) : Prop :=
  GE_ConstrainedClosure O.closure ∧ O.conclusion

theorem ge_admissible_closure_from_object (A : AdmissibleClass) (O : GE_AdmissibleObject) :
    GE_AdmissibleClosure A O := by
  have hGE : GE_ConstrainedClosure O.closure :=
    ge_constrained_closure_from_evidence O.closure
  exact And.intro hGE O.conclusionTerm

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse