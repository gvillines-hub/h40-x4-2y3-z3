default(parisize, "512M");
{
polys = [108*x^8 - 432*x^7 + 864*x^6 - 1080*x^5 + 576*x^4 + 144*x^3 - 464*x^2 + 284*x + 193,
         1728*x^8 - 3024*x^4 + 4624*x^2 + 1323,
         27*x^8 - 108*x^4 + 400*x^2 + 108,
         27*x^6 + 27*x^4 + 171*x^2 + 1,
         108*x^6 + 378*x^2 + 289,
         27*x^6 + 216*x^2 + 400];
for(i = 1, #polys,
  my(f = polys[i]);
  my(fa = factor(f));
  print("--- poly ", i, ": factor degrees ", vector(matsize(fa)[1], j, poldegree(fa[j,1])));
  for(j = 1, matsize(fa)[1],
    my(g = fa[j,1]);
    if(poldegree(g) < 2, next);
    my(gr = polredbest(g));
    print("    irreducible factor deg ", poldegree(g), " -> polredbest: ", gr);
  );
);
}
quit
