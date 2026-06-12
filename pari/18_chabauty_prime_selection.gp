{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
print("split primes (p=1,3 mod 8), factorization type of C3 mod p, roots:");
forprime(p = 5, 250,
  if(p == 17 || !(p%8 == 1 || p%8 == 3), next);
  my(fa = factormod(C3, p));
  my(degs = vector(matsize(fa)[1], i, poldegree(fa[i,1])));
  my(rts = polrootsmod(C3, p));
  print("  p=", p, ": degrees ", degs, "   roots mod p: ", #rts, if(#rts > 0, Str("  -> ", lift(rts)), ""));
);
}
quit
