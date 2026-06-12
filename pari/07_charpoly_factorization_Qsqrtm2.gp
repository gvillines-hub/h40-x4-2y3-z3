default(parisize, "512M");
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
F = nfinit(u^2 + 2);  \\ Q(sqrt(-2))
print("charpoly factorization over Q(sqrt(-2)):");
forprime(p = 7, 100,
  if(p == 17, next);
  my(cp = hyperellcharpoly(Mod(-C3, p)));
  my(ff = nffactor(F, cp));
  my(degs = vector(matsize(ff)[1], i, poldegree(ff[i,1])));
  print("  p=", p, ": degrees ", degs);
);
}
quit
