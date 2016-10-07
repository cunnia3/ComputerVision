function [ P ] = linearCalibrate1( p2D, p3D )
%% Apply linear solution 2 from lecture notes to solve for projection matrix P
    % form M matrix from points
    B = []; b = [];
    for i=1:size(p2D,1)
       r1 = [p3D(i,1) p3D(i,2) p3D(i,3) 1 0 0 0 0 -p3D(i,1)*p2D(i,1) ...
           -p3D(i,2)*p2D(i,1) -p3D(i,3)*p2D(i,1)];
       r2 = [0 0 0 0 p3D(i,1) p3D(i,2) p3D(i,3) 1 -p3D(i,1)*p2D(i,2) ...
           -p3D(i,2)*p2D(i,2) -p3D(i,3)*p2D(i,2)];
       B = [B;r1;r2];
       b = [b;-p2D(i,1); -p2D(i,2)];
    end

    Y = -inv(B'*B)*B'*b;
    p34 = 1/norm(Y(9)+Y(10)+Y(11));
    V = [p34*Y; p34];
    P = [V(1:4)'; V(5:8)'; V(9:12)'];
end
