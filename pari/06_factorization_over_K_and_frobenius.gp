default(parisize, "512M");
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
\\ factor over K = Q(2^(1/3)) -- monicize first: F(x) = 17^5 * C3(x/17)
C3m = 17^5 * subst(C3, x, x/17);
print("monicized: ", C3m);
K = nfinit(t^3 - 2);
fa = nffactor(K, C3m);
print("factor degrees over K: ", vector(matsize(fa)[1], i, poldegree(fa[i,1])));
\\ Frobenius charpolys of Jacobian of B- (y^2 = -C3) at good primes:
\\ split Jacobian <=> charpoly factors into two quadratics over Q for ALL p
print("Frobenius charpoly factorization of Jac(B-), small good primes:");
forprime(p = 7, 60,
  if(p == 17, next);
  my(cp = hyperellcharpoly(Mod(-C3, p)));
  my(ff = factor(cp));
  print("  p=", p, ": ", vector(matsize(ff)[1], i, poldegree(ff[i,1])), "   ", cp);
);
}
quit
