function [ acorr ] = My_autocorr( x,l )
% Собственная функция вычисления автокорреляционной функции ВР
acorr(1)=1;
for k = 2:l+1
    l2 = k;
N = length(x);
%% числитель 
a1 = 0;
for i = 1:(N-l2)
    a1 = a1 + x(i)*x(i+l2);
end
a1 = (N-l2)*a1;
a2 = 0;
for i = 1:(N-l2)
    a2 = a2 + x(i);
end
a3 = 0;
for i = 1:(N-l2)
    a3 = a3 + x(i+l2);
end
ch = a1 - a2 * a3;
%% знаменатель
b1 = 0;
for i = 1:(N-l2)
    b1 = b1 + x(i)^2;
end
b1 = (N-l2)*b1;
b2 = 0;
for i = 1:(N-l2)
    b2 = b2 + x(i);
end
c1 = b1 - b2^2;
b3 = 0;
for i = 1:(N-l2)
    b3 = b3 + x(i+l2)^2;
end
b3 = (N-l2)*b3;
b4 = 0;
for i = 1:(N-l2)
    b4 = b4 + x(i+l2);
end
c2 = b3 - b4^2;

zn = sqrt(c1)* sqrt(c2);
acorr(k) = ch / zn;
end
end

