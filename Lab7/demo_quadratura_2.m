function demo_quadratura_2()
    N = 20;
    a = 0;
    b = 1;
    f = @(x) 1./(x+1);
    sol = log(2); %soluzione esatta
    for n = 1:N
        [xT, wT] = trapezi_composta(a,b,n);
        [xS, wS] = simpson_composta(a,b,n);
        S_T(n) = wT*f(xT);
        S_CS(n) = wS * f(xS);
    end
    
    err_ass_T = abs(S_T - sol);
    err_ass_S = abs(S_CS -sol);

    figure(1)
    semilogy(1:N,err_ass_T,'ko-');
    hold on;
    semilogy(1:N, err_ass_S, 'ro-');

end