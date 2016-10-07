function [pixels pixelIntensities ] = formPixelsFromPoints( L,R,f )
    %constants
    load('CV1_data.mat')
    c0 = 50; r0 = 50;
    sx=8; sy=8;
    T = [-14;-71;1000];
    P=[sx*f 0 c0; 0 sy*f r0; 0 0 1;]*[R T];
    
    pixels = [];
    pixelIntensities=[];
    %go through all points and map them to pixels
    for i=1:size(X)
        % Find intensity of point
        % Find L vector
        normal = [Nx(i) Ny(i) Nz(i)];
        %lPixel = ([X(i) Y(i) Z(i)] - L)/norm(([X(i) Y(i) Z(i)] - L));
        pixelIntensities = [pixelIntensities;findPointIntensity(R*L',R*normal',f)];
        % Map point to pixel
        pixels = [pixels;(P*[X(i); Y(i); Z(i); 1])'];    
    end
end

