import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure IndependenceTestPackage (t : ContingencyTable) where
  nullHypothesis : Prop
  observedStatistic : ℝ
  pValue : ℝ
  rejectionRegion : ℝ → Prop

def IndependenceTestClosed (t : ContingencyTable) (P : IndependenceTestPackage t) : Prop :=
  P.nullHypothesis ∧ (P.pValue < 0.05 → P.rejectionRegion P.observedStatistic)

theorem independence_test_closed (t : ContingencyTable) (P : IndependenceTestPackage t) (h : P.nullHypothesis) : IndependenceTestClosed t P := by
  exact And.intro h (λ hp => by
    have : P.pValue < 0.05 := hp
    exact h
  )

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
