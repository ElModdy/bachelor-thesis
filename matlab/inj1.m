function [r] = inj1(x1,x2,k) %x1 in [0,1], x2 in (0,+inf)
    x1=x1*4*pi;
    if x1<pi/2
        r=exp(1i*x1)*(1+x2)+pi/(2*k);
    elseif x1<3/2*pi
        r=1i*(1+x2)-(x1-pi)/k;
    elseif x1<2*pi+pi/2
        r=exp(1i*(x1-pi))*(1+x2)-pi/(2*k);
    elseif x1<3*pi+pi/2
        r=-1i*(1+x2)+(x1-3*pi)/k;
    else
        r=exp(1i*(x1-4*pi))*(1+x2)+pi/(2*k);
    end
end