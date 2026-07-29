import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure MeasureOfAssociationPackage (C : ContingencyTablePackage) where
  cramersV : ℝ
  phiCoefficient : ℝ
  contingencyCoefficient : ℝ
  associationResult : Prop
  evidence : associationResult

define AssociationMeasureClosed {C : ContingencyTablePackage} (M : MeasureOfAssociationPackage C) : Prop :=
  M.associationResult

theorem association_measure_closed_from_evidence {C : ContingencyTablePackage}
    (M : MeasureOfAssociationPackage C) : AssociationMeasureClosed M :=
  M.evidence

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
