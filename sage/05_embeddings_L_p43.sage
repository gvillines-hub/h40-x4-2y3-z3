# L = K(sqrt(-2)) = Q(s), s = cbrt2 + sqrt(-2); abs poly
# x^6 + 6x^4 + 4x^3 + 12x^2 - 24x + 12. 43 is totally split in L:
# six embeddings into Q_43. Exact sanity layer: th^3 = 2, w^2 = -2,
# C3 = g*Q, all four known points on D: v^2 = Q(x); every conjugate
# quartic Q_i has >= 2 roots in Q_43 (odd-model transform available
# at every place).
p = 43; prec = 30
R.<x> = QQ[]
Kf.<th0> = NumberField(x^3 - 2)
Lrel.<s0> = Kf.extension(x^2 + 2)
Labs.<s> = Lrel.absolute_field()
fromL, toL = Labs.structure()
th = toL(Lrel(th0)); w = toL(s0)
assert th^3 == 2 and w^2 == -2
RL.<X> = Labs[]
C3 = 17*X^6 - 72*X^5 + 90*X^4 + 40*X^3 - 180*X^2 + 144*X - 40
g = (1 + 2*th)*X^2 + (2*th^2 - 2*th)*X - (2 + 2*th^2)
Q, rem = C3.quo_rem(g); assert rem == 0
pts = [(Labs(1), Labs(1)), (Labs(-1), 15/(1 - 2*th)),
       (Labs(2), 6/(1 + th)), (Labs(6)/5, (2*th^2 - 18*th - 10)/25)]
assert all(b^2 == Q(a) for (a, b) in pts)
K43 = Qp(p, prec)
RK.<t> = K43[]
roots = [r for r, m in RK([K43(c) for c in Labs.defining_polynomial().list()]).roots()]
print("embeddings into Q_43:", len(roots))
spol = lambda elt: R(elt.polynomial())
for i, si in enumerate(roots):
    Qi = RK([K43(spol(c)(si)) for c in Q.list()])
    print("place", i, ": Q_i has", len(Qi.roots()), "roots in Q_43")
