y_1 = @(x) (1-x).^6;
y_2 = @(x) x.^6 - 6*x.^5 + 15*x.^4 - 20*x.^3 + 15*x.^2 - 6*x + 1;

d1 = 0.1;
d2 = 0.01;
d3 = 0.005;
d4 = 0.0025;

s1 = linspace(1-d1, 1+d1, 100);
s2 = linspace(1-d2, 1+d2, 100);
s3 = linspace(1-d3, 1+d3, 100);
s4 = linspace(1-d4, 1+d4, 100);

figure(1);
semilogy(y_1(s1),'-k');
hold on;
semilogy(y_2(s1),'-r');
title("con 0.1");
hold off;

figure(2);
semilogy(y_1(s2),'-k');
hold on;
semilogy(y_2(s2),'-r');
title("con 0.01");
hold off;

figure(3);
semilogy(y_1(s3),'-k');
hold on;
semilogy(y_2(s3),'-r');
title("con 0.005");
hold off;


figure(4);
semilogy(y_1(s4),'-k');
hold on;
semilogy(y_2(s4),'-r');
title("con 0.0025");
hold off;