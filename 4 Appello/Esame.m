clear all
clc

for n=1:50
    cond1(n) = cond(genmatHilb(n),1);
    cond2(n) = cond(genmatmin(n),1);
    cond3(n) = cond(genmatmax(n),1);
end

[MaxCond,idx] = max([cond1',cond2',cond3']);
[M, jdx] = max(MaxCond);

fprintf('\n \t Condizionamento massimo ottenuto con il tipo %d di Matrice \n',jdx)
fprintf('\t di dimensione n=%d e con il valore %2.2e \n',idx(jdx),M)

figure(1)
semilogy(1:50,cond1,'ro-');
hold on;
semilogy(1:50,cond2,'bo-')
semilogy(1:50,cond3,'ko-')
grid on
legend('Matrice Hilbert','Matrice Min','Matrice Max')

A100 = genmatHilb(100);
x_exact = 9*ones(100,1);
b = A100*x_exact;

[L,U] = lu(A100);

c = L\b;
x1 = U\c;

err_max = norm(x1 - x_exact)/norm(x_exact);

fprintf('\n \t Errore relativo tra la soluzione esatta e la soluzione approssimata: %2.3e \n',err_max)
