function [dx] = f(x1,x2)
    dx1 = -2.*x1.^3+x1.^2-x1;
    dx2 = -2.*x2.^3+x2.^2-x2;
    dx = [dx1, dx2];
end

