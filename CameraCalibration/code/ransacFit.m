function [ bestP ] = ransacFit( p2D, p3D, k, ... 
    toleranceForInlier, desiredInlierCount, maxIterations )
  bestP = [];
  bestInlierCount = 0;
  for i=1:maxIterations
    inliers = 0;
      
    % pick set of points to fit
    [rand3D,remaining3D,rand2D,remaining2D]=takeKRandomElements(k,p2D,p3D);
    
    % build model with random sets
    P = linearCalibrate1(rand2D,rand3D);
    
    % find the number of inliers
    for i=1:size(remaining3D,1)
        % get 2D point
        newPoint = projectPoint(P,remaining3D(i,:));
        if norm(newPoint - remaining2D(i,:)) < toleranceForInlier
            inliers = inliers + 1;
        end
    end
    
    if inliers > bestInlierCount
        bestP = P;
    end
    
    if inliers > desiredInlierCount
        return
    end
  end

end

