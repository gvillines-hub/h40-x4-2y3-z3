default(parisize, "256M"); default(realprecision, 50);
mob(co, z) = (co[1]*z + co[2]) / (co[3]*z + co[4]);
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
C2 = x^6 + 40*x^3 - 32;
\\ discriminant 2-adic valuations
d3 = poldisc(C3); d2 = poldisc(C2);
print("v2(disc C3) = ", valuation(d3, 2), ",  v3 = ", valuation(d3, 3), ", disc sign ", sign(d3));
print("v2(disc C2) = ", valuation(d2, 2), ",  v3 = ", valuation(d2, 3), ", disc sign ", sign(d2));
rB = polroots(-C3); rX = polroots(C2);  \\ roots of the sextics (same as of C3, C2 up to sign of poly)
\\ find Mobius m with m(rB[i]) in rX for all i: determine m from images of rB[1],rB[2],rB[3]
\\ try all ordered triples of distinct targets
best = oo; bestco = 0; bestperm = 0;
for(a1 = 1, 6, for(a2 = 1, 6, if(a2 == a1, next); for(a3 = 1, 6,
  if(a3 == a1 || a3 == a2, next);
  \\ solve m(rB[t]) = rX[a_t], t=1..3: linear in (a,b,c,d)
  my(N = matrix(3, 4));
  my(tg = [a1, a2, a3]);
  for(t = 1, 3, my(u = rB[t], v = rX[tg[t]]); N[t,] = [u, 1, -v*u, -v]);
  my(co = vector(4));
  for(c = 1, 4,
    my(cols = setminus([1,2,3,4], [c]));
    my(sub = matrix(3, 3, r, cc, N[r, cols[cc]]));
    co[c] = (-1)^(c+1) * matdet(sub);
  );
  if(vecmax(abs(co)) < 1e-25, next);
  \\ check remaining roots map into root set
  my(err = 0);
  for(t = 4, 6,
    my(im = mob(co, rB[t]), e = oo);
    for(s = 1, 6, e = min(e, abs(im - rX[s])));
    err = max(err, e);
  );
  if(err < best, best = err; bestco = co; bestperm = tg);
)));
print("best residual: ", best);
if(best < 1e-20,
  co = bestco / bestco[3];
  print("twist Mobius map coefficients (c=1): ");
  print("  a = ", co[1]); print("  b = ", co[2]); print("  d = ", co[4]);
);
}
quit
