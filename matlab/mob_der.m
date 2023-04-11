function r = mob_der(g,x)
    r = x(2)/(g(2,1)*x(1)+g(2,2))^2;
end