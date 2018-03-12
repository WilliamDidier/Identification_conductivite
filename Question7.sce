exec factorise.sce
exec remonte.sce
exec descente.sce
u0 = 1
l=10

function [adiag, adinf]=caulcu_A(u0, n)
    deltax = 2*l/n
    //On prend par convention l=10
    x = linspace(-l, l, n)
    adiag=zeros(n)
    adinf = zeros(n-1)
    adiag(1) = fonctionc(x(1)+0.5*deltax)+fonctionc(x(1)-0.5*deltax)
    for i = 2:n
        adiag(i) = fonctionc(x(i)+0.5*deltax) + fonctionc(x(i)-0.5*deltax)
        adinf(i-1) = -fonctionc(x(i-1)+0.5*deltax)
    end

endfunction

function cx=fonctionc(x,l)
    cx = exp(-x/l)
endfunction

function [norme_inf, Sol_approx] = question7()
    norme_inf=zeros(4)
    for i = 1:4
        n = 10**i;
        deltax = 2*l/n
        x = linspace(-l, l, n)
        print(%io(2), size(x))
        b=zeros(n)
        b(1)=fonctionc(-l+0.5*deltax)*u0
        [adiag, adinf]=caulcu_A(u0, n)
        [ldinf, ldiago]=factorise(adiag, adinf)
        z = descente(ldinf, ldiago, b)
        Sol_approx = remonte(ldinf, ldiago, z)
        Sol_exacte = zeros(n)
        prem_terme = -exp(2)/(1-exp(2))
        //u(x)=-e(e/(1-e²)+e/(1-e²)e(x/l)
        for j = 1:n
            Sol_exacte(j) = prem_terme + prem_terme/exp(1)*exp(x(j)/l)
        end
        Diff = abs(Sol_exacte - Sol_approx)
        print(%io(2), size(Sol_approx))
        plot(x, Sol_approx)
        norme_inf(i) = max(Diff)
    end
endfunction
