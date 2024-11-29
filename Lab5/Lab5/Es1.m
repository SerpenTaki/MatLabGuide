clear all;
clc;

N = 2:2:20;
epsilon = 1e-15;

for n = N
    z = linspace(-1;1;n);
    V = vander(z);
    A = V + epsilon*eye(n);
    b = A*ones(n,1);

    %Decomposizioni
    [LP,UP] = LUnoPiv(A);
    [L,U,P] = lu(A);

    y = L\(P*b);
    x = U\y;
    y_nopiv = L\b;
    x_nopiv = U\y_nopiv;

    err_sol(n/2) = norm(x_nopiv - ones(n,1));
    err_U(n/2) = norm(U-triu(U));