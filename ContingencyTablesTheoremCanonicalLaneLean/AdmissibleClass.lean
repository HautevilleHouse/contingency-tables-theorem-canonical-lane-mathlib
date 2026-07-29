import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : ContingencyTableObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ContingencyTableClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
