%% Rectify Images
computeF;
%% Compute Rectification Rotation of Left Camera row by row
Trect = T/norm(T);
% 1st row
rl1 = Trect';
% 2nd row
rl2 = [Trect(2) -Trect(1) 0]/sqrt(Trect(1)^2+Trect(2)^2);
%rl2 = [-Trect(2) Trect(1) 0]/sqrt(Trect(1)^2+Trect(2)^2);
% 3rd row
rl3 = cross(rl1,rl2);
% Combining rows to create Rect Rot Matrix
R_rect_l = [rl1; rl2; rl3];
% Garbage Collection
clear rl1 rl2 rl3;
R_rect_r = R_rect_l*R;
W = (1/2)*(W_l+W_r);
Xl = W*R_rect_l*inv(W_l);
Xr = W*R_rect_r*inv(W_r);
Xl_inv = inv(Xl);
Xr_inv = inv(Xr);
%% Images
% left image
%left_pattern = imread('project3_data/calibration/left_pattern.jpg');
left_pattern = imread('project3_data/faceimage/left_face.jpg');
left_pattern = rgb2gray(left_pattern);
r_max_l = length(left_pattern(:,1)); % number of rows in the original image
c_max_l = length(left_pattern(1,:)); % number of columns in the original image
% right image
%right_pattern = imread('project3_data/calibration/right_pattern.jpg');
right_pattern = imread('project3_data/faceimage/right_face.jpg');
right_pattern = rgb2gray(right_pattern);
r_max_r = length(right_pattern(:,1)); % number of rows in the original image
c_max_r = length(right_pattern(1,:)); % number of columns in the original image
%% Rectification Left
newL = zeros(r_max_l,c_max_l);
for i=1:r_max_l
    for j = 1:c_max_l
        cr1temp = Xl_inv*[j i 1]';
        cr1temp = round(cr1temp/cr1temp(3));
        if ((cr1temp(2)>0) && (cr1temp(1)>0) && (cr1temp(2)<r_max_l) && (cr1temp(1)<c_max_l))
            newL(i,j) = left_pattern(cr1temp(2),cr1temp(1));
        end
    end
end
%newL=uint8(rot90(newL,2));
newL=uint8(newL);
imshow(newL);
%% Rectification Right
newR = zeros(r_max_r,c_max_r);
for i=1:r_max_r
    for j = 1:c_max_r
        cr1temp = Xr_inv*[j i 1]';
        cr1temp = round(cr1temp/cr1temp(3));
        if ((cr1temp(2)>0) && (cr1temp(1)>0) && (cr1temp(2)<r_max_r) && (cr1temp(1)<c_max_r))
            newR(i,j) = right_pattern(cr1temp(2),cr1temp(1));
        end
    end
end
figure;
%newR=uint8(rot90(newR,2));
newR=uint8(newR);
imshow(newR);