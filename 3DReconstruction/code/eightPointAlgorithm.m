function [ F ] = eightPointAlgorithm( leftPoints, rightPoints )
    % Calculate E using the eight point algorithm on the input points 
    % ASSUME at least 8 points are included as arguments
    
    % form A
    A = [];
    for i=1:5:40
        A = [A formYbar(leftPoints(i,:), rightPoints(i,:))];
    end
    A = A';
    
    U = null(A);
    F = [U(1,end) U(2,end) U(3,end);
        U(4,end) U(5,end) U(6,end);
        U(7,end) U(8,end) U(9,end)];
    
    [U,S,V] = svd(F);
    % Enforce essential matrix contstraints
    S(:,3) = [0;0;0];
    F = U*S*V;
    
end

