## ESAME
```
f = @(x) exp(x)./(exp(2*x)+1);

sol = atan(exp(1)) - pi/4;

a = 0; b = 1;

Nmax = 15;

for N=1:Nmax

[xt,wt] = trapezi_composta(a,b,N);

[xs,ws] = simpson_composta(a,b,N);

[xs38,ws38] = simpson38_composta(a,b,N);

[xb,wb] = boole_composta(a,b,N);

It = wt*f(xt);

Is = ws*f(xs);

Is38 = ws38*f(xs38);

Ib = wb*f(xb);

err_trape(N) = abs(sol - It);

err_simps(N) = abs(sol - Is);

err_simps38(N) = abs(sol - Is38);

err_boole(N) = abs(sol - Ib);

end

semilogy(1:Nmax,err_trape,'bo-')

hold on;

semilogy(1:Nmax,err_simps,'ro-')

semilogy(1:Nmax,err_simps38,'go-')

semilogy(1:Nmax,err_boole,'ko-')

legend('Trapezi','Simpson','Simpson3/8', 'Boole')
```
## Funzioni DATE
```
function [x,w] = trapezi_composta(a,b,N)

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

h = (b-a)/N;

% nodi di integrazione

x = a:h:b; x = x';

% pesi di integrazione

w = ones(1,N+1);

w(1) = 1/2; w(end) = 1/2;

w = h*w;

end


function [x,w] = simpson_composta(a,b,N)

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

h = (b-a)/(2*N);

% nodi di integrazione

x = a:h:b; x=x';

% pesi di integrazione

w = zeros(1,2*N+1);

% primo e ultimo peso

w(1) = h/3 ;

w(end) = h/3;

% pesi di indice pari

ind_pari = 2:2:2*N;

w(ind_pari) = 4*h/3;

% pesi di indice dispari

ind_disp = 3:2:2*N-1;

w(ind_disp) = 2*h/3;

% Pesi descritti in una riga:

% w=h.*[1,repmat([4 2],1,N−1),4,1]./3;

function [x,w] = simpson38_composta(a,b,N)

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

h = (b-a)/(3*N);

% nodi di integrazione

x = a:h:b; x=x';

% pesi di integrazione

w=3*h/8*[1,repmat([3 3 2],1,N-1),3,3,1];

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
```