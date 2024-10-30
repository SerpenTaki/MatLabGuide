clear all;
clc;

p = 4.999999999995*10.^4;
q = 10.^(-2);
sol_esatta = 10.^(-7);

s1 = -p + (p^2 + q).^(1/2);
s2 = q/(p +((p^2 + q).^(1/2)));

fprintf("Soluzione algoritmo 1:\t %10.19f\n", s1);
fprintf("Soluzione algoritmo 2:\t %10.19f\n", s2);

err_rel_s1 = abs(s1 - sol_esatta)./abs(sol_esatta);

err_rel_s2 = abs(sol_esatta - s2)./abs(sol_esatta);

fprintf("Errore algoritmo 1:\t %2.2e\n", err_rel_s1);
fprintf("Errore algoritmo 2:\t %2.2e\n", err_rel_s2);