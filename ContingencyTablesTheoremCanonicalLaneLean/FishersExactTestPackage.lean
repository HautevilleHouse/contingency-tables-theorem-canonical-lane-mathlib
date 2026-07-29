import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure FishersExactTestPackage (C : ContingencyTablePackage) where
  hypergeometricProb : ℝ
  pValue : ℝ
  significanceLevel : ℝ
  testResult : Prop
  evidence : testResult

define FishersExactTestClosed {C : ContingencyTablePackage} (F : FishersExactTestPackage C) : Prop :=
  F.testResult

theorem fishers_exact_test_closed_from_evidence {C : ContingencyTablePackage}
    (F : FishersExactTestPackage C) : FishersExactTestClosed F :=
  F.evidence

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
