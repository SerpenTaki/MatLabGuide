function x = equi_pts(a,b,n)
% ---------------------------------
% Input
% a,b : valore degli estremi dell'intervallo
% n   : numero di punti da generare
% 
% Output
% x   : vettore contenente i punti equispaziati nell'intervallo [a,b]
% ---------------------------------

x = a + (b-a)/(n-1)*[0:n-1];

end