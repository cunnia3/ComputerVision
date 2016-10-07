function [ Iy ] = dIdy(x,y,t,A )
    Iy = A(3)+A(6)*x+2*A(7)*y+A(8)*t+A(12)*x^2+2*A(13)*x*y+3*A(14)*y^2+2*A(15)*y*t ...
       + A(16)*t^2 + A(20)*x*t;
end

