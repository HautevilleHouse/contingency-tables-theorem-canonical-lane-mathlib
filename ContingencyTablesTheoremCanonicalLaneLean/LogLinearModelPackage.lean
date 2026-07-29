import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure LogLinearModelPackage (C : ContingencyTablePackage) where
  saturatedModel : Prop
  hierarchicalModel : Prop
  devianceStatistic : ℝ
  modelSelectionResult : Prop
  evidence : modelSelectionResult

define LogLinearModelClosed {C : ContingencyTablePackage} (L : LogLinearModelPackage C) : Prop :=
  L.modelSelectionResult

theorem log_linear_model_closed_from_evidence {C : ContingencyTablePackage}
    (L : LogLinearModelPackage C) : LogLinearModelClosed L :=
  L.evidence

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
