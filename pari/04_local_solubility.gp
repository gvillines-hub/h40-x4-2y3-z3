default(parisize, "256M");
\\ crude local solubility scan for Y^2 = F6(s,t), Y weight 3, at prime p:
\\ search primitive (s,t) mod p^2; F value v: if v nonzero mod p^4, check v is a p-adic square
C2h(s,t) = s^6 + 40*s^3*t^3 - 32*t^6;
C3h(s,t) = 17*s^6 - 72*s^5*t + 90*s^4*t^2 + 40*s^3*t^3 - 180*s^2*t^4 + 144*s*t^5 - 40*t^6;
testp(fun, sgn, p) = {
  my(q = p^2, found = 0);
  for(s = 0, q-1, for(t = 0, q-1,
    if(s % p == 0 && t % p == 0, next);
    my(v = sgn * fun(s, t));
    if(v == 0, found = 1; break(2));
    my(w = v + O(p^12));
    if(issquare(w), found = 1; break(2));
  ));
  found;
}
{
print("A- (y^2 = -C2):");
forprime(p = 2, 23, print("  p=", p, " soluble: ", testp(C2h, -1, p)));
print("B+ (y^2 = C3):");
forprime(p = 2, 23, print("  p=", p, " soluble: ", testp(C3h, 1, p)));
print("C- (y^2 = -2*C3):");
forprime(p = 2, 23, print("  p=", p, " soluble: ", testp((s,t) -> 2*C3h(s,t), -1, p)));
}
quit
