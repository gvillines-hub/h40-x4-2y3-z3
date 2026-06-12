# Tangent (analytic) representation of each endomorphism and algdep
# identification of matrix entries. Stable identifications: identity;
# two conjugate endos with entries in the deg-8 field
#   x^8 - 6x^6 - 8x^5 + 9x^4 + 24x^3 + 22x^2 + 12x + 3  (contains Q(sqrt-3));
# one endo with entries in the deg-6 field x^6 + 3x^4 + 3x^2 + 3
#   = Q(sqrt(-1 - cbrt2)) (contains cbrt2). Remaining basis elements are
# products with entries in the deg-24 compositum (algdep beyond reach).
R.<x,y> = QQ[]
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40
from sage.schemes.riemann_surfaces.riemann_surface import RiemannSurface
S = RiemannSurface(y^2 + C3, prec=400)
B = S.endomorphism_basis()
P = S.period_matrix()
CC = P.base_ring()
Pc = P.conjugate().transpose()
Gi = (P * Pc).inverse()
def tangent(M):
    PM1 = P * M.change_ring(CC).transpose()
    PM2 = P * M.change_ring(CC)
    T1 = PM1 * Pc * Gi; r1 = (T1*P - PM1).norm()
    T2 = PM2 * Pc * Gi; r2 = (T2*P - PM2).norm()
    return (T1, r1) if r1 < r2 else (T2, r2)
for k, M in enumerate(B):
    T, r = tangent(M)
    print("=== endo", k, "residual:", r)
    for e in T.list():
        for d in [1, 2, 4, 8, 12, 16]:
            f = algdep(e, d)
            if abs(f(e)) < 1e-90:
                print("   entry ~", f, "  (deg <=", d, ")")
                break
        else:
            print("   entry unidentified")
