function [ state ] = ssdCorrelate( originalImage, newImage, originalPixels, predictedPixels, offset)
% go through each leftPixel 
rightOriginalPixels=[];
bestBox = [];
for k=1:size(originalPixels)
    c0 = round(originalPixels(k,1));
    r0 = round(originalPixels(k,2));
    boxToSearchFor = originalImage(r0-offset:r0+offset,c0-offset:c0+offset);
 
    minSSD = 1000000;
    bestCandidate = [-1; -1];
    rp = predictedPixels(2);
    cp = predictedPixels(1);
    for i=-10:1:10 % search along 11 different rows
        rowToSearch = uint16(rp + i);
        for j=-10:10
            columnToSearch = uint16(cp+j);
            currentBox = newImage(rowToSearch-offset:rowToSearch+offset,columnToSearch-offset:columnToSearch+offset);
            ssd = sumsqrd(boxToSearchFor,currentBox);
            
            if ssd < minSSD
                minSSD = ssd;
                bestCandidate = [columnToSearch, rowToSearch];
            end
        end
    end
end
state = [bestCandidate(1) bestCandidate(2)];
% figure; 
% subplot(1,2,1);
% imshow(putXonImage(originalImage,originalPixels,0));
% subplot(1,2,2); 
% imshow(putXonImage(newImage,state(1:2),0));
% input('Press enter to continue')
% close('all')
end

