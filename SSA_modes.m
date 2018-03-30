function [ lambda, U,V ] = SSA_modes( F,L )
% ���� 
% �������� ��������� ��� F 
% ����� ���� L
% �����
% ������ ����������� ����� lambda
% ������ ����������� �������� U
% ������ ����������� �������� V
N = length(F); 
K = N-L+1; 
X = zeros(L,K);  
for i = 1:K
    X(1:L,i) = F(i:L+i-1); 
end
S = X*X'; 
[U,A] = eig(S);
[lambda,i] = sort(-diag(A));  
lambda = -lambda;
U = U(:,i);
sev = sum(lambda); 
V = (X')*U; 
end