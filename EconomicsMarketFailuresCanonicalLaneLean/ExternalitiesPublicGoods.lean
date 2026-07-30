import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsMarketFailuresCanonicalLaneLean

structure ExternalitiesPublicGoodsPackage where
  externalityType : Type
  publicGoodProvision : Prop
  marketProvisionInefficient : Prop
  governmentInterventionOptimal : Prop

structure ExternalitiesPublicGoodsEvidence (E : ExternalitiesPublicGoodsPackage) where
  marketProvisionInefficientClosed : E.marketProvisionInefficient
  governmentInterventionOptimalClosed : E.governmentInterventionOptimal

def ExternalitiesPublicGoodsClosed (E : ExternalitiesPublicGoodsPackage) : Prop :=
  E.marketProvisionInefficient ∧ E.governmentInterventionOptimal

theorem externalities_public_goods_closed_from_evidence
    (E : ExternalitiesPublicGoodsPackage)
    (Ev : ExternalitiesPublicGoodsEvidence E) : ExternalitiesPublicGoodsClosed E := by
  exact And.intro Ev.marketProvisionInefficientClosed Ev.governmentInterventionOptimalClosed

end EconomicsMarketFailuresCanonicalLaneLean
end HautevilleHouse