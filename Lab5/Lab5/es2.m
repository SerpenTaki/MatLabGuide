clear all;
clc;

A = zeros(50,50);  % Initialize the 50x50 matrix
b = zeros(50,1);   % Initialize the 50x1 vector
x0 = zeros(50,1);
itMax = 200;
toll = 1e-8;
N = 50;            % Size of the matrix

for i = 1:N
    for j = 1:N
        if i == j
            A(i,j) = 1;      % Diagonal elements
        elseif j == (i + 1)
            A(i,j) = -1/3;   % Upper diagonal
        elseif j == (i - 1)
            A(i,j) = 1/3;    % Lower diagonal
        end
    end
    if(i == 1)
        b(i) = 1;
    else
        b(i) = b(i-1) + 1;
    end
end

[xR, errR , itR ] = richardson(A,x0,b,itMax,toll);
vMaxR = max(abs(1 - eig(A)));
disp(vMaxR);
disp(itR);

[J, errJ, itJ] = jacobi(A,x0, b, itMax,toll);

disp(itJ);

[GS, errGS, itGS] = gauss_seidel(A,x0,b,itMax,toll);

disp(itGS);
