function [ ybar ] = formYbar( yL, yR )
%Helper function to eight point algorithm
ybar = [yL(1) * yR(1);
    yL(1) * yR(2);
    yL(1);
    yL(2) * yR(1);
    yL(2) * yR(2);
    yL(2);
    yR(1);
    yR(2);
    1];
end

