function [ tv , tn ] = Confidence_Intervals( tau , delta )
% ������������� ��������� ��� ������ ������� �������
tv = tau + delta;
tn = tau - delta;

end

