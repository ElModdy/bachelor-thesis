function g = iso(z,v)
    u=sqrt(v/(1i*imag(z)));
    h=[real(u) imag(u);-imag(u) real(u)];
    k=[sqrt(imag(z)) real(z)/sqrt(imag(z));0 1/sqrt(imag(z))];
    
    g=k*h;
end