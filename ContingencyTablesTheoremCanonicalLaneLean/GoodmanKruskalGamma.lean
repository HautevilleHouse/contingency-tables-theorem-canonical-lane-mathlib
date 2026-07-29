import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContingencyTablesTheoremCanonicalLaneLean

structure OrdinalContingencyTable where
  rows : Nat
  columns : Nat
  cellCounts : List (List Nat)
  concordant : Nat
  discordant : Nat
  tiesRows : Nat
  tiesColumns : Nat
  totalPairs : Nat

structure GammaCoefficient (T : OrdinalContingencyTable) where
  gamma : Rat
  gammaFormula : Prop
  asymptoticVariance : Prop

def gamma_coefficient_from_table (T : OrdinalContingencyTable) : GammaCoefficient T := by
  sorry

def OrdinalContingencyTableClosed (T : OrdinalContingencyTable) : Prop :=
  T.concordant + T.discordant + T.tiesRows + T.tiesColumns = T.totalPairs

end ContingencyTablesTheoremCanonicalLaneLean
end HautevilleHouse