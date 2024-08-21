function x = cheb2_pts(a,b,n)
% ---------------------------------
% Input
% a,b : valore degli estremi dell'intervallo
% n   : numero di punti da generare
% 
% Output
% x   : vettore contenente i punti di Chebyshev-Lobatto nell'intervallo [a,b]
% ---------------------------------

x = cos([0:(n-1)]*pi/(n-1));

x = (b-a)*(x+1)/2 + a;

end