%% Using Linear Method 2 to solve for the Camera Parameters for each pair of 2D and 3D points
readData;
% Left 2D
m_i = left2Dpoints';
M_i = points3D';
[fs_x_l, fs_y_l, c_0_l, r_0_l, R_l, T_l] = LinMethod2(m_i, M_i, N);
disp('LinMethod2: Left Camera Parameters');
disp('fs_x = '); disp(fs_x_l);
disp('fs_y = '); disp(fs_y_l);
disp('c_0 = '); disp(c_0_l);
disp('r_0 = '); disp(r_0_l);
disp('R = '); disp(R_l);
disp('T = '); disp(T_l);

% right 2D,
m_i = right2Dpoints';
M_i = points3D';
[fs_x_r, fs_y_r, c_0_r, r_0_r, R_r, T_r] = LinMethod2(m_i, M_i, N);
disp('LinMethod2: Right Camera Parameters');
disp('fs_x = '); disp(fs_x_r);
disp('fs_y = '); disp(fs_y_r);
disp('c_0 = '); disp(c_0_r);
disp('r_0 = '); disp(r_0_r);
disp('R = '); disp(R_r);
disp('T = '); disp(T_r);
