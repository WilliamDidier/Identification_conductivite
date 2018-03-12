function [ldinf, ldiag]=factorise(diago, sdiag)
    n = size(diago, "*")
    
    ldinf = zeros(1,n-1)
    ldiag = zeros (1,n)
    
    ldiag (1) = sqrt(diago(1))  
    
    for i = 2:n
        ldinf(i-1) = sdiag(i-1)/ldiag(i-1)
        ldiag(i) = sqrt(diago(i)-ldinf(i-1)^2)
    end
    
endfunction
