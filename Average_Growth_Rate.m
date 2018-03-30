function [ H ] = Average_Growth_Rate( y , M )
% y - �������� ��
% M - ��� ��������
% H - �������
N = length(y);
Tp = (y(N)/y(1))^(1/(N-1));
H = y(1:N-1);
for t = 1:M
    H(N+t-M-1) = y(N-M) * Tp^t;
end
display('����� �������� �������� ����� �����')
end

