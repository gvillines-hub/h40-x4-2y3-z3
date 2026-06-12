default(parisize, "512M");
{
f8 = x^8 - 6*x^6 - 8*x^5 + 9*x^4 + 24*x^3 + 22*x^2 + 12*x + 3;
f6 = x^6 + 3*x^4 + 3*x^2 + 3;
print("deg-8 field disc: ", factor(nfdisc(f8)));
print("deg-6 field disc: ", factor(nfdisc(f6)));
print("deg-8 Galois group: ", polgalois(f8));
sf = nfsubfields(f8);
print("deg-8 subfield degrees: ", vector(#sf, i, poldegree(sf[i][1])));
for(i = 1, #sf, if(poldegree(sf[i][1]) == 2, print("   quadratic subfield: ", polredbest(sf[i][1]))));
for(i = 1, #sf, if(poldegree(sf[i][1]) == 4, print("   quartic subfield: ", polredbest(sf[i][1]))));
\\ does deg-8 field contain sqrt(-2)?
K8 = nfinit(f8);
print("sqrt(-2) in deg-8 field: ", #nfroots(K8, y^2 + 2) > 0);
print("sqrt(-3) in deg-8 field: ", #nfroots(K8, y^2 + 3) > 0);
print("sqrt(2) in deg-8 field: ", #nfroots(K8, y^2 - 2) > 0);
\\ compositum of the two entry fields
co = polcompositum(f8, f6);
print("compositum degrees: ", vector(#co, i, poldegree(co[i])));
}
quit
