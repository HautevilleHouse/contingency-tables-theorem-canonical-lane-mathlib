import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Statistics.ChiSquared

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

def chiSquaredStatistic (t : ContingencyTable) : ℝ :=
  let n := total t
  (∑ i, ∑ j, ((t.entries i j).toReal - ((rowSums t).get i).toReal * ((colSums t).get j).toReal / n.toReal)^2 / (((rowSums t).get i).toReal * ((colSums t).get j).toReal / n.toReal))

theorem chiSquaredApproximation (t : ContingencyTable) :
  ChiSquared.approximates (chiSquaredStatistic t) ((t.rows - 1) * (t.cols - 1)) := by
  sorry

def contingencyIndependenceTest (t : ContingencyTable) (alpha : ℝ) : Prop :=
  ChiSquared.survivalFunction (chiSquaredStatistic t) ((t.rows - 1) * (t.cols - 1)) > alpha

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
