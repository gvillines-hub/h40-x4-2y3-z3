// =====================================================================
// x^4 + 2y^3 + z^3 = 0 : consolidated reduction objects and certified
// computations. Greg Villines, June 2026.
// Runs on Magma V2.29. Blocks are independent; comment in/out as needed.
// On the free online calculator (120 s limit) run blocks separately.
// =====================================================================

P<x> := PolynomialRing(Rationals());
C2pol := x^6 + 40*x^3 - 32;
C3pol := 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;

// ---- Block 1: the four resolved curves -----------------------------
// (a) empty fake 2-Selmer sets (unconditional class groups):
selAm := TwoCoverDescent(HyperellipticCurve(-C2pol));
"A- fake 2-Selmer size (expect 0):", #selAm;
selBp := TwoCoverDescent(HyperellipticCurve(C3pol));
"B+ fake 2-Selmer size (expect 0):", #selBp;
selCm := TwoCoverDescent(HyperellipticCurve(-2*C3pol));
"C- fake 2-Selmer size (expect 0):", #selCm;

// (b) classical Chabauty on A+ (rank 1 < genus 2):
CA := HyperellipticCurve(C2pol);
JA := Jacobian(CA);
"A+ rank bounds (expect 1 1):", RankBounds(JA);
ptsA := Points(CA : Bound := 1000);
QA := ptsA[3] - ptsA[1];
"A+ Chabauty (expect the 4 known points, N = 5):";
Chabauty(QA);

// ---- Block 2: the hard pair ----------------------------------------
"B- rank bounds (expect 0 2; exact rank 2 via the two known generators):",
    RankBounds(Jacobian(HyperellipticCurve(-C3pol)));
"C+ rank bounds:", RankBounds(Jacobian(HyperellipticCurve(2*C3pol)));
"B-, C+ isomorphic over Q (expect false; twists by -2):",
    IsIsomorphic(HyperellipticCurve(-C3pol), HyperellipticCurve(2*C3pol));
"B- fake 2-Selmer (expect singleton):",
    #TwoCoverDescent(HyperellipticCurve(-C3pol));
"C+ fake 2-Selmer (expect singleton):",
    #TwoCoverDescent(HyperellipticCurve(2*C3pol));

// ---- Block 3: the cover over K = Q(cbrt 2) and the endgame ---------
K<th> := NumberField(x^3 - 2);
PK<X> := PolynomialRing(K);
g := (1+2*th)*X^2 + (2*th^2-2*th)*X - (2+2*th^2);   // norm form: N(g) = C3
Q := (PK!C3pol) div g;
"g*Q = C3:", g*Q eq PK!C3pol;
DQ := HyperellipticCurve(Q);
E, toE := EllipticCurve(DQ, DQ![1,1]);
"j(E) (expect 1728):", jInvariant(E);
"rank bounds E(K) (expect 3 3):", RankBounds(E);
"rank bounds of twist by -2 (expect 0 0):",
    RankBounds(QuadraticTwist(E, -2));

// generators from the known solutions:
Pa := toE(DQ![-1, 15/(1-2*th)]);
Pb := toE(DQ![2, 6/(1+th)]);
Pc := toE(DQ![6/5, (2*th^2-18*th-10)/25]);
tors := DivisionPoints(E!0, 2);
t2 := E!0; for q in tors do if q ne E!0 then t2 := q; end if; end for;
A := AbelianGroup([2,0,0,0]);
mw := map<A -> E | a :-> Eltseq(a)[1]*t2 + Eltseq(a)[2]*Pa
                       + Eltseq(a)[3]*Pb + Eltseq(a)[4]*Pc>;
P1 := ProjectiveSpace(Rationals(), 1);
u := Expand(Inverse(toE) * map<DQ -> P1 | [DQ.1, DQ.3]>);

// Certified on the online calculator: at p = 43 all rational-x classes lie
// in the 8 cosets of the known x-values {1, -1, 2, 6/5} and their w -> -w
// partners (T0 = A.2 + 2*A.3). First return value Infty: rank = degree
// degeneracy leaves a 1-parameter 43-adic family per coset.
V43, R43 := Chabauty(mw, u, 43);
"cosets at 43:", R43;

// The auto-prime version below did NOT terminate within the calculator's
// 120 s limit; on a licensed installation it may or may not certify
// finiteness -- the structural rank = degree obstruction suggests a
// different finishing argument is required (see README, Section 5).
// V, R := Chabauty(mw, u);
// "R:", R; "#V:", #V; for v in V do u(mw(v)); end for;

// Expected theorem: rational x-values on the cover are exactly
// {1, -1, 2, 6/5}, whence the only primitive solutions of
// x^4 + 2y^3 + z^3 = 0 are (+-1, 0, -1), (+-1, -1, 1), (+-43, -203, 237).
