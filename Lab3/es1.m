clear all;
clc;

x = linspace(-1e-10, 1e-10, 20000);
y_exact = 1;
y =((1+x)-1)./x;

err_ass = abs(y-y_exact);
err_rel = err_ass./abs(y_exact);

figure(1);
plot(x,y);
title("valore di f(x)");
xlabel('x');

figure(2);
semilogy(x,err_rel);
title("errore relativo");
xlabel('x');