import ContingencyTablesTheoremCanonicalLaneLean.GoodnessOfFit

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure CramersVPackage (T : ContingencyTable) where
  chiSquared : ℝ
  n : ℕ
  k : ℕ
  r : ℕ
  value : ℝ

structure CramersVEvidence {T : ContingencyTable}
  (C : CramersVPackage T) where
  chiSquaredComputed : C.chiSquared = chiSquaredStatistic T (independenceExpected T)
  nCorrect : C.n = grandTotal T
  kCorrect : C.k = min T.rows T.cols
  rCorrect : C.r = (kCorrect - 1) -- r = k - 1 but careful
  valueComputed : C.value = C.chiSquared / (C.n.toReal * (min C.k C.r).toReal)

def CramersVClosed {T : ContingencyTable}
  (C : CramersVPackage T) : Prop :=
  C.chiSquared = chiSquaredStatistic T (independenceExpected T) ∧
  C.n = grandTotal T ∧
  C.k = min T.rows T.cols ∧
  C.r = (C.k - 1) ∧
  C.value = C.chiSquared / (C.n.toReal * (min C.k C.r).toReal)

theorem cramers_v_closed_from_evidence {T : ContingencyTable}
  (C : CramersVPackage T) (E : CramersVEvidence C) :
  CramersVClosed C :=
by
  exact And.intro E.chiSquaredComputed
    (And.intro E.nCorrect
      (And.intro E.kCorrect
        (And.intro E.rCorrect E.valueComputed)))

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse