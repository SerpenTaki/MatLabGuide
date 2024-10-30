clear all;
clc;
I = zeros(1,26);
I(1) = (exp(1)-1)/exp(1);

for n = 2:26
    I(n) = 1 -(n-1)*I(n-1);
end

figure(1)
semilogy(0:25,I, 'r-o');
title("Grafico in scala");