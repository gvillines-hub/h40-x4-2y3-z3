default(parisize, "256M"); default(realprecision, 50);
mob(co, z) = (co[1]*z + co[2]) / (co[3]*z + co[4]);
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
C2 = x^6 + 40*x^3 - 32;
rB = polroots(-C3); rX = polroots(C2);
th = 2^(1/3); s3 = sqrt(3); om = exp(2*Pi*I/3); w = sqrt(-2);
good = List();
for(a1 = 1, 6, for(a2 = 1, 6, if(a2 == a1, next); for(a3 = 1, 6,
  if(a3 == a1 || a3 == a2, next);
  my(N = matrix(3,4), tg = [a1,a2,a3]);
  for(t = 1, 3, my(u = rB[t], v = rX[tg[t]]); N[t,] = [u, 1, -v*u, -v]);
  my(co = vector(4));
  for(c = 1, 4,
    my(cols = setminus([1,2,3,4],[c]));
    my(sub = matrix(3,3,r,cc, N[r,cols[cc]]));
    co[c] = (-1)^(c+1)*matdet(sub);
  );
  if(vecmax(abs(co)) < 1e-25, next);
  my(err = 0);
  for(t = 4, 6,
    my(im = mob(co, rB[t]), e = oo);
    for(s = 1, 6, e = min(e, abs(im - rX[s])));
    err = max(err, e);
  );
  if(err < 1e-20, listput(good, co/co[3]));
)));
print(#good, " twist maps found");
\\ test each over candidate fields; report best (smallest max lindep coeff)
fields = [["Q(th)", [1,th,th^2]], ["Q(s3)", [1,s3]], ["Q(w)", [1,w]], ["Q(om)", [1,om]], ["Q(om*th)", [1,om*th,om^2*th^2]], ["K(w) deg6", [1,th,th^2,w,th*w,th^2*w]], ["K(om) deg6", [1,th,th^2,om,th*om,th^2*om]], ["Q(om,th) full", [1,th,th^2,om,om*th,om*th^2]]];
for(g = 1, #good,
  my(co = good[g]);
  for(f = 1, #fields,
    my(bas = fields[f][2], ok = 1, worst = 0);
    for(j = 1, 4,
      if(j == 3, next);
      my(ld = lindep(concat([co[j]], bas)));
      my(mx = vecmax(abs(ld)));
      worst = max(worst, mx);
      if(mx > 10^6, ok = 0; break);
    );
    if(ok, print("map ", g, " IS over ", fields[f][1], "  (max coeff ", worst, ")"));
  );
);
print("sample map 1: ", round(good[1]*10.^6)/10.^6);
}
quit
