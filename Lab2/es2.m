function [v] = es2(x) %%bisogna che la funzione abbia lo stesso nome del file

    if x == 0
        fprintf("Input uguale a zero!\n");
        v = 0;
    elseif x < 0
        v = -1;
    else
        v = 1;
    end

end