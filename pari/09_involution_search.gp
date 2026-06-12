default(parisize, "256M"); default(realprecision, 50);
mob(co, z) = (co[1]*z + co[2]) / (co[3]*z + co[4]);
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
rts = polroots(C3);
print("roots: ");
for(i = 1, 6, print("  ", i, ": ", rts[i]));
others = [2, 3, 4, 5, 6];
found = 0;
for(i = 1, 5,
  my(p1b = others[i], rem = Vec(setminus(Set(others), Set([p1b]))));
  my(m2 = [[rem[1],rem[2],rem[3],rem[4]], [rem[1],rem[3],rem[2],rem[4]], [rem[1],rem[4],rem[2],rem[3]]]);
  for(j = 1, 3,
    my(pairs = [[1, p1b], [m2[j][1], m2[j][2]], [m2[j][3], m2[j][4]]]);
    \\ build 3x4: a*u + b - v*u*c - v*d = 0
    my(N = matrix(3, 4));
    for(t = 1, 3,
      my(u = rts[pairs[t][1]], v = rts[pairs[t][2]]);
      N[t,] = [u, 1, -v*u, -v];
    );
    \\ kernel vector = signed 3x3 minors
    my(co = vector(4));
    for(c = 1, 4,
      my(cols = setminus([1,2,3,4], [c]));
      my(sub = matrix(3, 3, r, cc, N[r, cols[cc]]));
      co[c] = (-1)^(c+1) * matdet(sub);
    );
    \\ involution requires trace a + d = 0 (up to numerical noise)
    my(sc = vecmax(abs(co)));
    if(sc < 1e-20, next);
    my(tr = abs(co[1] + co[4]) / sc);
    \\ verify reverse mappings
    my(err = 0);
    for(t = 1, 3, err = max(err, abs(mob(co, rts[pairs[t][2]]) - rts[pairs[t][1]])));
    if(tr < 1e-15 && err < 1e-15,
      found++;
      print("INVOLUTION for pairing ", pairs);
      print("  (a,b,c,d) normalized: ", co/co[3]);
    );
  );
);
print(found, " involution(s) found");
}
quit
