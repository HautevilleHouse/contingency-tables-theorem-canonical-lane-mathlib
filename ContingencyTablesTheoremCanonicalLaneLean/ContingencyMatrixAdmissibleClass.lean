import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ContingencyAdmittedObject where
  categories : Type
  levels : Type
  contingencyMatrix : categories -> levels -> Nat
  rowNames : List categories
  colNames : List levels
  cellCounts : List (Nat)
  totalCount : Nat
  conclusion : Prop

def ContingencyWitnessClosed (O : ContingencyAdmittedObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : ContingencyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ContingencyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
