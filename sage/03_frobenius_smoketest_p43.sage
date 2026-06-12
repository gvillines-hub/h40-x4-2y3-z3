# Kedlaya Frobenius on the odd model of y^2 = -C3 at p = 43.
# Output charpoly x^4 + 14x^2 + 43^2 matches PARI hyperellcharpoly exactly
# (43 is split in Q(sqrt(-2)); the zero trace reflects the pi^2 / pibar^2
#  Hecke-character structure of this GL2(Q(sqrt(-2)))-type surface).
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
from sage.schemes.hyperelliptic_curves import monsky_washnitzer
M = monsky_washnitzer.matrix_of_frobenius_hyperelliptic(C)
if isinstance(M, tuple): M = M[0]
print(M.charpoly())   # expect x^4 + 14x^2 + 1849
