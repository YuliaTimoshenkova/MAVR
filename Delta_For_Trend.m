function [ delta ] = Delta_For_Trend( tau, M, x)
% tau - predict
% M - шаг
N = length(x);
e = x - tau;
S = sqrt(sum(e.^2)/(N-2));
tstudent =  tinv(1 - 0.05/2, 98);
delta = tstudent .* S * sqrt(1 + 1/N + ((tau(M)-mean(tau)).^2)...
    /(sum((tau - mean(tau)).^2)));
end