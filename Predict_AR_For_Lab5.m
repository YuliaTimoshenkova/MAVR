function [ tau_l5 , G] = Predict_AR_For_Lab5( y , M)
% � - ��� ���������������
% � - �������� ��
L = 100; % ����� ����
[lambda,U,V]=SSA_modes(y,L); % ������� ���������
% ������� �����������
G = SSA_group(L,lambda,U,V,[1]);

end

