function [ p2D ] = projectPoint( P,p3D )
% Project 3D point into 2D with provided projection matrix
 p3D = [p3D 1];
 p2D = P*p3D';
 p2D = p2D/p2D(3);
 p2D = p2D(1:2)';
end

