import CanonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure OddsRatioPackage (I J : Type) where
  table : I → J → ℝ
  i1 i2 : I
  j1 j2 : J
  oddsRatio : ℝ
  logOddsRatio : ℝ
  bounded : Prop
  confidenceInterval : ℝ × ℝ

structure OddsRatioEvidence {I J : Type} (O : OddsRatioPackage I J) where
  oddsRatioClosed : O.oddsRatio = (O.table O.i1 O.j1 * O.table O.i2 O.j2) / (O.table O.i1 O.j2 * O.table O.i2 O.j1)
  logOddsRatioClosed : O.logOddsRatio = Real.log O.oddsRatio
  boundedClosed : O.bounded ↔ (O.oddsRatio < ∞ ∧ O.oddsRatio > 0)
  confidenceIntervalClosed : O.confidenceInterval = (Real.exp (O.logOddsRatio - 1.96 * 1), Real.exp (O.logOddsRatio + 1.96 * 1))

def OddsRatioClosed {I J : Type} (O : OddsRatioPackage I J) : Prop :=
  O.bounded

theorem odds_ratio_closed_from_evidence {I J : Type} (O : OddsRatioPackage I J) (E : OddsRatioEvidence O) : OddsRatioClosed O := by
  exact E.boundedClosed.mpr ⟨by positivity, by positivity⟩

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse