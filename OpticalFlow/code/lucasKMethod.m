function [v] = lucasKMethod( A, boxLength )
I = []; b = [];
    for c=-boxLength:boxLength
        for r=-boxLength:boxLength
            Ix = dIdx(c,r,3,A); %Estimate optical flow of central frame
            Iy = dIdy(c,r,3,A); %Estimate optical flow of central frame
            It = dIdt(c,r,3,A); %Estimate optical flow of central frame
            
            I = [I; Ix Iy]; b = [b;-It];
        end
    end
    
    %If there is a very small change, treat it as if there were no change
    if norm(b) < .0001
        b = zeros(size(b));
    end
    
    v=pinv(I)*b;
    
    % Filter badly conditioned matrices or large v's
    if cond(I) > 200 || cond(A) > 200 || norm(v) > 15 || norm(v) < .5
        v = [0;0];
    end
    
    
end

