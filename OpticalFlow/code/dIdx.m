function [ Ix ] = dIdx(x,y,t,A )
    Ix = A(2)+2*A(5)*x+A(6)*y+A(10)*t+3*A(11)*x^2 + 2*A(12)*x*y+A(13)*y^2 ...
        +2*A(18)*x*t + A(19)*t^2 + A(20)*y*t;
end

