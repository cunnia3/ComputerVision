%% Read good data
points3D = importdata('3Dpointnew.txt');
points2Dl = importdata('Left_2Dpoints.txt');
points2Dr = importdata('Right_2Dpoints.txt');

% get projection matrices
leftP = linearCalibrate1(points2Dl, points3D)
rightP = linearCalibrate1(points2Dr, points3D)

% get new points
new2DLPoints = []; new2DRPoints = [];
for i=1:72
    point2Dl = (projectPoint(leftP, points3D(i,:)));
    point2Dr = (projectPoint(rightP, points3D(i,:)));
    new2DLPoints = [new2DLPoints; point2Dl];
    new2DRPoints = [new2DRPoints; point2Dr];
end

errorL = new2DLPoints - points2Dl;
errorR = new2DRPoints - points2Dr;
norm(mean(errorL))
norm(mean(errorR))

%% Read bad data
points3D = importdata('bad_3dpts.txt');
points2Dl = importdata('Left_2Dpoints.txt');
points2Dr = importdata('Right_2Dpoints.txt');

% get projection matrices
leftP = linearCalibrate1(points2Dl, points3D)
rightP = linearCalibrate1(points2Dr, points3D)

% get new points
new2DLPoints = []; new2DRPoints = [];
for i=1:72
    point2Dl = (projectPoint(leftP, points3D(i,:)));
    point2Dr = (projectPoint(rightP, points3D(i,:)));
    new2DLPoints = [new2DLPoints; point2Dl];
    new2DRPoints = [new2DRPoints; point2Dr];
end

errorL = new2DLPoints - points2Dl;
errorR = new2DRPoints - points2Dr;
norm(mean(errorL))
norm(mean(errorR))

%% Use RANSAC to try to get better model for bad data
points3D = importdata('bad_3dpts.txt');
points2Dl = importdata('Left_2Dpoints.txt');
points2Dr = importdata('Right_2Dpoints.txt');

% get projection matrices
leftP = ransacFit(points2Dl, points3D, 10, 1, 40, 80)
rightP = ransacFit(points2Dr, points3D, 10, 1, 40, 80)

% get new points
new2DLPoints = []; new2DRPoints = [];
for i=1:72
    point2Dl = (projectPoint(leftP, points3D(i,:)));
    point2Dr = (projectPoint(rightP, points3D(i,:)));
    new2DLPoints = [new2DLPoints; point2Dl];
    new2DRPoints = [new2DRPoints; point2Dr];
end

errorL = new2DLPoints - points2Dl;
errorR = new2DRPoints - points2Dr;
norm(mean(errorL))
norm(mean(errorR))
