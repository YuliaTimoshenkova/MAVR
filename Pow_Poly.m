function [ dk ] = Pow_Poly( y )
% Функция вычисления наилучшей степени полинома
% методом последовательных разностей 

% линейная
N = length(y);
i = N;
while i ~= 1
    d(1,i) = y(i)-y(i-1);
    i = i-1;
end

% квадрат 

i = N;
while i ~= 1
    d(2,i) = d(1,i)-d(1,i-1);
    i = i-1;
end

% куб 
i = N;
while i ~= 1
    d(3,i) = d(2,i)-d(2,i-1);
    i = i-1;
end
i = N;
while i ~= 1
    d(4,i) = d(3,i)-d(3,i-1);
    i = i-1;
end
i = N;
while i ~= 1
    d(5,i) = d(4,i)-d(4,i-1);
    i = i-1;
end
for j=1:5
    a = 1/(N-j);
    ck = factorial(2*j)/(factorial(j))^2;
    sum = 0;
    for i=1:(N-j)
       sum = sum + d(j,i); 
    end
    d_k = (a * sum)/ck;
    dk(j) = d_k;
end

end

