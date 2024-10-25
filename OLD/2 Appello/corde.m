function [x,xall,iter] = corde(f,a,b,x0,tol,max_iter)

% Metodo di bisezione per la rierca di zeri di funzione
% ----------- Inputs -------------------------------
%  f   : funzione (inline) di cui vogliamo lo zero
%  a,b : estremi dell'intervallo
%  tol : tolleranza 
%  x0 : punto iniziale
%  max_it: numero massimo di iterazioni
%------------ Outputs ------------------------------
%  x   : la soluzione
%  xall: tutti i punti medi dell'iterazione
%  iter: numero d'iterazioni fatte
%---------------------------------------------------
if f(a)*f(b) > 0 
   error('Metodo corde non applicabile');
elseif f(a)*f(b) == 0 
   error('La funzione e'' zero su uno dei bordi');
end

iter = 1;         % iter = n + 1 (nella lezione di teoria)
q = (f(b)-f(a))/(b-a);

x = x0 - f(x0)/q; % prima iterazione
xall(iter) = x;

   
while (abs(x - x0) > tol) && (iter <  max_iter)  % continua se condizioni soddisfatte
    x0 = x;
    x = x0 - f(x0)/q; % prima iterazione
    iter = iter + 1;
    xall(iter) = x;
end 