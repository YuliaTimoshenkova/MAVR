function [ Z ] = Average_Absolute_Increase( y , M )
% y - исходный вр
% M - шаг прогноза
% Z - прогноз
N = length(y);
for t = 2:N
    py = y(t) - y(t-1);
end
ro = 1/2 * (sum(py))^2/(N);
summa = 0;
for i = 1:N
    summa = summa + (y(i)-mean(y))^2;
end
sigma = summa/ N;
if sigma^2 > ro^2
    display('НЕ ПРИМЕНИМ метод прогноза среднего абсолютного прироста ')
    Z = NaN;
else
    N = length(y);
    Z(1:N) = y;
    for t = N-M*10:N-M
        Z(t+M) = y(t) + M * (y(N)-y(1))/(N-1);
    end
    eps_2_1 = Tochnost_Predict( M , y , Z )
end
end

