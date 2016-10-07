function [ X,Y,Z ] = reconstruction3D( Wl,Wr,R,T,cl,rl,cr,rr )
    P = Wl*[R T];
    A = [-Wr(1,:) cr 0;
        -Wr(2,:) rr 0;
        -Wr(3,:) 1 0;
        -P(1,1:3) 0 cl;
        -P(2,1:3) 0 rl;
        -P(3,1:3) 0 1];
    B = [0;0;0;P(:,4)];
    
    result=pinv(A)*B;
    X = result(1);
    Y = result(2);
    Z = result(3);

end

