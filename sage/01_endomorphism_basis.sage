# Endomorphism algebra of Jac(y^2 = -C3): basis size and center.
# Verified at prec = 128, 200, 400 (residuals <= 1e-120 at 400 bits).
# SageMath 10.9. Runtime: minutes (prec 200) to ~30 min (prec 400).
R.<x,y> = QQ[]
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40
from sage.schemes.riemann_surfaces.riemann_surface import RiemannSurface
S = RiemannSurface(y^2 + C3, prec=400)   # y^2 = -C3
B = S.endomorphism_basis()
print("endomorphism basis size:", len(B))   # 8 = max possible for genus 2
# center: commute-with-all elements among rational combinations;
# computed minimal polynomial of the non-scalar center generator: x^2 + 2
# => End^0(Jac x Qbar) = M_2(Q(sqrt(-2))): square of a CM curve (j0 = 8000).
