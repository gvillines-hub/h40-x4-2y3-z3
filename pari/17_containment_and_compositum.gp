default(parisize, "512M");
contains(f, g) = vecmin(apply(poldegree, polcompositum(f, g))) == poldegree(f);
{
f8 = x^8 - 6*x^6 - 8*x^5 + 9*x^4 + 24*x^3 + 22*x^2 + 12*x + 3;
f6 = x^6 + 3*x^4 + 3*x^2 + 3;
print("deg-8 contains sqrt(-2): ", contains(f8, x^2 + 2));
print("deg-8 contains sqrt(-3): ", contains(f8, x^2 + 3));
print("deg-8 contains sqrt(2):  ", contains(f8, x^2 - 2));
print("deg-8 contains cbrt(2):  ", contains(f8, x^3 - 2));
print("deg-8 contains 4thr(-2): ", contains(f8, x^4 + 2));
print("deg-6 contains sqrt(-3): ", contains(f6, x^2 + 3));
print("deg-6 contains sqrt(-2): ", contains(f6, x^2 + 2));
print("deg-6 contains cbrt(2):  ", contains(f6, x^3 - 2));
co = polcompositum(f8, f6);
print("compositum f8*f6 degrees: ", apply(poldegree, co));
cmin = co[1];
print("compositum contains sqrt(-2): ", contains(cmin, x^2 + 2));
print("compositum contains 6th-root of -3: ", contains(cmin, x^6 + 3));
print("compositum contains 4th-root of -2: ", contains(cmin, x^4 + 2));
}
quit
