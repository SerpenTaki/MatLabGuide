clc;
clear all;

% Parametri iniziali
n = 100;                % Numero di punti
x = linspace(-5, 5, n)'; % Vettore x in [-5, 5], vettore colonna
f = sin(2*x) - x.^2;    % Funzione f(x)
y = f + 0.5 * rand(size(f)); % Aggiunta di rumore a f

% Grado del polinomio
d = 8;

% Costruzione della matrice di Vandermonde V
V = zeros(n, d+1);
for j = 0:d
    V(:, j+1) = x.^j; % Ogni colonna è una potenza di x
end

%% 1. Risoluzione con le Equazioni Normali
A = V; % A = V per chiarezza
AtA = A' * A;
Aty = A' * y;
a_normali = AtA \ Aty; % Risoluzione sistema con equazioni normali

% Calcolo del condizionamento di AtA
cond_AtA = cond(AtA);
fprintf('Condizionamento della matrice AtA: %.2e\n', cond_AtA);

%% 2. Risoluzione con la Decomposizione QR
[Q, R] = qr(A, 0); % Decomposizione QR (fattorizzazione economica)
a_qr = R \ (Q' * y); % Risoluzione del sistema tramite QR

% Stampa della matrice R
disp('Matrice R della decomposizione QR:');
disp(R);

%% 3. Grafici
% Polinomio approssimante con equazioni normali
y_normali = polyval(flip(a_normali), x);

% Polinomio approssimante con QR
y_qr = polyval(flip(a_qr), x);

% Grafico 1: Funzione originale vs approssimazione con equazioni normali
figure;
plot(x, f, 'g', 'LineWidth', 1.5); hold on;
plot(x, y_normali, 'r--', 'LineWidth', 1.5);
legend('Funzione originale f(x)', 'Approssimazione - Equazioni Normali');
title('Approssimazione tramite Equazioni Normali');
xlabel('x');
ylabel('f(x)');
grid on;

% Grafico 2: Funzione originale vs approssimazione con QR
figure;
plot(x, f, 'g', 'LineWidth', 1.5); hold on;
plot(x, y_qr, 'b--', 'LineWidth', 1.5);
legend('Funzione originale f(x)', 'Approssimazione - Decomposizione QR');
title('Approssimazione tramite Decomposizione QR');
xlabel('x');
ylabel('f(x)');
grid on;
