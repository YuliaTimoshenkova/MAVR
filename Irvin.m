function [ k ] = Irvin( y,alpha )
% Функция вычисления критерия Ирвина
N = length(y);
std = 0;

for i=1:N
    
    std = (std + ((y(i) - mean(y))^2))/(N-1);
end
std = sqrt(std);
k(1) = NaN;
for i=2:N
    k(i) = abs(y(i)-y(i-1))/std;
    if k(i)<=alpha
        k(i) = NaN;
    else
        k(i) = y(i);
    end
end
end