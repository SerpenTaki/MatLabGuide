clear all;
clc;

f = @(x) sin(x);
t = linspace(0,2*pi,100);
p = @(x) x-((x.^3)/6);

err_ass = @(x) abs(f(x)-p(x));

figure(1)
plot(t,f(t), '-b');
hold on
plot(t,p(t), "--r");
grid on
legend('f(x)', 'p(x)', location='southwest')

figure(2)
plot(t,err_ass(t), '-k');
grid on
title('Errore assoluto')

figure(3)
semilogy(t,err_ass(t));
grid on
title('Errore assoluto in scala semilogaritmica')