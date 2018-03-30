function [ std,nu ] = make_matrix_V( b1 )
%{
Функция для вычисления матрицы V
%}
b = (X'*X)^-1*X'*y;
e = y - X*b;
ch = 0;zn = 0;e(N+1)=e(N);
for i = 1:N
    ch = ch + (e(i)-mean(e))*((e(i+1)-mean(e)));
    zn = zn + (e(i)-mean(e))^2;
end
nu = (N/(N-1))*ch/zn;
std = sqrt(1-nu^2);
G = diag([10e-2 10e-2]);
b(1) = 1;
for i = 2:N
    b(i) = 1 + nu^2;
end
D = diag(b);
for i = 1:N
    for j = 1:N
        if D(i,j) == (1 + nu^2)
            D(i-1,j) = -nu;
            D(i,j-1) = -nu;
        end
    end
end
V = D';
Vs = V * 1 / std^2;
b1 = (X'*(Vs)^(-1)*X)^(-1)*X'*(Vs)^(-1)*y;
end

