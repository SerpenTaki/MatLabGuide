function demo_quadratura()
    a = 0;
    b = 1;

    f = @(x) 1./(x+1);
    sol = log(2); %soluzione esatta

    sT = (b-a)/2 * (f(a)+f(b)); %soluzione Trapezi

    sS = (b-a)/6 *(f(a) + 4*f((a+b)/2)+ f(b)); %soluzione Simpson-Cavalieri

    errT = abs(sol-sT); 
    errS = abs(sol-sS);

    fprintf("La soluzione Trapezi è %1.4e\n", errT);
    fprintf("La soluzione Simpson è %1.4e\n", errS);
end