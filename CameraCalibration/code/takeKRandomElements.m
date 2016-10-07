function [ rand3D, remaining3D, rand2D, remaining2D ] = takeKRandomElements( k,input2D, input3D )
% Grab k random elements from input and return two arrays, one with k
% elements and the remaining elements
    fitSet = randperm(72); fitSet = fitSet(1:k);

    % build rand3D, rand2D
    rand3D = []; rand2D = [];
    for i=1:k
        rand3D = [rand3D;input3D(fitSet(i),:)];
        rand2D = [rand2D;input2D(fitSet(i),:)];
    end

    remaining3D = []; remaining2D = [];
    % build remaining3D, remaining2D
    for i=1:72
        % if i is part of the random set, dont include it in remaining
        if ismember(i,fitSet)
            continue
        else
            remaining3D = [remaining3D; input3D(i,:)];
            remaining2D = [remaining2D; input2D(i,:)];
        end
    end

end


