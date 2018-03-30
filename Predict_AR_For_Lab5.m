function [ tau_l5 , G] = Predict_AR_For_Lab5( y , M)
% М - шаг прогнозирования
% у - исходный ВР
L = 100; % длина окна
[lambda,U,V]=SSA_modes(y,L); % функция разбиения
% функция группировки
G = SSA_group(L,lambda,U,V,[1]);

end

