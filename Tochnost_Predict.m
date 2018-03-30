function [eps] = Tochnost_Predict(M , y, H)
% M - ��� ��������
% y - �������� ���
% H - �������
N = length(y);
a = 0;
for i = N-M:N-1
    a = a + abs(H(i)-y(i))/y(i);
end
eps = (1/M) * a*100;
if eps < 10
    display('�������� �������� �������')
    eps
elseif eps > 10 && eps < 20
    display('�������� �������� �������')
    eps
elseif eps > 2-0 && eps < 50
    display('�������� �������� ������������������')
    eps
else 
    display('������� �� ����������������')
    eps
end
end