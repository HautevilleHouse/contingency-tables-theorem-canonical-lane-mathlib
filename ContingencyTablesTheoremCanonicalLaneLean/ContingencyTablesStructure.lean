import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ContingencyTable where
  rows : Nat
  columns : Nat
  cellCounts : List (List Nat)
  rowSums : List Nat
  columnSums : List Nat
  totalCount : Nat
  rowSumsConsistent : Prop
  columnSumsConsistent : Prop
  totalConsistent : Prop

structure IndependenceCondition (T : ContingencyTable) where
  expectedFrequencies : List (List Nat)
  observedEqualsExpected : Prop
  chiSquaredStatistic : Nat
  degreesOfFreedom : Prop

def independence_condition_from_table (T : ContingencyTable) : IndependenceCondition T := by
  sorry

def ContingencyTableClosed (T : ContingencyTable) : Prop :=
  T.rowSumsConsistent ∧ T.columnSumsConsistent ∧ T.totalConsistent

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse