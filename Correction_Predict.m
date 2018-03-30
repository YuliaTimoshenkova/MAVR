function [ C1 , C2 ] = Correction_Predict( t1 , k1, M ,t2, k2)
N = length(t1);
z = t1;
z(N - M) = k1(2) * t1(N - M);
%z(N - M + 1) = k * z(N - M);
for i = N - M + 1:N
    z(i) = k1(2) * z(i - 1);
end
C1 = z;
z = t2;
z(N-M) = k2(2) * t2(N-M) + k2(3) * t2(N-M-1);
for j=N-M +1:N
    z(j) = k2(2) * z(j-1) + k2(3) * z(j-2);
end
C2 = z;
end

