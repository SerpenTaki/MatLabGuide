clear all;
clc;

x = 1.2e-5;
s = linspace(x - 1e-6, x + 1e-6, 2000);

% Definizione delle funzioni
y_1 = @(x) (1 - cos(x)) ./ x.^2;
y_2 = @(x) (1/2) * ((sin(x/2)).^2 ./ (x/2).^2);

% Valutazione delle funzioni su tutto il vettore s
y1_vals = y_1(s);
y2_vals = y_2(s);

% Grafico
figure(1)
semilogy(s, y1_vals, "-r", 'DisplayName', 'y_1(x)');
hold on;
semilogy(s, y2_vals, "-b", 'DisplayName', 'y_2(x)');
legend;
xlabel('x');
ylabel('y');
title('Confronto tra y_1(x) e y_2(x)');
hold off;
