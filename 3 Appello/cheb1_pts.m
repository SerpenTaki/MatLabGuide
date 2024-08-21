function x = cheb1_pts(a,b,n)
% ---------------------------------
% Input
% a,b : valore degli estremi dell'intervallo
% n   : numero di punti da generare
% 
% Output
% x   : vettore contenente i punti Chebyshev nell'intervallo [a,b]
% ---------------------------------

x = cos((2*[0:n-1]+1)*pi/(2*n));

x = (b-a)*(x+1)/2 + a;

end