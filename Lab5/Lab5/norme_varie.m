function s = norme_varie(x,p)

% Funzione che dato un vettore o una matrice, calcola le norme 1,2 o
% infinito di tale elemento
% ---- input ----
% x : vettore o matrice
% p : parametro per determinare la norma, 1, 2 o 'Inf' o 'inf'
% ---- output ----
% s : valore della norma di x
% -------------------------------------------------------------------------

% Calcolo delle dimensioni di x
[n1, n2] = size(x);

% Controllo su parametro p
if (p==1) % norma 1
    % Controllo sulle dimensioni di x per calcolare la norma vettoriale o
    % matriciale
    if(n1 == 1) || (n2 == 1) % norma vettoriale
        s = sum(abs(x));
    else % norma matriciale
        s = max(sum(abs(x),1)); % A = [1,2,3;4,5,6] A(2,:) = [4,5,6] A(:,2) = [2;5]
    end
elseif (p==2) % norma 2
    if(n1 == 1) || (n2 == 1) % norma vettoriale
        s = sqrt(sum(abs(x).^2));
    else % norma matriciale
        e = eig(x'*x);
        s = sqrt(max(abs(e)));
    end
elseif (lower(p)=='inf') % norma infinito
    if(n1 == 1) || (n2 == 1) % norma vettoriale
        s = max(abs(x));
    else % norma matriciale
        s = max(sum(abs(x),2));
    end
else % errore per parametro p non tra quelli richiesti
    error('Il parametro p non è tra quelli ammissibili per la function!')
end

end