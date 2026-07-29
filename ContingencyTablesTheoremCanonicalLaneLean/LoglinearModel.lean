import CanonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure LoglinearModel (I J K : Type) where
  table : I → J → K → ℝ
  lam : I → ℝ
  mu : J → ℝ
  nu : K → ℝ
  interaction : I → J → K → ℝ
  fitted : I → J → K → ℝ
  saturated : Prop

structure LoglinearEvidence {I J K : Type} (M : LoglinearModel I J K) where
  fittedClosed : ∀ i j k, M.fitted i j k = Real.exp (M.lam i + M.mu j + M.nu k + M.interaction i j k)
  saturatedClosed : M.saturated ↔ ∀ i j k, M.table i j k = M.fitted i j k

def LoglinearClosed {I J K : Type} (M : LoglinearModel I J K) : Prop :=
  M.saturated

theorem loglinear_closed_from_evidence {I J K : Type} (M : LoglinearModel I J K) (E : LoglinearEvidence M) : LoglinearClosed M := by
  exact E.saturatedClosed.mpr (fun i j k => by
    calc
      M.table i j k = M.fitted i j k := sorry
      _ = Real.exp (M.lam i + M.mu j + M.nu k + M.interaction i j k) := E.fittedClosed i j k
    )

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse