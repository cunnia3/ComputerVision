function [fs_x, fs_y, c_0, r_0, R, T] = LinMethod2(m_i, M_i, N)
%% Compute Parameters using Linear Method 2
A = zeros(2*N,12);
for i=1:N
    A(2*i-1,1:8)=[M_i(:,i)', 1, 0, 0, 0, 0];
    A(2*i-1,9:12)=[-m_i(1,i)*M_i(:,i)', -m_i(1,i)];
    A(2*i,1:8) = [0, 0, 0, 0, M_i(:,i)', 1];
    A(2*i,9:12)=[-m_i(2,i)*M_i(:,i)', -m_i(2,i)];
end

B = A(:,1:11);
b = A(:,12);

Y=-pinv(B)*b;

p_34 = sqrt(1/(Y(9)^2 + Y(10)^2 + Y(11)^2));
V = [Y*p_34; p_34];

P = [V(1:4)'; V(5:8)'; V(9:12)'];

[fs_x, fs_y, c_0, r_0, R, T] = calcParams(P);