function [x,w] = boole_composta(a,b,N)

% Formula dei trapezi composta
% -----------------------------
% ---- input ----
% a,b : estremi di integrazione
% N : numero di subintervalli
%
% ---- output ----
% x : nodi di integrazione (vettore colonna)
% w : pesi di integrazione (vettore colonna)

% passo di integrazione
h = (b-a)/(4*N); 
% nodi di integrazione
x = a:h:b; x=x'; 
% pesi di integrazione
w=2*h/45*[7,repmat([32 12 32 14],1,N-1),32,12,32,7];
