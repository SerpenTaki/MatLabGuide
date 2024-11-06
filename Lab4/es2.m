A = magic(9);
b = [910;1034;1113;1264;1172;981;1060;941;750];
s = lu_solver(A,b);

sol = A\b;
disp(sol);
disp(s);