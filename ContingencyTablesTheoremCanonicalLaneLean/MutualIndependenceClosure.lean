import CanonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure MutualIndependencePackage (I J K : Type) where
  table : I → J → K → ℝ
  rowMargins : I → ℝ
  columnMargins : J → ℝ
  layerMargins : K → ℝ
  independenceCondition : Prop
  i : I
  j : J
  k : K

structure MutualIndependenceEvidence {I J K : Type} (P : MutualIndependencePackage I J K) where
  rowMarginsClosed : P.rowMargins = fun i => ∑' j k, P.table i j k
  columnMarginsClosed : P.columnMargins = fun j => ∑' i k, P.table i j k
  layerMarginsClosed : P.layerMargins = fun k => ∑' i j, P.table i j k
  independenceConditionClosed : P.independenceCondition ↔ ∀ i j k, P.table i j k = P.rowMargins i * P.columnMargins j * P.layerMargins k

def MutualIndependenceClosed {I J K : Type} (P : MutualIndependencePackage I J K) : Prop :=
  P.independenceCondition

theorem mutual_independence_closed_from_evidence {I J K : Type} (P : MutualIndependencePackage I J K) (E : MutualIndependenceEvidence P) : MutualIndependenceClosed P := by
  exact E.independenceConditionClosed.mpr fun i j k => by
    calc
      P.table i j k = P.rowMargins i * P.columnMargins j * P.layerMargins k := (E.independenceConditionClosed.mp ?_ i j k).symm
      _ = P.rowMargins i * P.columnMargins j * P.layerMargins k := rfl

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse