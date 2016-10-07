computeIntrinsicParams;
%% Compute Fundamental Matrix from Given Parameters
% Rotation
%R = R_l'*R_r;
R = R_l*transpose(R_r); %% works
% Translation
%T = T_l - R'*T_r;
%T = T_l - R*T_r; 
T = -(T_l - R*T_r); %% works
disp('The Relative Rotation and Translation');
disp('R = '); disp(R); % display left Intrinsic Matrix
disp('T = '); disp(T); % display right Intrinsic Matrix

%% Calculate Instrinsic Matrices
% Assuming negligible skew and lens distortion
% Left Instrinsic Matrix
W_l = [fs_x_l 0 c_0_l;0 fs_y_l r_0_l;0 0 1];
% Right Intrinsic Matrix
W_r = [fs_x_r 0 c_0_r;0 fs_y_r r_0_r;0 0 1];
disp('The Instrinsic Matrices');
disp('W_l = '); disp(W_l); % display left Intrinsic Matrix
disp('W_r = '); disp(W_r); % display right Intrinsic Matrix

%% Calculate Fundamental Matrix
% Translational Skew Matrix
S = [0 -T(3) T(2); T(3) 0 -T(1); -T(2) T(1) 0];
% Essential Matrix
E = transpose(S)*R;
% Fundamental Matrix
F = transpose(inv(W_l))*E*inv(W_r);
disp('The Fundamental Matrix');
disp('F = '); disp(F); % display Fundamental Matrix
