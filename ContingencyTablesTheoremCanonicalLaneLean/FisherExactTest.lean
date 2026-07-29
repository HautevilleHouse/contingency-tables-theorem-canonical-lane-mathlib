import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure TwoByTwoTable where
  a : Nat
  b : Nat
  c : Nat
  d : Nat
  row1Total : Nat
  row2Total : Nat
  col1Total : Nat
  col2Total : Nat
  grandTotal : Nat
  rowTotalsConsistent : Prop
  colTotalsConsistent : Prop
  grandTotalConsistent : Prop

structure FisherExact (T : TwoByTwoTable) where
  pValue : Rat
  hypergeometricProbability : Prop
  moreExtremeTables : List TwoByTwoTable
  significanceLevel : Prop

def fisher_exact_from_table (T : TwoByTwoTable) : FisherExact T := by
  sorry

def TwoByTwoTableClosed (T : TwoByTwoTable) : Prop :=
  T.rowTotalsConsistent ∧ T.colTotalsConsistent ∧ T.grandTotalConsistent

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse