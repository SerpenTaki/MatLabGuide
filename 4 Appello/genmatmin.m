function A = genmatmin(n)
% ---------------------------------
% Input
% n   : dimensione della matrice quadrata da generare
% 
% Output
% A   : matrice di dimensione nxn con elementi min(1/i,1/j)
% ---------------------------------

A = zeros(n);

for i=1:n
    A(i,1:n) = min(1/i*ones(1,n),1./[1:n]);
end


end