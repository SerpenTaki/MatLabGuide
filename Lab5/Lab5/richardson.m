function [x,errs,iter]=richardson(A,x,b,max_iter,tol)

N = eye(size(A)) - A;

for iter=1:max_iter                       
    x_old = x;
    x     = N*x_old+b;                % nuova iterazione
    errs(iter) = norm(x-x_old)/norm(x);   % stima errore relativo
    if (errs(iter) <= tol)
        return
    end  
end
end   

