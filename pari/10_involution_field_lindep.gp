default(parisize, "256M"); default(realprecision, 50);
{
C3 = 17*x^6 - 72*x^5 + 90*x^4 + 40*x^3 - 180*x^2 + 144*x - 40;
rts = polroots(C3);
\\ involution 1: pairing [[1,2],[3,4],[5,6]], real coefficients
a1 = 1.3507287394325558620607712393021846604;
b1 = -1.2188412666048045580997070053930219153;
\\ involution 2: pairing [[1,2],[3,5],[4,6]], real
a2 = 0.93125187158563926839243316706165137202;
b2 = -1.2968960665973532731283462741794524834;
th = 2^(1/3);
print("--- involution 1: a in Q? ", lindep([a1, 1]));
print("    a in Q(sqrt2)? ", lindep([a1, 1, sqrt(2)]));
print("    a in Q(2^(1/3))? ", lindep([a1, 1, th, th^2]));
print("    b in Q(2^(1/3))? ", lindep([b1, 1, th, th^2]));
print("--- involution 2: a in Q(sqrt2)? ", lindep([a2, 1, sqrt(2)]));
print("    a in Q(2^(1/3))? ", lindep([a2, 1, th, th^2]));
print("    b in Q(2^(1/3))? ", lindep([b2, 1, th, th^2]));
\\ involution 3 (complex): a = 0.73936537801403192157641530291159211773 - 0.11958652456638116779037884547935541997i
a3 = 0.73936537801403192157641530291159211773 - 0.11958652456638116779037884547935541997*I;
b3 = -0.32056840829436325598843841253173554447 + 0.60846195749008028956352864877735134115*I;
w = sqrt(-2);
print("--- involution 3: a in Q(sqrt-2)? ", lindep([a3, 1, w]));
print("    b in Q(sqrt-2)? ", lindep([b3, 1, w]));
\\ also try Q(omega*2^(1/3)) the complex cubic: basis 1, om*th, om^2*th^2
om = exp(2*Pi*I/3);
print("    a in Q(om*th)? ", lindep([a3, 1, om*th, om^2*th^2]));
print("    b in Q(om*th)? ", lindep([b3, 1, om*th, om^2*th^2]));
\\ involution 5: a = 1.0214... - 1.1269...i
a5 = 1.0214075406582307147083175065009483043 - 1.1269161173500767898014925992817427400*I;
print("--- involution 5: a in Q(sqrt-2)? ", lindep([a5, 1, w]));
print("    a in Q(om*th)? ", lindep([a5, 1, om*th, om^2*th^2]));
}
quit
