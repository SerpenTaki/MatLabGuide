function [x,errs,iter]=jacobi(A,x,b,max_iter,tol)
%
% Input:
%            A          matrice n x n non singolare
%            x          approssimazione iniziale della soluzione 
%            b          vettore noto
%            max_iter   numero massimo di iterazioni
%            tol        tolleranza del metodo
% Output:  
%            x          approssimazione della soluzione
%            errs:      errore relativo di uno step 
%            iter:      numero di iterazioni del metodo

M = diag(diag(A));

if det(M) == 0
    error('Metodo di Jacobi non applicabile');
end

N = M - A;

for iter=1:max_iter                       
    x_old = x;
    x     = M\(N*x_old+b);                % nuova iterazione
    errs(iter) = norm(x-x_old)/norm(x);   % stima errore relativo
    if (errs(iter) <= tol)
        return
    end  
end
end   



