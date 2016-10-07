function [ It ] = dIdt(x,y,t,A )
    It = A(4)+A(8)*y+2*A(9)*t+A(10)*x+A(15)*y^2+2*A(16)*y*t+3*A(17)*t^2 ...
        +A(18)*x^2+2*A(19)*x*t+A(20)*x*y;
end

