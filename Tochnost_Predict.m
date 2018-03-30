function [eps] = Tochnost_Predict(M , y, H)
% M - шаг прогноза
% y - исходный ряд
% H - прогноз
N = length(y);
a = 0;
for i = N-M:N-1
    a = a + abs(H(i)-y(i))/y(i);
end
eps = (1/M) * a*100;
if eps < 10
    display('точность прогноза высокая')
    eps
elseif eps > 10 && eps < 20
    display('точность прогноза хорошая')
    eps
elseif eps > 2-0 && eps < 50
    display('точность прогноза удволетварительная')
    eps
else 
    display('прогноз не удволетварителен')
    eps
end
end