function [ z ] = K_Seria( y )
% Функция вычислениякритерия серий 
N = length(y);
x = sort(y);
p1 = rem(N,2);
if p1==0
    x_med = 0.5*(x(N/2)+x(N/2+1));
else
    x_med = x((N+1)/2);
end
plus=0;minus=0;
for i=1:N
    if y(i)>x_med
        z(i) = y(i);
        plus = plus + 1;
    elseif y(i)<x_med
        z(i) = -y(i);
        minus = minus + 1;
    end
end
nu = 0.5 * (plus + 2 - 1.96 * sqrt(plus-1));
a = plus + 1
tau = 1.43 * log10(a)
nu_i = 0.5 * (N + 2 - 1.96 * sqrt(N-1));
tau_i = 1.43 * log10(N+1)
if nu > nu_i && tau > tau_i
    k = 1;
    disp('гипоеза принимается (критерий серий)')
else
    k = 0;
    disp('гипоеза отвергается(есть неслучайная составляющая) (критерий серий)')
end

end

