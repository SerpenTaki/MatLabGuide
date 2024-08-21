function A = genmatHilb(n)
% ---------------------------------
% Input
% n   : dimensione della matrice quadrata da generare
% 
% Output
% A   : matrice di Hilbert di dimensione nxn
% ---------------------------------

A = zeros(n);

for i=1:n
    A(i,1:n) = (i+[1:n]-1).^(-1);
end


end