Iniziamo con alcuni comandi di base
```Matlab
2 + 9 %Somma
3 - 5 %Sottrazione
2 * (-6) %Prodotto
1 / 16 %Divisione
6^7 %Potenza
```
##### Numeri speciali

| Numero | Significato             |
| ------ | ----------------------- |
| +Inf   | + infinito `5/0`        |
| NaN    | numero indefinito `0/0` |
| pi     | pi greco                |
| -Inf   | - infinito `-5/0`       |
| eps    | precisione di macchina  |
| i      | unità immaginaria       |
##### Funzioni utili

| Simbolo | Significato          | Caratteristiche                                                                          |
| ------- | -------------------- | ---------------------------------------------------------------------------------------- |
| `sign`  | segno                |                                                                                          |
| `sqrt`  | radice quadrata      |                                                                                          |
| `cos`   | coseno               |                                                                                          |
| `cotan` | cotangente           |                                                                                          |
| `acos`  | arcocoseno           |                                                                                          |
| `log`   | logaritmo naturale   |                                                                                          |
| `log2`  | logaritmo base 2     |                                                                                          |
| `floor` | parte intera         |                                                                                          |
| `abs`   | valore assoluto      |                                                                                          |
| `sin`   | seno                 |                                                                                          |
| `tan`   | tangente             |                                                                                          |
| `asin`  | arcoseno             |                                                                                          |
| `exp`   | esponenziale         | exp richiede un argomento quindi se vogliamo rappresentare $e$ bisogna scrivere `exp(1)` |
| `log10` | logaritmo in base 10 |                                                                                          |
| `round` | arrotondamento       |                                                                                          |
| `ceil`  | parte intera + 1     |                                                                                          |
###### Comandi utili
- `clc` pulisce la command window
- `clear all` pulisce tutte le variabile
- `%` permette di fare i commenti del codice
- `disp`mostra il contenuto di una variabile
```Matlab
 >> a = 10 % <nome_variabile> = <valore>
 >> s = 'valore stringa';
 >> disp(s)
	 valore stringa
```
- Per mostrare una stringa a schermo è possibile usare il comando `fprintf`
```Matlab
a = 3000*pi;

fprintf('\n \t Formato decimale con 2 cifre dopo la virgola: %.2f', a);

% \n e \t funzionano come C

fprintf('\n \t Formato esponenziale con 4 cifre dopo la virgola: %.4f', a)
```
```Terminale
>>untitled
	Formato decimale con 2 cifre dopo la virgola: 9424.78  
	Formato esponenziale con 4 cifre dopo la virgola: 9424.7780
```
In Matlab, un vettore con n componenti è rappresentato come una matrice n × 1 o 1 × n (vettore colonna o riga). L’operazione di trasposizione si ottiene con l’apostrofo ’. Una variabile numerica scalare è interpretata come un vettore 1 × 1 (lo si vede anche nel workspace). Usando le virgole cambio colonna, con ; cambio riga. Dobbiamo usare le parentesi quadre.
![[Screenshot 2024-08-21 alle 14.49.18.png]]
- La funzione `linspace(a,b,n)` ci permette di definire un vettore di n componenti che spazia da `a` a `b`.
- Il costrutto `a:s:b` definisce un vettore i cui valori partono da `a` e continuano di passo `s` fino al massimo valore minore o uguale di `b`.
###### Vettori concatenati
```
u = [v, w] %concatenazione vettore di riga = 1

s = [p; r] %concatenazione vettore di colonna = 1
```
#### Matrici
`A = [1,2,3;4,5,6]`
$$
A = \begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6
\end{pmatrix}
$$
**Comandi utili**
- `zeros(m,n)` crea una matrice di $m \times n$ zeri
- `ones(m,n)` crea una matrice di $m \times n$ zeri
- `eye(n)` crea una matrice identità $n \times n$
**Funzioni utili**
- `length(v)`ci restituisce il numero di componenti di $v$
- Se $A$ è una matrice `size(A)` ci restituisce le dimensione di A. È possibile aggiungere un input opzionale successivo per specificare la dimensione della matrice `size(A,2)` che restituisce il numero di colonne di $A$.
- Se $v$ è un vettore, scrivendo `v(1)`accediamo all'i-esimo elemento ⚠️ considera che gli indici partono dal valore 1
- Se $A$ è una matrice, scrivendo `A(i, j)`, accediamo all'elemento `(i, j)-esimo`
Alcune funzioni matematiche possono essere applicate in modo vettoriale. se v è un vettore è possibile usare `sin(v)`e restituire i valori del seno calcolato in quei punti

alcune operazioni tra vettori possono condurre a scritture ambigue. Se scrivo `*`, si intende il prodotto componente per componente (o puntuale) oppure, per esempio, un prodotto scalare?
Siano $v$ e $w$ matrici o vettori di stessa dimensione

| Operazione | Effetto                        |
| ---------- | ------------------------------ |
| `v+w`      | somma dei 2 vettori            |
| `v-w`      | differenza dei 2 vettori       |
| `v.*w`     | prodotto puntuale dei vettori  |
| `v./w`     | divisione puntuale dei vettori |
| `v.^w`     | elevamento a potenza           |
## Funzioni personalizzate
Possiamo costruire in matlab delle *anonymous functions* ad esempio `f`la funzione:
$$
f(x) = sin^2(x) +2log(x^2+1)
$$
il costrutto per le *anonymous functions* è 
```pseudo
	Nome_Variabile = @(variabili) Funzione(Variabili)
```
```Matlab
	f = @(x) (sin(x)).^2 + 2.*log(x.^2+1)
```

#### Plot
Per rappresentare funzioni e risultati ottenuti tramite dei grafici.
```Matlab
f = @(x) log(x+1)-x.^2;
g = @(x) x-2;

x = linspace(0,5,200);
y_1 = f(x);
y_2 = g(x);

plot(x, y_1, '-k', x, y_2, '-b')%-k black , -b blue
grid on % Attiva griglia
```
Il comando `plot(x,y,x,z)`permette di sovrapporre più grafici contemporaneamente, nel caso non bastasse il comando `hold on`lo sovrappone al successivo e `hold off`fa il contrario.
`figure` invece prima del plot ha l'effetto di determinare una nuova finestra per il plot. In Questo modo è comodo generare più grafici senza sovrapposizioni.

Il comando `semilogy(x,y)`permette di costruire un grafico in scala semilogaritmica *usato generalmente per l'errore dato che sono cose piccole e non si capisce bene cosa succede*.
# Function Script
Una Function è un file Matlab (.m) che inzia con 
`function [<output>] = <nome_funzionante>(<input>)`
e termina con `end`

```Matlab
%File sum_diff.m
function [sum,diff] = sum_diff(a,b)

sum = a + b;
diff = a - b;

end
% File Script nella stessa directory del file funzione
x = 3;
y = 9;
[s, d] = sum_diff(x,y);
disp(s) %stampa 12
disp(d) %stampa -6
```
#### Operatori Logici *0 Falso, 1 Vero !!!!!!!!*

| Operatori | Descrizione     |
| --------- | --------------- |
| `==`      | uguale          |
| `>`       | maggiore        |
| `>=`      | maggiore uguale |
| `&&`      | and             |
| `~`       | not             |
| `~=`      | diverso         |
| `<`       | minore          |
| `<=`      | minore uguale   |
| \|\|      | or              |
*Sono tutti uguali al C tranne not e diverso che usano la tilde invece del punto esclamativo*
❗️ Non mescolate operazioni tra floating point perchè:
![[Screenshot 2024-08-21 alle 15.52.26.png]]
# Condizioni
#### Costrutto if-else
```Pseudo
if<condizione>
	<processo A>
else
	<processo B>
end
```
#### Switch case
```Pseudo
switch <espressione>
case <valore 1>
	<processo A>
case <valore 2>
	<processo B>
...
otherwise %in C o Java corrisponde a default
	<processo otherwise>
end %necessario
```

### Ciclo For e ciclo while
```Pseudo
for <variabile> = <vettore_variabile> %quando sai quanto devi iterare
	<processo>
end

while <condizione> %quando non sai quanto devi iterare
	<processo>
end
```

