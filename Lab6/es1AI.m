% Definizione della funzione
f = @(x) exp(-2*x.^3) + x.^2 + 7*x.^3;

% Input: grado massimo del polinomio interpolante
n = input('Inserire il grado massimo del polinomio interpolante n: ');

% Nodi equispaziati in [-1, 1]
x = linspace(-1, 1, n + 1);

% Valori della funzione nei nodi
y = f(x);

% Punti di valutazione in [-1, 1]
s = linspace(-1, 1, 500);

% Calcolo del polinomio interpolante
p = polyfit(x, y, n); % Coefficienti del polinomio interpolante
interp_values = polyval(p, s); % Valutazione del polinomio interpolante

% Valutazione della funzione nei punti di valutazione
f_values = f(s);

% Grafico
figure;
plot(s, f_values, 'b', 'LineWidth', 1.5); % Funzione f in blu
hold on;
plot(s, interp_values, 'r--', 'LineWidth', 1.5); % Polinomio interpolante in rosso tratteggiato
legend('f(x)', 'Polinomio interpolante');
xlabel('x');
ylabel('y');
title('Interpolazione polinomiale');
grid on;
hold off;

% Calcolo dell'errore assoluto massimo
errore_assoluto_max = max(abs(f_values - interp_values));
fprintf('Errore assoluto massimo: %.5f\n', errore_assoluto_max);
