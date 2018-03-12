function [z]=descente(ldinf, ldiag, y)
    n = size(y,"*")
    z = zeros(n,1)
    z(1) = y(1)/ldiag(1)
    for  i = 2:n
        z(i) = (y(i)-ldinf(i-1)*z(i-1))/ldiag(i)
    end
endfunction
