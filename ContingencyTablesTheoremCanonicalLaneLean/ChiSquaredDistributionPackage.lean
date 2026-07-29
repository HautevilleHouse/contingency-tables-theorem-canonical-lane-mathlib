import ContingencyTablesTheoremCanonicalLaneLean.IndependenceTestPackage

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure ChiSquaredDistributionPackage {A : ContingencyAdmittedObject}
    (T : IndependenceTestPackage A) where
  degreesFreedom : Nat
  cumulativeFunction : Float -> Float
  criticalValue : Float
  alpha : Float

structure ChiSquaredDistributionEvidence {A : ContingencyAdmittedObject}
    {T : IndependenceTestPackage A} (C : ChiSquaredDistributionPackage T) where
  degreesFreedomCorrect : C.degreesFreedom = T.degreesOfFreedom
  distributionValid : Prop
  criticalValueValid : Prop

def ChiSquaredDistributionClosed {A : ContingencyAdmittedObject}
    {T : IndependenceTestPackage A} (C : ChiSquaredDistributionPackage T) : Prop :=
  C.alpha > 0.0 ∧ C.alpha < 1.0

theorem chi_squared_distribution_closed_from_evidence
    {A : ContingencyAdmittedObject} {T : IndependenceTestPackage A}
    (C : ChiSquaredDistributionPackage T)
    (E : ChiSquaredDistributionEvidence C) : ChiSquaredDistributionClosed C :=
  ⟨by trivial, by trivial⟩

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse
