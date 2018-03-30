function [ P ] = Correction_Predict_Weighet( z1 , k , y,M)
N = length(z1);
psi(1) = 1;
psi(2) = k(2);
for i = 3:N
    psi(i) = k(2) * psi(i-1);
end
P = z1;
l = N - M;
j=1;
for i = l:N-1
    P(i) = z1(2) + psi(j) * (y(l)-z1(i));
    j = j + 1;
end
end
