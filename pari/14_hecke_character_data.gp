default(parisize, "512M");
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
F = nfinit(w^2 + 2);
print("split primes p (p=1,3 mod 8): factor charpoly over Q(sqrt-2), constant terms vs pi^2:");
forprime(p = 5, 200,
  if(p == 17 || p == 3 || !(p%8 == 1 || p%8 == 3), next);
  my(cp = hyperellcharpoly(Mod(-C3, p)));
  my(ff = nffactor(F, cp));
  if(matsize(ff)[1] < 2, print("  p=", p, ": does not factor (!)"); next);
  my(f1 = ff[1,1]);
  if(poldegree(f1) != 2, print("  p=", p, ": degrees odd: ", vector(matsize(ff)[1], i, poldegree(ff[i,1]))); next);
  \\ constant term c in F
  my(c = polcoeff(f1, 0), b = polcoeff(f1, 1));
  \\ find pi with N(pi) = p: solve a^2 + 2b^2 = p
  my(pi = 0);
  for(aa = 0, sqrtint(p),
    my(r = p - aa^2);
    if(r >= 0 && r % 2 == 0 && issquare(r/2), pi = Mod(aa + sqrtint(r/2)*w, w^2+2); break);
  );
  my(c2 = lift(c), p2 = lift(pi^2), p2c = lift(subst(p2, w, -w)));
  my(rel = "?");
  if(c2 == p2, rel = "c = pi^2");
  if(c2 == p2c, rel = "c = conj(pi)^2");
  if(c2 == -p2, rel = "c = -pi^2");
  if(c2 == -p2c, rel = "c = -conj(pi)^2");
  if(lift(c) == p, rel = "c = p (rational)");
  if(lift(c) == -p, rel = "c = -p (rational)");
  print("  p=", p, ":  factor x^2 + (", lift(b), ")x + (", lift(c), ")   pi = ", lift(pi), "   ", rel);
);
}
quit
