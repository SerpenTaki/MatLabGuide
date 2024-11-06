function s = norme_varie(x,p)

[n1, n2] = size(x);

    if (p==1) %norma 1
        if(n1 == 1) || (n2 == 1) %norma vettoriale
            s = sum(abs(x));
        else %norma matriciale
            s = max(sum(abs(x),1));
        end
    elseif( p == 2)
        if(n1 == 1) || (n2 == 1) %norma vettoriale
            s = sqrt(sum(abs(x).^2));
        else %norma matriciale
            e = eig(x'*x);
            s = sqrt(max(abs(e)));
        end
    elseif(lower(p)=='inf') %norma infinito
        if(n1 == 1) || (n2 == 1) %norma vettoriale
            s = max(abs(x));
        else %norma matriciale
            s = max(sum(abs(x),2));
        end
    else
        error('Il parametro p non è tra quelli ammissibili');
    end
end