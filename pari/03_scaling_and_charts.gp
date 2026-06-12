default(parisize, "512M");
ev(P, sv, tv) = subst(subst(P, x, sv), y, tv);
PA = [4*x^4 - 8*y^3*x,  x^4 - 16*y^3*x,  7*x^4 - 24*y*x^3 + 36*y^2*x^2 - 32*y^3*x + 12*y^4];
PB = [8*y*x^3 + 2*y^4,  4*y*x^3 + 8*y^4,  -3*x^4 + 20*y*x^3 - 36*y^2*x^2 + 24*y^3*x - 4*y^4];
PC = [8*x^6 + 40*y^3*x^3 - 4*y^6,  x^6 + 40*y^3*x^3 - 32*y^6,  17*x^6 - 72*y*x^5 + 90*y^2*x^4 + 40*y^3*x^3 - 180*y^4*x^2 + 144*y^5*x - 40*y^6];
{
\\ enumerate brute-force primitive solutions
bf = List();
for(b = -400, 400,
  my(lo = ceil(-2^(1/3)*abs(b)) - 2, c);
  for(a = lo, 700,
    if(gcd(a, b) != 1, next);
    my(n = a^3 + 2*b^3);
    if(n >= 0 && issquare(n, &c), listput(bf, [a, b, c]));
  );
);
\\ all representations: sol -> list of [fam, s, t, d, Cval]
reps = Map();
B = 80;
for(s = -B, B, for(t = -B, B,
  if(gcd(s, t) != 1, next);
  for(k = 1, 3,
    my(aa = ev(PA[k], s, t), bb = ev(PB[k], s, t), cc = ev(PC[k], s, t), c2);
    if(aa == 0 && bb == 0, next);
    my(g = gcd(aa, bb));
    if(g == 0, g = max(abs(aa), abs(bb)));
    fordiv(g, d,
      my(a2 = aa/d, b2 = bb/d, n2);
      if(gcd(a2, b2) != 1, next);
      n2 = a2^3 + 2*b2^3;
      if(n2 >= 0 && issquare(n2, &c2),
        my(key = [a2, b2, c2], L);
        L = if(mapisdefined(reps, key), mapget(reps, key), List());
        listput(L, [k, s, t, d, cc]);
        mapput(reps, key, L);
      );
    );
  );
));
\\ analyze: which (fam, d) occur; verify C = +- c * e^3 with e^2 = d
pat = Map();
for(i = 1, #bf,
  my(sol = bf[i]);
  if(!mapisdefined(reps, sol), print("UNCOVERED: ", sol); next);
  my(L = mapget(reps, sol));
  for(j = 1, #L,
    my(r = L[j], k = r[1], d = r[4], cval = r[5], e, ok = 0);
    if(issquare(d, &e), ok = (cval == sol[3]*e^3 || cval == -sol[3]*e^3));
    my(pkey = [k, d, r[2]%2, r[3]%2, ok]);
    mapput(pat, pkey, if(mapisdefined(pat, pkey), mapget(pat, pkey)+1, 1));
  );
);
print("pattern [family, d, s mod 2, t mod 2, scaling-law ok] : count");
my(M = Mat(pat));
for(i = 1, matsize(M)[1], print("  ", M[i,1], " : ", M[i,2]));
\\ the sporadic solution's representations
print("reps of (-237,203,1849): ", Vec(mapget(reps, [-237,203,1849])));
print("reps of (-1,1,1): ", Vec(mapget(reps, [-1,1,1])));
print("reps of (1,0,1): ", Vec(mapget(reps, [1,0,1])));
}
quit
