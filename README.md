# The Diophantine equation xâ´ + 2yÂ³ + zÂ³ = 0: reduction and partial resolution

**Greg Villines** â€” Villines Research LLC, Spring Branch, TX
ORCID: [0009-0002-9629-7314](https://orcid.org/0009-0002-9629-7314) Â· June 2026

This repository contains the complete computational record of a campaign on the equation

> **xâ´ + 2yÂ³ + zÂ³ = 0**  (size H = |2| + Î£|coefficientsÂ·monomial degrees| = 40),

the smallest open equation of generalized Fermat type in B. Grechuk's living tables of
solved/unsolved Diophantine equations (verified open in v7, May 2026).

**Expected theorem (conjectural pending one final computation; see Status):** the only
primitive integer solutions are

| x | y | z |
|---|---|---|
| Â±1 | 0 | âˆ’1 |
| Â±1 | âˆ’1 | 1 |
| Â±43 | âˆ’203 | 237 |

(the last from 43â´ + 237Â³ = 2Â·203Â³).

---

## 1. The reduction (unconditional)

Setting a = âˆ’z, b = âˆ’y, c = xÂ², the equation becomes aÂ³ + 2bÂ³ = cÂ², which factors over
the ring â„¤[Î¸], Î¸ = âˆ›2 (class number 1). A complete descent on ideals, units and chart
contents reduces primitive solutions to **three parametrizing families**, of which one is
redundant, with a scaling law xÂ²Â·eÂ³ = Â±C(s,t) producing **six genus-2 curves**:

| Curve | Equation | Status |
|-------|----------|--------|
| A+ | yÂ² = xâ¶ + 40xÂ³ âˆ’ 32 | **Solved.** Rank 1 < genus; classical Chabauty at p = 5 certifies C(â„š) = {âˆžÂ±, (1,Â±3)} â†’ solution (Â±1,0,âˆ’1) plus one imprimitive point |
| Aâˆ’ | yÂ² = âˆ’(xâ¶ + 40xÂ³ âˆ’ 32) | **Empty.** Fake 2-Selmer set = âˆ… (Bruinâ€“Stoll TwoCoverDescent) |
| B+ | yÂ² = Câ‚ƒ(x) | **Empty.** Fake 2-Selmer set = âˆ… |
| Bâˆ’ | yÂ² = âˆ’Câ‚ƒ(x) | rank 2 = genus; known points (1,Â±1) [unit solution], (âˆ’1,Â±15) [imprimitive] |
| C+ | yÂ² = 2Câ‚ƒ(x) | rank 2 = genus; known points (6/5,Â±172/125) [43-solution], (2,Â±12) [imprimitive] |
| Câˆ’ | yÂ² = âˆ’2Câ‚ƒ(x) | **Empty.** Fake 2-Selmer set = âˆ… |

where Câ‚ƒ(x) = 17xâ¶ âˆ’ 72xâµ + 90xâ´ + 40xÂ³ âˆ’ 180xÂ² + 144x âˆ’ 40.
The Selmer computations used Magma's default (unconditional) class-group bounds.

## 2. The hard pair Bâˆ’, C+ (unconditional facts)

* Quadratic twists of each other by âˆ’2; odd part of conductor = 3â¶ for both
  (2-part subject to the usual Ogg caveat at vâ‚‚(disc) = 28).
* Both have trivial torsion, Mordellâ€“Weil rank exactly 2 (independent generators
  exhibited; regulators agree to 28 digits), trivial Ð¨[2].
* Both fake 2-Selmer sets are **singletons**: all rational points lie on one two-cover.
* Câ‚ƒ is a norm form: N(Î³(x)) = Câ‚ƒ(x) identically for
  Î³(x) = (1+2Î¸)xÂ² + (2Î¸Â²âˆ’2Î¸)x âˆ’ (2+2Î¸Â²), giving Câ‚ƒ = Î³Â·Q over K = â„š(âˆ›2).
* The cover Jacobian E = Jac(wÂ² = Q(x)) over K has **j-invariant 1728** and
  **rank exactly 3 = [K:â„š]**; its quadratic twist by âˆ’2 has **rank 0**.

## 3. Structural discoveries (numerically certified)

* Sage `RiemannSurface` endomorphism computation at 128â€“400 bits:
  **Endâ°(Jac(Bâˆ’) âŠ— â„šÌ„) â‰… Mâ‚‚(â„š(âˆšâˆ’2))** â€” the Jacobian is geometrically isogenous to the
  square of an elliptic curve with CM by â„¤[âˆšâˆ’2] (jâ‚€ = 8000). Center minimal polynomial
  xÂ² + 2 computed from the integral endomorphism basis (size 8 = maximum possible).
* Corroborated independently by Frobenius data at 26 primes: traces vanish at all primes
  inert in â„š(âˆšâˆ’2); at every split prime the charpoly factors over â„š(âˆšâˆ’2) with constant
  terms Â±Ï€Â² or Â±Ï€Ì„Â² (Ï€ the CM prime above p) â€” the Hecke-character signature of a
  GLâ‚‚(â„š(âˆšâˆ’2))-type surface.
* The endomorphism field contains a degree-24 field âŠ‡ â„š(âˆ›2, Ï‰, âˆš(âˆ’1âˆ’âˆ›2));
  tangent-representation entries generate exactly two fields, of degrees 8
  (containing â„š(âˆšâˆ’3)) and 6 (containing â„š(âˆ›2)).
* Six non-hyperelliptic involutions found numerically (50-digit certification);
  G2-invariants [50000, 3750, âˆ’125] **equal** for AÂ± and BÂ±/CÂ± â€” all six curves are
  â„šÌ„-twists of the single curve yÂ² = xâ¶ + 40xÂ³ âˆ’ 32. These curves do not appear in the
  LMFDB genus-2 database (coefficient-box completeness gap; |coefficients| up to 180).

## 4. The obstruction pattern

Every classical method fails at its **exact boundary**:

| Method | Requirement | This problem |
|---|---|---|
| Classical Chabauty on Bâˆ’/C+ | rank < genus = 2 | rank = 2 |
| Elliptic Chabauty over K | rank E(K) < 3 | rank = 3 |
| Elliptic Chabauty over K(âˆšâˆ’2) | effective conditions > rank | degenerate: twist rank 0 â‡’ collapses onto K |
| Chabauty on the genus-5 two-cover | rank < 5 | rank = 2 + 3 = 5 |
| Quadratic Chabauty over â„š (BD) | Ï(J/â„š) â‰¥ 2 | Ï(J/â„š) = 1 (J is â„š-simple, End_â„š = â„¤) |
| CubicÃ—cubic split over a quadratic field | quadratic subfield of the sextic algebra | none: Gal = 2 â‰€ Sâ‚ƒ (order 48) |

## 5. What is certified at the endgame

Magma's `Chabauty(mw, u, 43)` (Bruin's elliptic Chabauty, executed on the Magma online
calculator V2.29-8) certifies: **every point of E(K) with rational image under the
degree-2 cover map u lies in one of 8 explicit Mordellâ€“Weil cosets â€” exactly the classes
of the four known x-values {1, âˆ’1, 2, 6/5} and their w â†¦ âˆ’w partners.** No exotic classes
exist at level 43. The rank = degree degeneracy leaves a one-parameter p-adic family per
coset, so single-prime (and, structurally, within-this-cover multi-prime) information does
not yield finiteness.

**Open endgame** (either suffices):
1. Quadratic Chabauty over â„š(âˆšâˆ’2): rank J(F) = 4 with two independent idele class
   characters and Ï(J/F) â‰¥ 2 via the GLâ‚‚(F)-structure â€” the regime of
   Balakrishnanâ€“Besserâ€“Bianchiâ€“MÃ¼ller (Israel J. Math. 243, 2021).
2. A refined descent using the conic factor Î³ jointly with the quartic cover.

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
* The endomorphism computations are numerically certified (residuals â‰¤ 10â»Â¹Â²â° at 400-bit
  working precision) and corroborated by exact Euler-factor data; formal algebraic
  certification (Costaâ€“Mascotâ€“Sijslingâ€“Voight / Lombardo) is future work.

## 8. Citation

DOI (v1.0 archival snapshot): https://doi.org/10.5281/zenodo.20672504

Cite as:
G. Villines, *The Diophantine equation xâ´+2yÂ³+zÂ³=0: reduction and partial resolution*,
computational repository, v1.0, June 2026. Zenodo: doi:10.5281/zenodo.20672504. GitHub: github.com/gvillines-hub/h40-x4-2y3-z3.

Contact: via ORCID or SSRN author page
(https://papers.ssrn.com/Sol3/Cf_Dev/AbsByAuth.cfm?per_id=7744833).

