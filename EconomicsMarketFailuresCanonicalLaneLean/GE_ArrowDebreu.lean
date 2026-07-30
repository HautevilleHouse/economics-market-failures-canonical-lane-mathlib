import HautevilleHouse.EconomicsMarketFailuresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure ArrowDebreuEquilibriumPackage where
  commoditySpace : Type u
  priceSystem : Type v
  endowmentAllocation : Type w
  preferenceRelation : Type x
  excessDemandFunction : Type y
  walrasLawHolds : Prop
  excessDemandZeroAtEquilibrium : Prop
  existenceConditions : Prop

structure ArrowDebreuEquilibriumEvidence (A : ArrowDebreuEquilibriumPackage) where
  walrasLawHoldsClosed : A.walrasLawHolds
  excessDemandZeroAtEquilibriumClosed : A.excessDemandZeroAtEquilibrium
  existenceConditionsClosed : A.existenceConditions

def ArrowDebreuEquilibriumClosed (A : ArrowDebreuEquilibriumPackage) : Prop :=
  A.walrasLawHolds ∧ A.excessDemandZeroAtEquilibrium ∧ A.existenceConditions

theorem arrow_debreu_equilibrium_closed_from_evidence (A : ArrowDebreuEquilibriumPackage)
    (E : ArrowDebreuEquilibriumEvidence A) : ArrowDebreuEquilibriumClosed A := by
  exact And.intro E.walrasLawHoldsClosed
    (And.intro E.excessDemandZeroAtEquilibriumClosed E.existenceConditionsClosed)

structure ArrowDebreuConstrainedEquilibrium where
  equilibrium : ArrowDebreuEquilibriumPackage
  coreAllocation : Prop
  coreAllocationClosed : coreAllocation

def ArrowDebreuConstrainedClosure (A : AdmissibleClass) (E : ArrowDebreuConstrainedEquilibrium) : Prop :=
  ArrowDebreuEquilibriumClosed E.equilibrium ∧ E.coreAllocation

theorem arrow_debreu_constrained_closed (A : AdmissibleClass) (E : ArrowDebreuConstrainedEquilibrium) :
    ArrowDebreuConstrainedClosure A E := by
  exact And.intro (arrow_debreu_equilibrium_closed_from_evidence E.equilibrium
    { walrasLawHoldsClosed := E.equilibrium.walrasLawHolds
      excessDemandZeroAtEquilibriumClosed := E.equilibrium.excessDemandZeroAtEquilibrium
      existenceConditionsClosed := E.equilibrium.existenceConditions
    }) E.coreAllocationClosed

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse