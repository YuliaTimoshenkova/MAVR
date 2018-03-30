function [ ks ] = Student( x,y )
% ������� ����������� �������� ���������
n1 = length(x);
n2 = length(y);
p1 = (mean(x)-mean(y))/sqrt((n1-1)*var(x)+(n2-1)*var(y));
p2 = sqrt((n1*n2*(n1+n2-2))/(n1+n2));
ks = p1*p2;
if ks <= tinv(x,y)
    ks = 0;
    disp('�������� ����������� (���������)')
else
    ks = 1;
    disp('�������� ����������� (���������)')
end
end

