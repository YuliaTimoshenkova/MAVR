function [ t ] = My_Smooth3( y )
% ������� ����������� 
% ����������� �� 3 ������
N = length(y);
t(1) = y(1);
t(N) = y(N);
for j=2:N-1
    t(j) = 1/3*(y(j-1)+y(j)+y(j+1));
end
end