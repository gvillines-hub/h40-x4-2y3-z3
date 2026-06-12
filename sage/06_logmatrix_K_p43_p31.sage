# Formal-group logarithm matrices of the three generators of E(K) at the
# totally split primes 43 and 31 of K = Q(cbrt2): per place, shift a
# Q_p-root of the conjugate quartic to infinity (odd model), multiply each
# generator into the formal group by #E(F_p), take log / #E(F_p).
# Output: both primes give 3 places, rank 3, 3 distinct rows.
# NOTE (structural): over L = K(sqrt(-2)) the corresponding 6x3 matrix has
# only 3 distinct rows (rows pair up across conjugate places) because
# rank E(L) = rank E(K): the L-route is degenerate. This script is the
# K-level infrastructure for multi-prime sieving.
R.<x> = QQ[]
Kf.<th0> = NumberField(x^3 - 2)
RL.<X> = Kf[]
C3 = 17*X^6 - 72*X^5 + 90*X^4 + 40*X^3 - 180*X^2 + 144*X - 40
g = (1 + 2*th0)*X^2 + (2*th0^2 - 2*th0)*X - (2 + 2*th0^2)
Q, _ = C3.quo_rem(g)
pts = [(Kf(-1), 15/(1 - 2*th0)), (Kf(2), 6/(1 + th0)),
       (Kf(6)/5, (2*th0^2 - 18*th0 - 10)/25)]
spol = lambda elt: R(elt.polynomial())
for p in [43, 31]:
    print("="*20, "p =", p)
    Kp = Qp(p, 30)
    RK.<t> = Kp[]
    cube = [r for r, m in RK(t^3 - 2).roots()]
    logmat = []
    for si in cube:
        Qi = RK([Kp(spol(c)(si)) for c in Q.list()])
        bad = set([GF(p)(1), GF(p)(-1), GF(p)(2), GF(p)(6)/5])
        rr = [r for r, m in Qi.roots() if GF(p)(r.residue()) not in bad]
        r0 = rr[0]
        c1 = Qi.derivative()(r0)
        c2 = Qi.derivative().derivative()(r0)/2
        c3 = Qi.derivative().derivative().derivative()(r0)/6
        c4 = Qi[4]
        E = EllipticCurve(Kp, [0, c2, 0, c1*c3, c1^2*c4])
        Ered = EllipticCurve(GF(p), [0, GF(p)(c2.residue()), 0,
               GF(p)((c1*c3).residue()), GF(p)((c1^2*c4).residue())])
        m = Ered.order()
        fl = E.formal_group().log(25)
        row = []
        for (a, b) in pts:
            ai, bi = Kp(spol(a)(si)), Kp(spol(b)(si))
            U = 1/(ai - r0); V = bi*U^2
            P = E(c1*U, c1*V)
            mP = m*P
            row.append(fl(-mP[0]/mP[1])/m)
        logmat.append(row)
        print("  place: root residue", r0.residue(), " #E(F_p) =", m)
    M = matrix(Kp, logmat)
    print("rank:", M.rank(), " distinct rows:",
          len(set([tuple(str(e) for e in row) for row in logmat])))
