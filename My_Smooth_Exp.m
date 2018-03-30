function [ t ] = My_Smooth_Exp( y,alpha )
% Функция экспоненциального сглаживания
if alpha <= 0 && alpha >= 1
    disp('alpha should be >0 and <1')
end
N = length(y);
t(1) = y(1);
for j=2:N
    t(j) = (1 - alpha)*t(j-1) + alpha * y(j);
end
end

