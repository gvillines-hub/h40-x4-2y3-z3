default(parisize, "256M");
zmul(a, b) = [a[1]*b[1] + 2*(a[2]*b[3] + a[3]*b[2]), a[1]*b[2] + a[2]*b[1] + 2*a[3]*b[3], a[1]*b[3] + a[2]*b[2] + a[3]*b[1]];
znorm(e) = e[1]^3 + 2*e[2]^3 + 4*e[3]^3 - 6*e[1]*e[2]*e[3];
{
\\ gamma(x) = (x^2-2) + (2x^2-2x)theta + (2x-2)theta^2 : claim N(gamma) = C3(x)
g = [x^2 - 2, 2*x^2 - 2*x, 2*x - 2];
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
print("N(gamma(x)) == C3(x): ", znorm(g) == C3);
\\ d-classes at the four relevant points
print("gamma(1)   = ", subst(g, x, 1));
print("gamma(-1)  = ", subst(g, x, -1));
print("gamma(2)   = ", subst(g, x, 2));
print("gamma(6,5) homog = ", [36-50, 2*6*(6-5), 2*5*(6-5)]);
\\ check 2*gamma(2) = (2(1+theta))^2 ?
print("zmul([2,2,0],[2,2,0]) = ", zmul([2,2,0],[2,2,0]), "  vs 2*gamma(2) = ", 2*subst(g, x, 2));
}
quit
