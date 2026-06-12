default(parisize, "512M");
\\ Z[theta], theta = 2^(1/3), elements as [e0,e1,e2]
zmul(a, b) = [a[1]*b[1] + 2*(a[2]*b[3] + a[3]*b[2]), a[1]*b[2] + a[2]*b[1] + 2*a[3]*b[3], a[1]*b[3] + a[2]*b[2] + a[3]*b[1]];
znorm(e) = e[1]^3 + 2*e[2]^3 + 4*e[3]^3 - 6*e[1]*e[2]*e[3];
eps = [-1, 1, 0];  \\ theta - 1
dochart(uu, vv, ww, dl) = {
  my(gam = [uu, vv, ww], al = zmul(gam, gam));
  if(dl == 1, al = zmul(eps, al));
  if(al[3] != 0, return(["BAD", al[3]]));
  my(aa = al[1], bb = al[2], cc = znorm(gam));
  [aa, bb, cc, (aa^3 + 2*bb^3) == cc^2];
}
r = dochart(2*s^2, 2*s*t, -t^2, 0);
print("F1 (d0): a = ", r[1]);  print("         b = ", r[2]);  print("         c = ", r[3], "   identity ok: ", r[4]);
r = dochart(s^2, 2*s*t, -2*t^2, 0);
print("F2 (d0): a = ", r[1]);  print("         b = ", r[2]);  print("         c = ", r[3], "   identity ok: ", r[4]);
r = dochart(s^2 - 2*t^2, 2*s*(s-t), 2*t*(s-t), 1);
print("F3 (d1): a = ", r[1]);  print("         b = ", r[2]);  print("         c = ", r[3], "   identity ok: ", r[4]);
quit
