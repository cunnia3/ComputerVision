rectifyImages;
% Epipolar Lines
% Rectified Fundamental Matrix
F_rect = inv(W)'*inv(R_rect_l)'*E*inv(R_rect_r)*inv(W);

% Original Image
% Original Left Image Points
U_l1 = [1193;386;1]; % Box Corner
U_l2 = [972;1231;1]; % Shirt Triangle
U_l3 = [711;789;1]; % Mouth Edge

% Original Right Image Points
U_r1 = [1282;503;1]; % Box Corner
U_r2 = [1769;1444;1]; % Shirt Triangle
U_r3 = [1447;937;1]; % Mouth Edge

% Corresponding Epipolar Lines in Left Image
line1 = F*U_r1;
line2 = F*U_r2;
line3 = F*U_r3;

x = 1:0.1:c_max_r;
y1 = (-line1(3) - line1(1)*x)/line1(2);
y2 = (-line2(3) - line2(1)*x)/line2(2);
y3 = (-line3(3) - line3(1)*x)/line3(2);

% Plot lines on Left Image
figure;
subplot(2,2,1);
imshow(left_pattern);
hold on;
plot(x,y1,'r');
plot(x,y2,'b');
plot(x,y3,'g');

%% Corresponding Epipolar Lines in Right Image
line1 = transpose(F)*U_l1;
line2 = transpose(F)*U_l2;
line3 = transpose(F)*U_l3;

x = 1:0.1:c_max_r;
y1 = (-line1(3) - line1(1)*x)/line1(2);
y2 = (-line2(3) - line2(1)*x)/line2(2);
y3 = (-line3(3) - line3(1)*x)/line3(2);

% Plot lines on Right Image
subplot(2,2,2)
imshow(right_pattern);
hold on;
plot(x,y1,'r');
plot(x,y2,'b');
plot(x,y3,'g');

% Rectified images
%% Rectified Left Image Points
U_l1 = [1535;354;1]; % Box Corner
U_l2 = [1817;1271;1]; % Shirt Triangle
U_l3 = [1986;781;1]; % Mouth Edge

% Rectified Right Image Points
U_r1 = [606;354;1]; % Box Corner
U_r2 = [67;1271;1]; % Shirt Triangle
U_r3 = [268;781;1]; % Mouth Edge

% Corresponding Epipolar Lines in Left Image
line1 = F_rect*U_r1;
line2 = F_rect*U_r2;
line3 = F_rect*U_r3;

x = 1:0.1:c_max_r;
y1 = (-line1(3) - line1(1)*x)/line1(2);
y2 = (-line2(3) - line2(1)*x)/line2(2);
y3 = (-line3(3) - line3(1)*x)/line3(2);

% Plot lines on Left Image
subplot(2,2,3);
imshow(newL);
hold on;
plot(x,y1,'r');
plot(x,y2,'b');
plot(x,y3,'g');

%% Corresponding Epipolar Lines in Right Image
line1 = transpose(F_rect)*U_l1;
line2 = transpose(F_rect)*U_l2;
line3 = transpose(F_rect)*U_l3;

x = 1:0.1:c_max_r;
y1 = (-line1(3) - line1(1)*x)/line1(2);
y2 = (-line2(3) - line2(1)*x)/line2(2);
y3 = (-line3(3) - line3(1)*x)/line3(2);

% Plot lines on Right Image
subplot(2,2,4);
imshow(newR);
hold on;
plot(x,y1,'r');
plot(x,y2,'b');
plot(x,y3,'g');