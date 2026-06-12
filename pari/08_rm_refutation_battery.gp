default(parisize, "512M");
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
\\ collect charpolys at good primes
plist = List(); cps = List();
forprime(p = 7, 113, if(p != 17, listput(plist, p); listput(cps, hyperellcharpoly(Mod(-C3, p)))));
\\ for each candidate quadratic field, count primes where cp splits
cands = [2, 3, 5, 6, 7, 10, 11, 13, 15, 17, 21, 30, -1, -2, -3, -5, -6, -7, -11];
for(ci = 1, #cands,
  my(d = cands[ci], M = nfinit(u^2 - d), nsplit = 0);
  for(i = 1, #cps,
    my(ff = nffactor(M, cps[i]));
    if(matsize(ff)[1] > 1 || poldegree(ff[1,1]) < 4, nsplit++);
  );
  print("Q(sqrt(", d, ")): splits at ", nsplit, " / ", #cps, " primes");
);
}
quit
