function [ L ] = Window( F )
%Функция определения оптимальной длины окна
N = length(F);
    for L = 10:N/2
        a(1:9) = NaN;
        K = N-L+1; 
        X = zeros(L,K);  
        for i = 1:K
            X(1:L,i) = F(i:L+i-1); 
        end
        S = X*X'; 
        [U,A] = eig(S);
        [lambda,i] = sort(-diag(A));  
        lambda = -lambda;
        for j = 1:length(lambda)-1
            l(j) = abs(lambda(j+1) - lambda(j));
        end 
        w(L,1:length(l)) = l(1,1:length(l));
        a(L) = std(l);
    end
L = find(a==min(a))
end

