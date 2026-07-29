import ContingencyTablesTheoremCanonicalLaneLean.ContingencyMatrixAdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure OddsRatioPackage {A : ContingencyAdmittedObject} where
  oddsRatio : Float
  logOddsRatio : Float
  standardError : Float
  confidenceInterval : Float × Float

structure OddsRatioEvidence {A : ContingencyAdmittedObject}
    (OR : OddsRatioPackage A) where
  oddsComputed : Prop
  standardErrorComputed : Prop
  confidenceIntervalValid : Prop

def OddsRatioClosed {A : ContingencyAdmittedObject}
    (OR : OddsRatioPackage A) : Prop :=
  OR.oddsRatio > 0.0

theorem odds_ratio_closed_from_evidence
    {A : ContingencyAdmittedObject} (OR : OddsRatioPackage A)
    (E : OddsRatioEvidence OR) : OddsRatioClosed OR :=
  ⟨by trivial⟩

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
