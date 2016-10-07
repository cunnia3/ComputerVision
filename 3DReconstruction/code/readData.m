%% Read Camera Calibration Data Points
%[left2Dpoints,~]=importdata('proj3_seq1/calibration/pts_2D_left.txt');
%[right2Dpoints,~]=importdata('proj3_seq1/calibration/pts_2D_right.txt');
%[points3D,~]=importdata('proj3_seq1/calibration/pts_3D.txt');
[left2Dpoints,~]=importdata('project3_data/calibration/pts_2D_left.txt');
[right2Dpoints,~]=importdata('project3_data/calibration/pts_2D_right.txt');
[points3D,~]=importdata('project3_data/calibration/pts_3D.txt');
%Remove first columns (which correspond to indexes)
left2Dpoints = left2Dpoints(:,2:3);
right2Dpoints = right2Dpoints(:,2:3);
points3D = points3D(:,2:4);
% Number of points
N = length(points3D); % 56 data points