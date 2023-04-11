function [p] = inj3d(x,y,a,gap_active)
    if gap_active
        gap=abs(imag(exp(1i*acos(x))));
        y=y-gap;
    end
    x=x+1/2;
    a=(a+pi)/(2*pi);
    p=zeros(3,1);
    t=inj2(a,y);
    p(3)=imag(t);
    at=real(t);
    t=inj1(x,at,0.7);
    p(1)=real(t);
    p(2)=imag(t);
end