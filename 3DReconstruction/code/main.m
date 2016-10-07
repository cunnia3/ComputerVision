%% PARTS 1 AND 2
points3D = importdata('calibration/pts_3D.txt'); points3D = points3D(:,2:4);
points2Dl = importdata('calibration/pts_2D_left.txt'); points2Dl=points2Dl(:,2:3);
points2Dr = importdata('calibration/pts_2D_right.txt'); points2Dr=points2Dr(:,2:3);

% get projection matrices
leftP = linearCalibrate(points2Dl, points3D);
rightP = linearCalibrate(points2Dr, points3D);

[Wl,Rl,Tl]=getCameraParameters(leftP);
[Wr,Rr,Tr]=getCameraParameters(rightP);

% find essential matrix
R = Rl*Rr';
T = -(Tl-R*Tr);
S = [0 -T(3) T(2);
    T(3) 0 -T(1);
    -T(2) T(1) 0];
E1 = S'*R;
F1=inv(Wl)'*E1*inv(Wr);

%% PART3
% Eight point algorithm
F_8Point = eightPointAlgorithm(points2Dl, points2Dr);
% scale F2 to compare to F1

F_8Point = F_8Point * (F1(3,3)/F_8Point(3,3))

%% PART 4
plotEpipolarLines % comment out for speed of execution

%% PART 5
% shift rectification to expose more of the face for reconstruction
shiftRect

% read pixels from text file
p2DrMarker = importdata('faceimage/pts_left.txt'); p2DrMarker=p2DrMarker(:,2:3);
p2DlMarker = importdata('faceimage/pts_right.txt'); p2DlMarker=p2DlMarker(:,2:3);

% reconstruct pixels
reconstructed3D = [];
for i=1:size(p2DrMarker,1)
    [x,y,z]=reconstruction3D(Wl,Wr,R,T,p2DrMarker(i,1),p2DrMarker(i,2),p2DlMarker(i,1),p2DlMarker(i,2));
    temp = [x;y;z]; newPoint = Rr'*(-temp-Tr);
    reconstructed3D = [reconstructed3D; newPoint'];
end

% plot results
scatter3(reconstructed3D(:,1),reconstructed3D(:,2),reconstructed3D(:,3))


%% PART 6
p2DrMarker = importdata('faceimage/pts_right.txt'); 
p2DrMarker=p2DrMarker(:,2:3);
p2DlMarker = importdata('faceimage/pts_left.txt'); 
p2DlMarker=p2DlMarker(:,2:3);

p2DlMarkerRect = [];
% Get rectified coordinates of feature points
for i=1:size(p2DlMarker,1)
    unScaledRectPoint = (Xl*[p2DlMarker(i,:) 1]')';
    scaledPoint = unScaledRectPoint(1:2)/unScaledRectPoint(3);
    shiftedScaledPoint = [scaledPoint(1)+(300/unScaledRectPoint(3)) ...
        scaledPoint(2)];
    p2DlMarkerRect=[p2DlMarkerRect; shiftedScaledPoint];
end
ssdGuess=ssdCorrelate(newL, newR, p2DlMarkerRect, Xl, Xr);
ssdError=norm(mean(ssdGuess - p2DrMarker))

reconstructed3D = [];
for i=1:size(ssdGuess,1)
    [x,y,z]=reconstruction3D(Wl,Wr,R,T,p2DrMarker(i,1),p2DrMarker(i,2), ...
        ssdGuess(i,1),ssdGuess(i,2));
    temp = [x;y;z]; newPoint = Rr'*(-temp-Tr);
    reconstructed3D = [reconstructed3D; newPoint'];
end
figure
scatter3(reconstructed3D(:,1),reconstructed3D(:,2),reconstructed3D(:,3))

