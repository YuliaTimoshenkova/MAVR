clear all
close all
%% 1-9
load('3.mat');
y = x;
figure()
plot (y,'r');
N = length(y);
X = [ones(1, length(y)); 1 : length(y)];
X =X'; 
betta = X \ y;
tetta = betta(1) + betta(2).*X(:,2);
hold on
plot(tetta);%линейная

%% 10,11
Q=[ones(1, length(y)); 1 : length(y); (1 : length(y)).^2];
Q = Q';
betta_q = (Q'*Q)^-1*Q'*y;
tetta_q = betta_q(1) + betta_q(2).*Q(:,2) + betta_q(3).*Q(:,3);
hold on
plot (tetta_q,'g')
C = [ones(1, length(y)); 1 : length(y); (1 : length(y)).^2,; (1 : length(y)).^3];
C = C';
betta_c = (C'*C)^-1*C'*y;
tetta_c = betta_c(1) + betta_c(2).*C(:,2) + betta_c(3).*C(:,3) + betta_c(4).*C(:,4);
hold on
plot(tetta_c,'m')
legend('ВР','расчитаный тренд (линейный)','типо квадратичный','типо кубический');
%% 12 - 15
% Постройте функцией plot график ВР. 
% Среди меню выберите вкладку Tools->Basic Fitting, 
% откроется окно, представленное на рисунке 2.
% В этом окне выберите линейный, квадратичный и кубический тренды, 
% а также отметьте галочкой «Выводить уравнения» (Show equations).
 figure()
 plot(y);
%% 16 - 17 лучшая степень полинома
dk=Pow_Poly(y);
%% 18 - 22
q  =  randn(24,1);
y = y + q;
X = [ones(1, length(y)); 1 : length(y); (1 : length(y)).^2,; (1 : length(y)).^3];
X = X';
b_18 = (X'*X)^-1*X'*y;
e = y - X*b_18;
ch = 0;zn = 0;e(N+1)=e(N);
for i = 1:N
    
    ch = ch + (e(i)-mean(e))*((e(i+1)-mean(e)));
    zn = zn + (e(i)-mean(e))^2;
end
nu = (N/(N-1))*ch/zn;
std = sqrt(1-nu^2);
%G = diag([10e-2 10e-2]);
ccc(1) = 1;
for i = 2:N
    ccc(i) = 1 + nu^2;
end
D = diag(ccc);
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
b_18_1 = (X'*(Vs)^(-1)*X)^(-1)*X'*(Vs)^(-1)*y;
e = y - X*b_18;
ch = 0;zn = 0;e(N+1)=e(N);
for i = 1:N
    
    ch = ch + (e(i)-mean(e))*((e(i+1)-mean(e)));
    zn = zn + (e(i)-mean(e))^2;
end
nu1 = (N/(N-1))*ch/zn;
std1 = ((1-nu1^2)/N)*zn;
tetta_mine = b_18_1(1) + b_18_1(2).*C(:,2) + b_18_1(3).*X(:,3) + b_18_1(4).*X(:,4);
figure()
plot (y,'r');
hold on
plot(tetta_c,'m')
hold on
plot(tetta_mine, 'b')
legend('ВР','типо кубический','типо супер мой кубический');
%betta_q = [b,b1]
%tetta_q = betta_q(1) + betta_q(2).*X(:,2); %+ betta_q(3).*Q(:,3);
%% 23 - 24 Теперь построим тренд методом сглаживания.  
figure()
subplot(3, 1, 1)
plot (y)
hold on
plot (smooth(y, 3),'r') 
legend('VR','3')
subplot(3, 1, 2)
plot (y)
hold on
plot (smooth(y, 4),'m') 
legend('VR','4')
subplot(3, 1, 3)
plot (y)
hold on
plot (smooth(y, 5),'g') 
legend('VR','5')
%% 25 Постройте собственную функцию сглаживания по трем точкам. 
smooth_my = My_Smooth3(x);
%% 26 Сравните получившиеся результаты – тренды должны получиться одинаковыми.
figure()
subplot(2, 1, 1)
plot (y)
hold on
plot (smooth(y, 3),'r')
subplot(2, 1, 2)
plot (y)
hold on
plot (smooth_my,'r')
%% 27 Наконец, постройте тренд методом экспоненциального сглаживания, самостоятельно подобрав его параметр (который лежит в диапазоне от 0 до 1). 
alpha = 0.35;
smooth_exp = My_Smooth_Exp(x,alpha);
figure()
plot(y)
hold on
plot (smooth_exp,'r')