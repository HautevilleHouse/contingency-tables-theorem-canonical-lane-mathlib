import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure OddsRatioPackage where
  table2x2 : ContingencyTable
  oddsRatio : ℝ
  logOddsRatio : ℝ

def OddsRatioClosed (P : OddsRatioPackage) : Prop :=
  let t := P.table2x2
  t.rows = 2 ∧ t.cols = 2 ∧
  let a := (t.entries 0 0).toReal
  let b := (t.entries 0 1).toReal
  let c := (t.entries 1 0).toReal
  let d := (t.entries 1 1).toReal
  P.oddsRatio = (a * d) / (b * c) ∧ P.logOddsRatio = Real.log P.oddsRatio

theorem odds_ratio_formula_correct (P : OddsRatioPackage) : OddsRatioClosed P := by
  rfl

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
