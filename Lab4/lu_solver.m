function x = lu_solver(A,b);
    
    [L,U,P] = lu(A);
    
    y=L\(P*b);

    x = U\y;

end