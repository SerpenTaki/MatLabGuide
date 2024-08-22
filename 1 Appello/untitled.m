clc
clear all


f = @(x) exp(x)./(exp(2*x)+1);

sol = atan(exp(1)) - pi/4;

a = 0; b = 1;
Nmax = 15;

for N=1:Nmax
    [xt,wt] = trapezi_composta(a,b,N);
    [xs,ws] = simpson_composta(a,b,N);
    [xs38,ws38] = simpson38_composta(a,b,N);
    [xb,wb] = boole_composta(a,b,N);
    It = wt*f(xt);
    Is = ws*f(xs);
    Is38 = ws38*f(xs38);
    Ib = wb*f(xb);

    err_trape(N) = abs(sol - It);
    err_simps(N) = abs(sol - Is);
    err_simps38(N) = abs(sol - Is38);
    err_boole(N) = abs(sol - Ib);
end

semilogy(1:Nmax,err_trape,'bo-')
hold on;
semilogy(1:Nmax,err_simps,'ro-')
semilogy(1:Nmax,err_simps38,'go-')
semilogy(1:Nmax,err_boole,'ko-')
legend('Trapezi','Simpson','Simpson3/8', 'Boole')