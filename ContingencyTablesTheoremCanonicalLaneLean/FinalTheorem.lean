import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

def ConstrainedContingencyTablesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_contingency_tables_endgame (A : AdmissibleClass) :
    ConstrainedContingencyTablesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse