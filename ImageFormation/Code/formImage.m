function [ image ] = formImage( pixels,intensities )
    image = ones(100,100);
    pixels(:,1) = pixels(:,1)./pixels(:,3);
    pixels(:,2) = pixels(:,2)./pixels(:,3);
    pixels(:,3) = pixels(:,3)./pixels(:,3);
    
    pixels = floor(pixels);
    for i=1:7710
        c = pixels(i,1);
        r = pixels(i,2);
        intensity = intensities(i);
        image(r,c) = intensity;
    end
end

