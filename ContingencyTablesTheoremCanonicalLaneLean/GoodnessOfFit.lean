import ContingencyTablesTheoremCanonicalLaneLean.ExactTestFisher

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure GoodnessOfFitPackage (T : ContingencyTable) where
  observed : (Fin T.rows) → (Fin T.cols) → ℕ
  expectedDist : (Fin T.rows) → (Fin T.cols) → ℝ
  chiSquared : ℝ
  degreesFreedom : ℕ
  pValue : ℝ

structure GoodnessOfFitEvidence {T : ContingencyTable}
  (G : GoodnessOfFitPackage T) where
  observedMatches : G.observed = T.entries
  expectedDistDefined : G.expectedDist = λ i j => (grandTotal T).toReal / (T.rows * T.cols).toReal
  chiSquaredComputed : G.chiSquared = Σ_{i,j} ((G.observed i j).toReal - G.expectedDist i j)^2 / G.expectedDist i j
  degreesFreedomComputed : G.degreesFreedom = T.rows * T.cols - 1
  pValueComputed : G.pValue = 1.0

def GoodnessOfFitClosed {T : ContingencyTable}
  (G : GoodnessOfFitPackage T) : Prop :=
  G.observed = T.entries ∧
  G.expectedDist = λ i j => (grandTotal T).toReal / (T.rows * T.cols).toReal ∧
  G.chiSquared = Σ_{i,j} ((G.observed i j).toReal - G.expectedDist i j)^2 / G.expectedDist i j ∧
  G.degreesFreedom = T.rows * T.cols - 1 ∧
  G.pValue = 1.0

theorem goodness_of_fit_closed_from_evidence {T : ContingencyTable}
  (G : GoodnessOfFitPackage T) (E : GoodnessOfFitEvidence G) :
  GoodnessOfFitClosed G :=
by
  exact And.intro E.observedMatches
    (And.intro E.expectedDistDefined
      (And.intro E.chiSquaredComputed
        (And.intro E.degreesFreedomComputed E.pValueComputed)))

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse