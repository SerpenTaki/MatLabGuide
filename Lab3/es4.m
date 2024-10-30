clear all;
clc;

n = 100;

Sn1(1) = 1;

for i = 2:n
    Sn1(i) = Sn1(i-1) + (1./i^2);
end

% Sn1 = cumsum(1./((1:n).^2));

SN1 = sqrt(6*Sn1);

err_rel_SN1 = abs(SN1-pi)/abs(pi);

figure(1);
semilogy(1:n,err_rel_SN1,'-.k');

x(1) = 2;

for i = 3:n
    x(i-1) = 2^((i-1)-1/2) * sqrt(1-sqrt(1-4.^(1-(i-1))*x(i-2)^2));
end    

y(1) = 2;

for i = 3:n
    y(i-1) = sqrt(2)*(y(i-2)) / sqrt(1+sqrt(1-4.^(1-(i-1))*x(i-2)^2));
end    

err_rel_1 = abs(x-pi)/abs(pi);
err_rel_2 = abs(y-pi)/abs(pi);

hold on;
semilogy(1:(n-1), err_rel_1, '-.b');
semilogy(1:(n-1), err_rel_2, '-.r');