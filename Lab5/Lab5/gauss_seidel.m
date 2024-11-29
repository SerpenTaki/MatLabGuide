function [x,errs,iter]=gauss_seidel(A,x,b,max_iter,tol)


M = diag(diag(A))-tril(A,-1);

if det(M) == 0
    error('Metodo di Gauss-Seidel non applicabile');
end

N = -triu(A,1);

for iter=1:max_iter                       
    x_old = x;
    x     = M\(N*x_old+b);                % nuova iterazione
    errs(iter) = norm(x-x_old)/norm(x);   % stima errore relativo
    if (errs(iter) <= tol)
        return
    end  
end
end   

