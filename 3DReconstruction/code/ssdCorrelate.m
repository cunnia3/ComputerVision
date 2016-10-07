function [ rightOriginalPixels ] = ssdCorrelate( rectImageL, rectImageR, leftPixelsIn, Xl, Xr )
%ssdCorrelate use ssd to find specified pixels in one rectified image in
%the other image
% boxs to search will be 3x3
%   return original pixels in both camera frames

% go through each leftPixel 
rightOriginalPixels=[];
bestBox = [];
offset=1;
for k=1:size(leftPixelsIn)
    c0 = round(leftPixelsIn(k,1));
    r0 = round(leftPixelsIn(k,2));
    boxToSearchFor = rectImageL(r0-offset:r0+offset,c0-offset:c0+offset);
    
    % scan along the 5 rows surrounding the row of the leftPixel
    minSSD = 1000000;
    bestCandidate = [-1; -1];
    for i=-2:1:2 % search along 5 different rows
        rowToSearch = r0 + i;
        for j=100:600% scan along columns containing the face for row
            currentBox = rectImageR(rowToSearch-offset:rowToSearch+offset,j-offset:j+offset);
            ssd = sumsqrd(boxToSearchFor,currentBox);
            
            if ssd < minSSD
                minSSD = ssd;
                bestCandidate = [j, rowToSearch];
            end
        end
    end
    minSSD;
    bestCandidate;
    rectRightPixel = (inv(Xr)*[bestCandidate 1]')';
    rightOriginalPixels = [rightOriginalPixels; rectRightPixel(1:2)/rectRightPixel(3)];

end

end

