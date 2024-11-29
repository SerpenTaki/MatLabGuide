clear all;
% settings
n = 10;
A = diag(ones(n,1)) + diag(-ones(n-1,1)/3,1) + diag(ones(n-1,1)/3,-1);
b=[1:n]';

% Criteri di convergenza per Richardson, Jacobi e Gauss-Seidel
convRic = max(abs(1-eig(A)));

M = diag(diag(A));
N = M - A;
J = M\N;
convJac = max(abs(eig(J)));

M = diag(diag(A))-tril(A,-1);
N = -triu(A,1);
GS = M\N;
convGS = max(abs(eig(GS)));

% Parametri delle funzioni
tol=10^(-8);
max_it=200;
x0=zeros(n,1);

% Richardson
[x_ric, err_ric, iter_ric]  = richardson(A, x0, b, max_it, tol);
% Jacobi
[x_jac, err_jac, iter_jac]  = jacobi(A, x0, b, max_it, tol);
% Gauss-Seidel
[x_gs, err_gs, iter_gs]  = gauss_seidel(A, x0, b, max_it, tol);


fprintf('\n \t Le iterate del metodo di Richardson  : %3d\n',iter_ric);
fprintf('\n \t Le iterate del metodo di Jacobi:       %3d \n',iter_jac);
fprintf('\n \t Le iterate del metodo di Gauss-Seidel: %3d \n',iter_gs);

fprintf('\n----------------------------------------------------------\n')
fprintf('\n \t Massimo dei |1+eig(A)| : %1.2e \n',convRic)
fprintf('\n \t Massimo dei |eig(J)|   : %1.2e \n',convJac)
fprintf('\n \t Massimo dei |eig(GS)|  : %1.2e \n',convGS)



