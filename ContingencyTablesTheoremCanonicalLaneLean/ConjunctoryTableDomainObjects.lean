import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ContingencyTablePackage where
  rowVariable : Type u
  columnVariable : Type v
  jointDistribution : (rowVariable × columnVariable) → ℝ
  rowMarginal : rowVariable → ℝ
  columnMarginal : columnVariable → ℝ
  totalCount : ℝ
  rowCounts : rowVariable → ℕ
  columnCounts : columnVariable → ℕ
  jointCounts : (rowVariable × columnVariable) → ℕ

define independenceCondition (C : ContingencyTablePackage) : Prop :=
  ∀ (i : C.rowVariable) (j : C.columnVariable),
    C.jointDistribution (i, j) = C.rowMarginal i * C.columnMarginal j

structure AdmittedContingencyTableObject where
  table : ContingencyTablePackage
  independenceTest : Prop
  testStatistic : ℝ
  tableClosed : Prop
  conclusion : tableClosed

define ContingencyTablesWitnessClosed (O : AdmittedContingencyTableObject) : Prop :=
  O.tableClosed

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
