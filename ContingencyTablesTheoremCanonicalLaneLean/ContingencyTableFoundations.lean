import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ContingencyTable where
  rows : Nat
  cols : Nat
  entries : (Fin rows) → (Fin cols) → ℕ

def rowSums (t : ContingencyTable) : Fin t.rows → ℕ := λ i =>
  Σ_{j} t.entries i j

def colSums (t : ContingencyTable) : Fin t.cols → ℕ := λ j =>
  Σ_{i} t.entries i j

def grandTotal (t : ContingencyTable) : ℕ :=
  Σ_{i,j} t.entries i j

structure ExpectedFrequency (t : ContingencyTable) where
  expected : (Fin t.rows) → (Fin t.cols) → ℝ

def chiSquaredStatistic (t : ContingencyTable) (e : ExpectedFrequency t) : ℝ :=
  Σ_{i,j} ((t.entries i j).toReal - e.expected i j)^2 / e.expected i j

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse