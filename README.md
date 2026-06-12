# The Diophantine equation x⁴ + 2y³ + z³ = 0: reduction and partial resolution

**Greg Villines** — Villines Research LLC, Spring Branch, TX
ORCID: [0009-0002-9629-7314](https://orcid.org/0009-0002-9629-7314) · June 2026

This repository contains the complete computational record of a campaign on the equation

> **x⁴ + 2y³ + z³ = 0**  (size H = |2| + Σ|coefficients·monomial degrees| = 40),

the smallest open equation of generalized Fermat type in B. Grechuk's living tables of
solved/unsolved Diophantine equations (verified open in v7, May 2026).

**Expected theorem (conjectural pending one final computation; see Status):** the only
primitive integer solutions are

| x | y | z |
|---|---|---|
| ±1 | 0 | −1 |
| ±1 | −1 | 1 |
| ±43 | −203 | 237 |

(the last from 43⁴ + 237³ = 2·203³).

---

## 1. The reduction (unconditional)

Setting a = −z, b = −y, c = x², the equation becomes a³ + 2b³ = c², which factors over
the ring ℤ[θ], θ = ∛2 (class number 1). A complete descent on ideals, units and chart
contents reduces primitive solutions to **three parametrizing families**, of which one is
redundant, with a scaling law x²·e³ = ±C(s,t) producing **six genus-2 curves**:

| Curve | Equation | Status |
|-------|----------|--------|
| A+ | y² = x⁶ + 40x³ − 32 | **Solved.** Rank 1 < genus; classical Chabauty at p = 5 certifies C(ℚ) = {∞±, (1,±3)} → solution (±1,0,−1) plus one imprimitive point |
| A− | y² = −(x⁶ + 40x³ − 32) | **Empty.** Fake 2-Selmer set = ∅ (Bruin–Stoll TwoCoverDescent) |
| B+ | y² = C₃(x) | **Empty.** Fake 2-Selmer set = ∅ |
| B− | y² = −C₃(x) | rank 2 = genus; known points (1,±1) [unit solution], (−1,±15) [imprimitive] |
| C+ | y² = 2C₃(x) | rank 2 = genus; known points (6/5,±172/125) [43-solution], (2,±12) [imprimitive] |
| C− | y² = −2C₃(x) | **Empty.** Fake 2-Selmer set = ∅ |

where C₃(x) = 17x⁶ − 72x⁵ + 90x⁴ + 40x³ − 180x² + 144x − 40.
The Selmer computations used Magma's default (unconditional) class-group bounds.

## 2. The hard pair B−, C+ (unconditional facts)

* Quadratic twists of each other by −2; odd part of conductor = 3⁶ for both
  (2-part subject to the usual Ogg caveat at v₂(disc) = 28).
* Both have trivial torsion, Mordell–Weil rank exactly 2 (independent generators
  exhibited; regulators agree to 28 digits), trivial Ш[2].
* Both fake 2-Selmer sets are **singletons**: all rational points lie on one two-cover.
* C₃ is a norm form: N(γ(x)) = C₃(x) identically for
  γ(x) = (1+2θ)x² + (2θ²−2θ)x − (2+2θ²), giving C₃ = γ·Q over K = ℚ(∛2).
* The cover Jacobian E = Jac(w² = Q(x)) over K has **j-invariant 1728** and
  **rank exactly 3 = [K:ℚ]**; its quadratic twist by −2 has **rank 0**.

## 3. Structural discoveries (numerically certified)

* Sage `RiemannSurface` endomorphism computation at 128–400 bits:
  **End⁰(Jac(B−) ⊗ ℚ̄) ≅ M₂(ℚ(√−2))** — the Jacobian is geometrically isogenous to the
  square of an elliptic curve with CM by ℤ[√−2] (j₀ = 8000). Center minimal polynomial
  x² + 2 computed from the integral endomorphism basis (size 8 = maximum possible).
* Corroborated independently by Frobenius data at 26 primes: traces vanish at all primes
  inert in ℚ(√−2); at every split prime the charpoly factors over ℚ(√−2) with constant
  terms ±π² or ±π̄² (π the CM prime above p) — the Hecke-character signature of a
  GL₂(ℚ(√−2))-type surface.
* The endomorphism field contains a degree-24 field ⊇ ℚ(∛2, ω, √(−1−∛2));
  tangent-representation entries generate exactly two fields, of degrees 8
  (containing ℚ(√−3)) and 6 (containing ℚ(∛2)).
* Six non-hyperelliptic involutions found numerically (50-digit certification);
  G2-invariants [50000, 3750, −125] **equal** for A± and B±/C± — all six curves are
  ℚ̄-twists of the single curve y² = x⁶ + 40x³ − 32. These curves do not appear in the
  LMFDB genus-2 database (coefficient-box completeness gap; |coefficients| up to 180).

## 4. The obstruction pattern

Every classical method fails at its **exact boundary**:

| Method | Requirement | This problem |
|---|---|---|
| Classical Chabauty on B−/C+ | rank < genus = 2 | rank = 2 |
| Elliptic Chabauty over K | rank E(K) < 3 | rank = 3 |
| Elliptic Chabauty over K(√−2) | effective conditions > rank | degenerate: twist rank 0 ⇒ collapses onto K |
| Chabauty on the genus-5 two-cover | rank < 5 | rank = 2 + 3 = 5 |
| Quadratic Chabauty over ℚ (BD) | ρ(J/ℚ) ≥ 2 | ρ(J/ℚ) = 1 (J is ℚ-simple, End_ℚ = ℤ) |
| Cubic×cubic split over a quadratic field | quadratic subfield of the sextic algebra | none: Gal = 2 ≀ S₃ (order 48) |

## 5. What is certified at the endgame

Magma's `Chabauty(mw, u, 43)` (Bruin's elliptic Chabauty, executed on the Magma online
calculator V2.29-8) certifies: **every point of E(K) with rational image under the
degree-2 cover map u lies in one of 8 explicit Mordell–Weil cosets — exactly the classes
of the four known x-values {1, −1, 2, 6/5} and their w ↦ −w partners.** No exotic classes
exist at level 43. The rank = degree degeneracy leaves a one-parameter p-adic family per
coset, so single-prime (and, structurally, within-this-cover multi-prime) information does
not yield finiteness.

**Open endgame** (either suffices):
1. Quadratic Chabauty over ℚ(√−2): rank J(F) = 4 with two independent idele class
   characters and ρ(J/F) ≥ 2 via the GL₂(F)-structure — the regime of
   Balakrishnan–Besser–Bianchi–Müller (Israel J. Math. 243, 2021).
2. A refined descent using the conic factor γ jointly with the quartic cover.

## 6. Repository map

```
notes/    REDUCTION.md   -- the parametrization and curve derivation in detail
          STATUS.md      -- three-tier results ledger (proved / numerical / conjectural)
magma/    TRANSCRIPTS.md -- every online-calculator submission with verbatim output
          villines_x4_2y3_z3.m -- consolidated self-contained script
pari/     01..18_*.gp    -- structural computations (PARI/GP 2.15.4), in campaign order
sage/     *.sage         -- endomorphism certification, Coleman toolchain at p = 43,
                            log-matrix infrastructure (SageMath 10.9, conda-forge)
```

## 7. Reproducibility

* Magma computations: online calculator (magma.maths.usyd.edu.au/calc), V2.29-8,
  120 s / 50 KB limits; seeds recorded in transcripts where displayed.
* PARI/GP 2.15.4; SageMath 10.9 (conda-forge) under WSL2 Ubuntu 22.04.
* The endomorphism computations are numerically certified (residuals ≤ 10⁻¹²⁰ at 400-bit
  working precision) and corroborated by exact Euler-factor data; formal algebraic
  certification (Costa–Mascot–Sijsling–Voight / Lombardo) is future work.

## 8. Citation

Until a DOI is minted (Zenodo release pending), cite as:
G. Villines, *The Diophantine equation x⁴+2y³+z³=0: reduction and partial resolution*,
computational repository, June 2026, github.com/gvillines-hub/h40-x4-2y3-z3.

Contact: via ORCID or SSRN author page
(https://papers.ssrn.com/Sol3/Cf_Dev/AbsByAuth.cfm?per_id=7744833).
