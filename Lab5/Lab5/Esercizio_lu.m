clear all;
clc;

A1 = magic(9);

b1 = [910; 1034; 1113; 1264; 1172; 981; 1060; 941; 750];

x_exact1 = A1\b1;

x1 = lu_solver(A1,b1);

dif1 = norm(x1-x_exact1);







%% 


A2 = magic(10);

b2 = A2*[1:10]';

x_exact2 = [1:10]';

x2 = lu_solver(A2,b2);

dif2 = norm(x2-x_exact2);