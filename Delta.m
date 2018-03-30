function [ delta ] = Delta( tau, M, x, z )
% tau - predict
% M - шаг
N = length(z);
e = x - z;
S = sqrt(sum(e.^2))/(N-2);
tstudent =  tinv(1 - 0.05/2, 98);
delta = tstudent .* S * sqrt(1 + 1/N + ((tau(M)-mean(tau)).^2)...
    /(sum((tau - mean(tau)).^2)));
end

