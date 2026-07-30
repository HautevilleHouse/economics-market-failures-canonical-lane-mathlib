import canonicalLaneMathlib.FinalTheorem

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

def ConstrainedMarketFailuresClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_market_failures_endgame (A : AdmissibleClass) :
    ConstrainedMarketFailuresClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse
