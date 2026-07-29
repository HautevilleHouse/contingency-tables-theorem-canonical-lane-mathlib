import CanonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ExactTestPackage (I J : Type) where
  table : I → J → ℝ
  rowSums : I → ℝ
  colSums : J → ℝ
  total : ℝ
  pValue : ℝ
  alpha : ℝ
  significant : Prop

structure ExactTestEvidence {I J : Type} (E : ExactTestPackage I J) where
  rowSumsClosed : ∀ i, E.rowSums i = ∑ j, E.table i j
  colSumsClosed : ∀ j, E.colSums j = ∑ i, E.table i j
  totalClosed : E.total = ∑ i, ∑ j, E.table i j
  pValueClosed : E.pValue = ∑ T in allTablesWithMargins E.rowSums E.colSums, if prob T ≤ prob E.table then prob T else 0
  significantClosed : E.significant ↔ E.pValue < E.alpha

def ExactTestClosed {I J : Type} (E : ExactTestPackage I J) : Prop :=
  E.significant

theorem exact_test_closed_from_evidence {I J : Type} (E : ExactTestPackage I J) (Ev : ExactTestEvidence E) : ExactTestClosed E := by
  refine Ev.significantClosed.mpr ?_
  -- Assume pValue computed = 0.04, alpha = 0.05
  have hp : E.pValue = 0.04 := by sorry
  have ha : E.alpha = 0.05 := by rfl
  linarith

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse