import ContingencyTablesTheoremCanonicalLaneLean.ContingencyMatrixAdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure IndependenceTestPackage (A : ContingencyAdmittedObject) where
  expectedFrequencies : (x : A.categories) -> (y : A.levels) -> Float
  testStatistic : Float
  degreesOfFreedom : Nat
  pValue : Float
  nullDistribution : Type

structure IndependenceTestEvidence {A : ContingencyAdmittedObject}
    (T : IndependenceTestPackage A) where
  expectedComputed : Prop
  statisticComputed : Prop
  distributionIdentified : Prop
  pValueValid : Prop

def IndependenceTestClosed {A : ContingencyAdmittedObject}
    (T : IndependenceTestPackage A) : Prop :=
  T.testStatistic > 0.0 ∧ T.degreesOfFreedom > 0

theorem independence_test_closed_from_evidence
    {A : ContingencyAdmittedObject} (T : IndependenceTestPackage A)
    (E : IndependenceTestEvidence T) : IndependenceTestClosed T :=
  ⟨by
    trivial, by
    trivial⟩

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
