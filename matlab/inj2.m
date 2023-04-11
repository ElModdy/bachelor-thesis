function [r] = inj2(a,y) %x1,x2 in (0,+inf)
    if y==0
        r=-1i-1;
    elseif y<pi/2
        x=y/(pi/2);
        fix=sqrt(x);%(exp(-1/(2*x-x^2)+1));
        r=exp(1i*(y-pi/2))*(1+a*fix)-1;
    else
        r=1i*(y-pi/2)+a;
    end
end