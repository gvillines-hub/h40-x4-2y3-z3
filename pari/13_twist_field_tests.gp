default(parisize, "256M"); default(realprecision, 50);
{
a = -1.8660889697955401907174062670058006206;
b = 2.9057477224508090730309567406655771339;
d = -0.24475348683647584884171803041072976188;
th = 2^(1/3); s3 = sqrt(3); s2 = sqrt(2); s6 = sqrt(6);
print("--- a:");
print("  /Q(th):       ", lindep([a, 1, th, th^2]));
print("  /Q(s3):       ", lindep([a, 1, s3]));
print("  /Q(s2):       ", lindep([a, 1, s2]));
print("  /Q(s6):       ", lindep([a, 1, s6]));
print("  /K(s3):       ", lindep([a, 1, th, th^2, s3, th*s3, th^2*s3]));
print("--- b:");
print("  /Q(th):       ", lindep([b, 1, th, th^2]));
print("  /K(s3):       ", lindep([b, 1, th, th^2, s3, th*s3, th^2*s3]));
print("--- d:");
print("  /Q(th):       ", lindep([d, 1, th, th^2]));
print("  /K(s3):       ", lindep([d, 1, th, th^2, s3, th*s3, th^2*s3]));
\\ also delta = 3(th^2+2th+2): sqrt(delta) basis
sd = sqrt(3*(th^2 + 2*th + 2));
print("--- K(sqrt(delta)) tests:");
print("  a: ", lindep([a, 1, th, th^2, sd, th*sd, th^2*sd]));
print("  b: ", lindep([b, 1, th, th^2, sd, th*sd, th^2*sd]));
print("  d: ", lindep([d, 1, th, th^2, sd, th*sd, th^2*sd]));
}
quit
