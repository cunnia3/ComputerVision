%% Calculate Camera Parameters
function [fs_x, fs_y, c_0, r_0, R, T] = calcParams(P)

r_3 = P(3,1:3);
t_z = P(3,4);
c_0= P(1,1:3)*r_3';
r_0= P(2,1:3)*r_3';
fs_x = norm(cross(P(1,1:3),P(3,1:3)));
fs_y=norm(cross(P(2,1:3),P(3,1:3)));
t_x = (P(1,4)-c_0*t_z)/fs_x;
t_y = (P(2,4)-r_0*t_z)/fs_y;
r_1 = (P(1,1:3)-c_0*r_3)/(fs_x);
r_2 = (P(2,1:3)-r_0*r_3)/(fs_y);
R = [r_1; r_2; r_3];
T = [t_x; t_y; t_z];