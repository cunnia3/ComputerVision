function [ imageNew ] = putXonImage( image,pixels,color )
    imageNew = image;
    for offset=-5:5
        imageNew(pixels(2)+offset,pixels(1)+offset,:) = color;
        imageNew(pixels(2)-offset,pixels(1)+offset,:) = color;
    end
end

