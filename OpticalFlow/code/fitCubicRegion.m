function [ a ] = fitCubicRegion( images, centralPixel, boxLength)
    D = [];
    J = [];
    % For each image
    for t1=1:5 % time index
        for xOff=-boxLength:boxLength % columns
            for yOff=-boxLength:boxLength % rows
                d= [1 xOff yOff t1 xOff^2 xOff*yOff yOff^2 yOff*t1 t1^2 xOff*t1 xOff^3 xOff^2*yOff xOff*yOff^2 yOff^3 yOff^2*t1 ...
                yOff*t1^2 t1^3 xOff^2*t1 xOff*t1^2 xOff*yOff*t1];
                D = [D;d]; x1 = xOff + centralPixel(1); y1 = yOff + centralPixel(2);
                J = [J;images(x1,y1,t1)];
            end
        end
    end
    a = pinv(D)*double(J);
    
    % Check the quality of fit
    if norm(mean(D*a - double(J))) > .001
        norm(mean(D*a - double(J)))
    end
end