function [ I ] = findPointIntensity( L,N,f )
%findPointIntensity find the intensity of a point (soon to be a pixel)
%   given the normal of the point and the illumination vector, generate
%   the itensity of the point (to be represented as a pixel)
    beta=1;
    p=1; d=33;
    I = beta*dot(p*L,N)*(pi/4)*(d/f)^2;
end

