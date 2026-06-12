# Coleman integrals between the known points of B- transported to the odd
# model at p = 43. Internal consistency: with P2 = iota(P1), P4 = iota(P3),
# the identity I(P2->P1) = I(P4->P3) + 2*I(P3->P1) holds digit-by-digit
# (iota negates all basis differentials). Holomorphic integrals have
# positive valuation; meromorphic ones valuation 0.
p = 43
N = 20
R.<x> = QQ[]
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40
f = -C3
K = Qp(p, N)
RK.<t> = K[]
fK = RK([K(c) for c in f.list()])
r0 = fK.roots()[0][0]
coeffs = f.list()
RU.<u> = K[]
g = RU(sum(K(coeffs[i]) * (r0*u + 1)^i * u^(6-i) for i in range(7)))
c = g.leading_coefficient()
RX.<x> = K[]
G = RX(c^4 * g(x/c))
C = HyperellipticCurve(G)
def transport(x0, y0):
    uu = 1 / (K(x0) - r0)
    vv = K(y0) * uu^3
    return C(c*uu, c^2*vv)
P1 = transport(1, 1); P2 = transport(1, -1)
P3 = transport(-1, 15); P4 = transport(-1, -15)
I1 = C.coleman_integrals_on_basis(P2, P1)
I2 = C.coleman_integrals_on_basis(P4, P3)
I3 = C.coleman_integrals_on_basis(P3, P1)
print("I1 == I2 + 2*I3:", all((I1[i] - I2[i] - 2*I3[i]).valuation() >= 18 for i in range(4)))
for v in I1: print("  I1:", v)
