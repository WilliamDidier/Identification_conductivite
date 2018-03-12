function [x]=remonte(ldinf, ldiag, z)
    n = size(z, "*")
    x = zeros(n,1)
    
    x(n) = z(n)/ldiag(n)
    
    for i = 1:n-1
        x(n-i)=(z(n-i)-ldinf(n-i)*x(n-i+1))/ldiag(n-i)
    end
    
endfunction
