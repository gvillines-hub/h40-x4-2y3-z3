# Magma online-calculator transcripts

All runs executed on magma.maths.usyd.edu.au/calc, Magma V2.29-8 (120 s / 50 KB limits),
June 12, 2026. Code and output transcribed verbatim from the calculator; original
screenshots archived by the author and available on request. Seeds shown where the
calculator displayed them.

---

## Run 1 — rank bounds for the three locally soluble curves

```
P<x> := PolynomialRing(Rationals());
C2pol := x^6 + 40*x^3 - 32;
C3pol := 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
"A+ rank bounds:", RankBounds(Jacobian(HyperellipticCurve(C2pol)));
"B- rank bounds:", RankBounds(Jacobian(HyperellipticCurve(-C3pol)));
"C+ rank bounds:", RankBounds(Jacobian(HyperellipticCurve(2*C3pol)));
```
Output (Seed 745161441; 7.200 s):
```
A+ rank bounds: 1 1
B- rank bounds: 0 2
C+ rank bounds: 0 2
```

## Run 2 — empty fake 2-Selmer sets: A−, B+, C− have no rational points

```
P<x> := PolynomialRing(Rationals());
C2pol := x^6 + 40*x^3 - 32;
C3pol := 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
selA := TwoCoverDescent(HyperellipticCurve(-C2pol)); "A- fake 2-Selmer size:", #selA;
selB := TwoCoverDescent(HyperellipticCurve(C3pol));  "B+ fake 2-Selmer size:", #selB;
selC := TwoCoverDescent(HyperellipticCurve(-2*C3pol)); "C- fake 2-Selmer size:", #selC;
```
Output (Seed 610421318; 1.980 s):
```
A- fake 2-Selmer size: 0
B+ fake 2-Selmer size: 0
C- fake 2-Selmer size: 0
```
Re-run later in the session (Seed 38016996; 1.980 s) gave identical sizes 0, 0, 0.
Magma's default class-group proof level (unconditional) was in effect; an attempted
`SetClassGroupBounds("Minkowski")` was rejected ("must be an integer, or the string
GRH"), confirming GRH was never enabled.

## Run 3 — small Jacobian points (search bound 500)

```
"A+ J-points:", Points(Jacobian(HyperellipticCurve(C2pol))  : Bound := 500);
"B- J-points:", Points(Jacobian(HyperellipticCurve(-C3pol)) : Bound := 500);
"C+ J-points:", Points(Jacobian(HyperellipticCurve(2*C3pol)): Bound := 500);
```
Output (Seed 930175911; 1.240 s): 17 / 13 / 13 points respectively (full lists in
screenshots; representative generators extracted in Run 5).

## Run 4 — classical Chabauty closes A+ completely

```
CA := HyperellipticCurve(x^6 + 40*x^3 - 32);
ptsA := Points(CA : Bound := 1000);
[loop: find infinite-order difference of points, run Chabauty]
```
Output (Seed 3751391318; 0.620 s; trailing paste-artifact syntax error after the result):
```
A+ curve points: {@ (1 : -1 : 0), (1 : 1 : 0), (1 : -3 : 1), (1 : 3 : 1) @}
generator from point pair 1 3
A+ complete point set: { (1 : -3 : 1), (1 : 3 : 1), (1 : -1 : 0), (1 : 1 : 0) }
Chabauty N: { 5 }
```
Hence C_{A+}(ℚ) = {∞±, (1, ±3)} certified at N = 5.

## Run 5 — B− and C+ have rank exactly 2, trivial torsion, equal regulators

```
[TorsionSubgroup, Points(Bound:=1000), Order, HeightPairingMatrix on both curves]
```
Output (Seed 3651122871; 0.530 s):
```
B- torsion: Abelian Group of order 1
B- pts: {@ (-1 : -15 : 1), (-1 : 15 : 1), (1 : -1 : 1), (1 : 1 : 1) @}
orders: 0 0
B- pairing det: 3.00510743522906671920155153376 93
C+ torsion: Abelian Group of order 1
C+ pts: {@ (2 : -12 : 1), (2 : 12 : 1), (6 : -172 : 5), (6 : 172 : 5) @}
orders: 0 0
C+ pairing det: 3.00510743522906671920155153376 98
```

## Run 6 — B− and C+ are not isomorphic over ℚ (they are twists by −2)

```
iso := IsIsomorphic(HyperellipticCurve(-C3pol), HyperellipticCurve(2*C3pol));
```
Output (Seed 2227366559; 0.150 s): `isomorphic: false`

## Run 7 — B− fake 2-Selmer set is a singleton

```
selB, mB := TwoCoverDescent(HyperellipticCurve(-C3pol));
"B- fake 2-Selmer set:", selB; "algebra:", Domain(mB);
```
Output (Seed 3069237830; 0.950 s):
```
B- fake 2-Selmer set: { $.3 + $.4 }
algebra: Univariate Quotient Polynomial Algebra in theta over Rational Field
with modulus theta^6 - 72/17 theta^5 + ... - 40/17
```

## Run 8 — factorization over K = ℚ(∛2), square classes, C+ Selmer singleton

```
K<th> := NumberField(x^3-2);
g := (1+2*th)*X^2 + (2*th^2-2*th)*X - (2+2*th^2);
[divisibility, quartic Q, values at known points, TwoCoverDescent on C+]
```
Output (Seed 678315725; 0.930 s):
```
g divides C3: true
quartic Q: (4*th^2-2*th+1)*X^4 + (-10*th^2+2*th-8)*X^3 + (6*th^2+12*th+12)*X^2
          + (4*th^2-20*th-8)*X - 4*th^2+8*th+4
Q(1): 1
Q(2): 12*th^2 - 12   [= 36/(1+th)^2, verified]
Q(6/5): 1/625*(284*th^2 + 368*th - 44)
IsSquare Q(6/5): true 1/25*(2*th^2 - 18*th - 10)
C+ fake 2-Selmer set: { $.3 + $.4 + $.5 }
```

## Run 9 — the cover elliptic curve E/K has rank exactly 3 = [K:ℚ]

```
DQ := HyperellipticCurve(Q); E, toE := EllipticCurve(DQ, DQ![1,1]);
"E over K:", E; "rank bounds E(K):", RankBounds(E);
```
Output (Seed 4088765962; 5.620 s):
```
E over K: y^2 + (-2*th^2-2*th+8)xy + (-36*th^2-36*th+108)y
        = x^3 + (-2*th^2-12*th+16)x^2 + (36*th^2-126*th+72)x
rank bounds E(K): 3 3
```

## Run 10 — field structure: Galois group order 48, subfields [6, 3]

```
"irreducible /Q:", IsIrreducible(C3pol);
"Galois group order:", #GaloisGroup(C3pol);
L<al> := NumberField(C3pol);
"subfield degrees:", [Degree(S[1]) : S in Subfields(L)];
"full factorization over K:", Factorization(PK!C3pol);
```
Output (Seed 3263484460; 0.100 s):
```
irreducible /Q: true
Galois group order: 48
subfield degrees: [ 6, 3 ]
full factorization over K: [ <quadratic (= monic g)>, <quartic (= monic Q)> ]
```
(No quadratic subfield ⇒ no cubic×cubic split of C₃ over any quadratic field;
independently forced by Gal = 2 ≀ S₃ acting on the roots.)

## Run 11 — G2 invariants; endomorphism package absent from the calculator

`HeuristicEndomorphismDescription` is not available in the online calculator (CHIMP not
loaded). Obtained: `G2 invariants: [ 50000, 3750, -125 ]` for B−.

## Run 12 — A+ has the same G2 invariants (ℚ̄-twist equivalence)

```
"A+ G2:", G2Invariants(HyperellipticCurve(x^6 + 40*x^3 - 32));
"A+ conductor:", Conductor(HyperellipticCurve(x^6 + 40*x^3 - 32));
```
Output:
```
A+ G2: [ 50000, 3750, -125 ]
WARNING: Using Ogg's formula when v_2(D)>=12, no correctness guarantee  (x3)
A+ conductor: 186624
```
(186624 = 2⁸·3⁶; 2-part unreliable per the displayed Ogg warnings. Odd parts of both
conductors equal 3⁶ = 729 by PARI genus2red.)

## Run 13 — twist of E by −2 has rank 0; j(E) = 1728

```
Et := QuadraticTwist(E, -2);
"j-invariant of E:", jInvariant(E);
"rank bounds of E^(-2) over K:", RankBounds(Et);
```
Output:
```
j-invariant of E: 1728
rank bounds of E^(-2) over K: 0 0
```

## Run 14 (final certified run) — elliptic Chabauty at p = 43: the 8 cosets

```
[E, toE as in Run 9; generators:]
Pa := toE(DQ![-1, 15/(1-2*th)]);
Pb := toE(DQ![2, 6/(1+th)]);
Pc := toE(DQ![6/5, (2*th^2-18*th-10)/25]);
tors := DivisionPoints(E!0, 2);   // order 2
A := AbelianGroup([2,0,0,0]);
mw := map<A -> E | a :-> ...t2, Pa, Pb, Pc...>;
u := Expand(Inverse(toE) * map<DQ -> P1 | [DQ.1, DQ.3]>);   // P1 over Q
V, R := Chabauty(mw, u, 43);
```
Output:
```
number of 2-torsion points: 2
R: {
    0,
    A.4,
    A.2 + 2*A.3,
    2*A.3,
    A.2 + 2*A.3 - A.4,
    A.2 + A.3,
    A.3,
    A.2
}
[first return value: Infty]
```
Interpretation: at p = 43, all points of E(K) with rational x-image lie in the 8 listed
Mordell–Weil cosets. These are exactly the classes of the known rational x-values
{1, −1, 2, 6/5} together with their w ↦ −w partners (consistent with the hyperelliptic
involution acting as P ↦ T₀ − P, T₀ = A.2 + 2·A.3). The `Infty` first return reflects
the rank = degree degeneracy: a one-parameter 43-adic family survives in each coset, so
single-prime information does not certify finiteness. Multi-prime (auto) invocations of
`Chabauty(mw, u)` exceeded the calculator's 120 s limit, as did all variants invoking
`PseudoMordellWeilGroup` (class-group work over the sextic tower) and all computations
over L = K(√−2) (which are in any case structurally degenerate: rank E(L) = rank E(K)).
```
