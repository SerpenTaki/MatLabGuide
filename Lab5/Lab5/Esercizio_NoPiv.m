
N = 2:2:20;
epsilon = 1e-15;

for n = N
    % Generando n punti in [-1,1]
    z = linspace(-1,1,n);
    % Generando la matrice di Vandermonde e la matrice A
    V = vander(z);
    A = V + epsilon*eye(n);
    % Generando il termine b
    b = A*ones(n,1);

    % Decomposizioni LU
    [Lnopiv, Unopiv] = LUnoPiv(A);
    [L,U,P] = lu(A);

    % Risoluzione del sistema
    y = L\(P*b);
    x = U\y;
    y_nopiv = L\b;
    x_nopiv = U\y_nopiv;
    % Calcolo degli errori
    err_sol(n/2) = norm(x-ones(n,1));
    err_solNopiv(n/2) = norm(x_nopiv - ones(n,1));
    err_U(n/2) = norm(U-triu(U));
    err_Unopiv(n/2) = norm(Unopiv-triu(Unopiv));

end

figure(1)
semilogy(N,err_sol,'r-o')
hold on
semilogy(N,err_solNopiv,'b-o')
legend('Piv', 'NoPiv', 'Location', 'SouthEast')

figure(2)
semilogy(N,err_U,'r-o')
hold on
semilogy(N,err_Unopiv,'b-o')
legend('Piv', 'NoPiv', 'Location', 'SouthEast')