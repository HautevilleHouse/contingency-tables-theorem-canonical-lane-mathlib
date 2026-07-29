import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ContingencyTable where
  rows : Nat
  cols : Nat
  entries : Matrix (Fin rows) (Fin cols) Nat

def rowSums (t : ContingencyTable) : Vector Nat t.rows :=
  Vector.ofFn (λ i => ∑ j, t.entries i j)

def colSums (t : ContingencyTable) : Vector Nat t.cols :=
  Vector.ofFn (λ j => ∑ i, t.entries i j)

def total (t : ContingencyTable) : Nat :=
  ∑ i, (rowSums t).get i

structure ContingencyTableObject where
  table : ContingencyTable
  expectedModel : Prop
  statisticType : String
  independenceTest : Prop
  conclusion : independenceTest

def ContingencyTableClosed (O : ContingencyTableObject) : Prop :=
  O.independenceTest

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
