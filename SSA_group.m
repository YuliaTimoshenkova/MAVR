function [ G ] = SSA_group( L,lambda,U,V,I )
% ������� ��� �������������� ����
% �������� ����������� �������� 
%����� ���� L 
%������ ����������� �������� U
%������ ����������� ��������������� �������� lambda
%������ ����������� �������� V
%������ ����������� ��������� I. 
%�������� �������� ����� ���� � ��� ������, ������� �������� ������� ���������������� ����.
%% 26- 28
%����� ����������� I �� ����� �������� � ���� ������� ������� ���������, 
%������� �� ����� ������������ ������. ����� ��� ����������� �������� ����� ����� ��������:
Vt = V';
y_zv = U(:,I) * Vt(I,:);
N = length(V);
% ��������������� ��� ����� ����� �������� G. ��������� ����� 
K = N - L + 1; 
G = zeros(N,1);  
Lp = min(L,K);
Kp = max(L,K);

   for k = 0:Lp-2
     for m = 1:k+1;
      G(k+1) = G(k+1) + (1/(k + 1)) * y_zv(m,k-m+2);
     end
   end

   for k = Lp-1:Kp-1
     for m = 1:Lp;
      G(k+1) = G(k+1)+(1/(Lp)) * y_zv(m,k-m+2);
     end
   end

   for k = Kp:N
      for m = k-Kp+2:N-Kp+1;
       G(k+1) = G(k+1) + (1/(N-k)) * y_zv(m,k-m+2);
     end
   end
end

