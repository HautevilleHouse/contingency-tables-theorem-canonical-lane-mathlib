import ContingencyTablesTheoremCanonicalLaneLean.ContingencyMatrixAdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ExactTestPackage (A : ContingencyAdmittedObject) where
  allTables : List (A.categories -> A.levels -> Nat)
  moreExtreme : Prop
  pValueExact : Float
  enumerationCompleted : Prop

structure ExactTestEvidence (E : ExactTestPackage A) where
  enumerationCompletedClosed : E.enumerationCompleted
  pValueComputed : E.pValueExact ≥ 0.0

def ExactTestClosed (E : ExactTestPackage A) : Prop :=
  E.enumerationCompleted ∧ E.pValueExact ≥ 0.0

theorem exact_test_closed_from_evidence (E : ExactTestPackage A)
    (Ev : ExactTestEvidence E) : ExactTestClosed E :=
  And.intro Ev.enumerationCompletedClosed Ev.pValueComputed

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
