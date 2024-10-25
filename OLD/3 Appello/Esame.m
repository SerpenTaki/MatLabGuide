
a = -1; 
b = 1;
x_eval = linspace(a,b,200);
f = @(x) exp(-1./x.^2);

x1 = equi_pts(a,b,10);
x2 = cheb1_pts(a,b,10);
x3 = cheb2_pts(a,b,10);

figure(1)
plot(x1,ones(size(x1)),'bo')
hold on
plot(x2,zeros(size(x1)),'ro')
plot(x3,-ones(size(x1)),'go')
legend('Equi','Cheby1','Cheby2')
grid on
axis([-1 1 -2 2])

Nmax = 25;

for n = 1:Nmax
    x1 = equi_pts(a,b,n);
    x2 = cheb1_pts(a,b,n);
    x3 = cheb2_pts(a,b,n);
    
    y1 = f(x1);
    y2 = f(x2);
    y3 = f(x3);

    coeff1=polyfit(x1,y1,n-1);
    t1=polyval(coeff1,x_eval);
    
    coeff2=polyfit(x2,y2,n-1);
    t2=polyval(coeff2,x_eval);
    
    coeff3=polyfit(x3,y3,n-1);
    t3=polyval(coeff3,x_eval);

    err1(n) = max(abs(t1-f(x_eval)));
    err2(n) = max(abs(t2-f(x_eval)));
    err3(n) = max(abs(t3-f(x_eval)));
end

figure(2)
semilogy(1:Nmax,err1,'bo-')
hold on
semilogy(1:Nmax,err2,'ro-')
semilogy(1:Nmax,err3,'go-')
legend('Equi','Cheby1','Cheby2')