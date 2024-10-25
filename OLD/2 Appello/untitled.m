clear all;
close all;
clc

f = @(x) cos(2*x).^2 - x.^2;
Df = @(x) -2*sin(4*x)- 2*x;
D2f = @(x) -8*cos(4*x) - 2;

a = 0;
b = 1;
x0 = 0.1;
tol = 1e-8;
nMax = 1000;

x = linspace(a, b, 100);
sol = fzero(f, 0.5);

figure(1)
plot(x, f(x), "b");
hold on
plot(x, Df(x), "-.r");
plot(x, D2f(x), "--k");
plot(sol, f(sol), "bo", "MarkerFaceColor","g");
title("Grafico delle funzioni");
legend("f(x)", "Df(x)", "D2f(x)");
axis([a b -7 7]);
grid on;

[xC, xallC, iterC] = corde(f,a,b,x0,tol,nMax);
[xB, xallB, iterB] = bisezione(f, a, b,tol, nMax);
[xN, xallN, iterN] = newton(f, Df, x0, tol, nMax);
[xS, xallS, iterS] = schroeder(f, Df, D2f, x0, tol, nMax);

fprintf("\niterate corde:\t\t %d", iterC);
fprintf("\niterate bisezione:\t\t %d", iterB);
fprintf("\niterate newton:\t\t %d", iterN);
fprintf("\niterate schroeder:\t\t %d", iterS);

errC = abs(sol - xallC);
errB = abs(sol - xallB);
errN = abs(sol - xallN);
errS = abs(sol - xallS);

figure(2)
title("Errore corda e bisezione");
semilogy(1:iterC, errC, "o-b");
hold on
semilogy(1:iterB, errB, "o-r");
legend("Errore corda", "Errore bisezione");

figure(3)
semilogy(1:iterN, errN, "o-g");
hold on
semilogy(1:iterS, errS, "o-k");
legend("Errore Newton", "Errore Schroeder");

fprintf("\n Soluzione ottenuta con il metodo di shroeder: %1.6f\n", xS);