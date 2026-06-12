default(parisize, "512M");
ev(P, sv, tv) = subst(subst(P, x, sv), y, tv);
PA = [4*x^4 - 8*y^3*x,  x^4 - 16*y^3*x,  7*x^4 - 24*y*x^3 + 36*y^2*x^2 - 32*y^3*x + 12*y^4];
PB = [8*y*x^3 + 2*y^4,  4*y*x^3 + 8*y^4,  -3*x^4 + 20*y*x^3 - 36*y^2*x^2 + 24*y^3*x - 4*y^4];
hits = Map(); whichfam = Map();
{
bf = List();
for(b = -400, 400,
  my(lo = ceil(-2^(1/3)*abs(b)) - 2, c);
  for(a = lo, 700,
    if(gcd(a, b) != 1, next);
    my(n = a^3 + 2*b^3);
    if(n < 0, next);
    if(issquare(n, &c), listput(bf, [a, b, c]));
  );
);
print("brute-force primitive solutions (|b|<=400, a<=700): ", #bf);
B = 80;
for(s = -B, B, for(t = -B, B,
  if(gcd(s, t) != 1, next);
  for(k = 1, 3,
    my(aa = ev(PA[k], s, t), bb = ev(PB[k], s, t), c2);
    if(aa == 0 && bb == 0, next);
    my(g = gcd(aa, bb));
    if(g == 0, next);
    fordiv(g, d,
      my(a2 = aa/d, b2 = bb/d, n2 = 0);
      if(gcd(a2, b2) != 1, next);
      n2 = a2^3 + 2*b2^3;
      if(n2 >= 0 && issquare(n2, &c2),
        mapput(hits, [a2, b2, c2], 1);
        if(!mapisdefined(whichfam, [a2, b2, c2]), mapput(whichfam, [a2, b2, c2], [k, s, t]));
      );
    );
  );
));
missed = List();
for(i = 1, #bf, if(!mapisdefined(hits, bf[i]), listput(missed, bf[i])));
print("covered: ", #bf - #missed, " / ", #bf, "   MISSED: ", Vec(missed));
keys = [[1,0,1], [-1,1,1], [-237,203,1849]];
for(i = 1, 3, if(mapisdefined(whichfam, keys[i]), print(keys[i], "  <-  [family, s, t] = ", mapget(whichfam, keys[i])), print(keys[i], "  NOT located")));
}
quit
