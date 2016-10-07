function [ W,R,T ] = getCameraParameters( P )
%Extract camera parameters from a given projetion matrix
    r3=P(3,1:3);
    tz=P(3,4);
    c0=P(1,1:3)*P(3,1:3)';
    r0=P(2,1:3)*P(3,1:3)';
    sxF=sqrt((P(1,1:3)*P(1,1:3)')-c0^2);
    syF=sqrt((P(2,1:3)*P(2,1:3)')-r0^2);
    tx=(P(1,4)-c0*tz)/(sxF);
    ty=(P(2,4)-r0*tz)/(syF);
    r1=(P(1,1:3)-c0*r3)/(sxF);
    r2=(P(2,1:3)-r0*r3)/(syF);
    
    W = [sxF 0 c0;
        0 syF r0;
        0 0 1];
    R = [r1; r2; r3];
    T = [tx;ty;tz];

end

