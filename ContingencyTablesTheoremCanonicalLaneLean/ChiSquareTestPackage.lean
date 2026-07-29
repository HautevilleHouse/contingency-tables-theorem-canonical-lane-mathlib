import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ChiSquareTestPackage (C : ContingencyTablePackage) where
  expectedCounts : (C.rowVariable × C.columnVariable) → ℝ
  chiSquareStatistic : ℝ
  degreesFreedom : ℕ
  testResult : Prop
  evidence : testResult

define ChiSquareTestClosed {C : ContingencyTablePackage} (T : ChiSquareTestPackage C) : Prop :=
  T.testResult

theorem chi_square_test_closed_from_evidence {C : ContingencyTablePackage}
    (T : ChiSquareTestPackage C) : ChiSquareTestClosed T :=
  T.evidence

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
