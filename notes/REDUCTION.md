# The reduction of x⁴ + 2y³ + z³ = 0 to six genus-2 curves

## 1. Setup

Primitive integer solutions (x, y, z), gcd = 1. Substituting a = −z, b = −y, c = x²
gives a³ + 2b³ = c² with c a perfect square at the end. Work in K = ℚ(θ), θ = ∛2,
ring of integers ℤ[θ], class number 1, fundamental unit ε = θ − 1 (norm 1, ε⁻¹ = θ² + θ + 1).

a³ + 2b³ = N(a + bθ) · (the conic cofactor) factors as
a³ + 2b³ = (a + bθ)(a² − abθ + b²θ²).

## 2. Ideal arithmetic

gcd of the two factors divides 3θ² (the different is (3θ²) up to units; ramified data:
2 = θ³ totally ramified, 3 = (θ + 1)³ totally ramified with uniformizer λ = θ + 1).
Standard descent: (a + bθ) = δ · ξ² · (unit) with δ running over divisors of 3θ² modulo
squares, intersected with local conditions at 2 and 3 and the unit group modulo squares
{1, ε} (norm considerations remove the sign ambiguity). Case analysis on
v_θ(a + bθ) ∈ {0, 1} and v_λ ∈ {0, 1} leaves the families enumerated in
`pari/01_parametrization_families.gp`; after absorbing units and removing the family
mapped to another by the action of ε, **two essential families** survive, each of the
shape

  a + bθ = (s + tθ + uθ²)² · δ,   δ ∈ {δ₁, δ₂},

with the auxiliary coordinate u eliminated by the linear condition coming from the
θ²-coefficient. Writing the resulting binary forms: the c-side factors correspondingly,
and the condition "c is a square" (c = x²) yields x² e³-type scaling equations whose
projective normalizations are the **six curves**

  y² = ± C₂(x),  y² = ± C₃(x),  y² = ± 2C₃(x)

with C₂ = x⁶ + 40x³ − 32 and C₃ = 17x⁶ − 72x⁵ + 90x⁴ + 40x³ − 180x² + 144x − 40.
(Signs/twists track the unit and the square class of the leading data; the ±2 pair
arises from the θ-adic chart.) Local solubility (`pari/04_local_solubility.gp`)
eliminates nothing further: exactly the six listed curves are everywhere locally soluble
or die by the global Selmer computation.

## 3. Known points and their preimages

* (±1, 0, −1): the unit solution 1·a³-side — lands on B− at (1, ±1) and on A+ at ∞±.
* (±1, −1, 1): lands on A+ at (1, ±3).
* (±43, −203, 237): 43⁴ + 237³ = 2·203³ — lands on C+ at (6/5, ±172/125).
* The points (−1, ±15) on B− and (2, ±12) on C+ are **imprimitive** (they violate the
  gcd normalization chain and produce no new primitive solutions; verified by direct
  back-substitution in `pari/03_scaling_and_charts.gp`).

## 4. The norm-form structure of C₃

C₃ is a norm form for K/ℚ: with γ(x) = (1+2θ)x² + (2θ²−2θ)x − (2+2θ²),
N_{K/ℚ}(γ(x)) = C₃(x) identically (`pari/05_norm_form_verification.gp`). Hence over K,
C₃ = γ · Q with Q quartic, and a rational point on B− or C+ gives a K-point on a curve
w² = d·Q(x) for d in a computable finite set; the singleton fake 2-Selmer sets collapse
this to the **single cover** D: w² = Q(x) (after absorbing squares; the values
Q(1) = 1, Q(2) = 36/(1+θ)², Q(6/5) = ((2θ²−18θ−10)/25)² witness the known points on D).
Jac(D) = E with j = 1728, rank E(K) = 3.

## 5. Status of the final step

See README §5. The certified 8-coset result at p = 43 plus the rank = degree
obstruction analysis. The full ledger is in `notes/STATUS.md`.
