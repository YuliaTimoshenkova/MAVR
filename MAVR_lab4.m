clear all
close all
%% 1- 3  
z1 = [1];
z2 = [1]; 
for i = 2:100  
 z1(i) = 0.8 * z1(i-1) + 0.2 * randn(1,1); 
 z2(i) = -0.8 * z2(i-1) + 0.2 * randn(1,1);  
end 
%% 4
figure()
subplot(2,1,1)
plot (z1);
hold on
plot(z2,'r');
legend('z1','z2')
title('Для процессов первого порядка')
%% 5
Acorr_z1 =  autocorr(z1);
Acorr_z2 =  autocorr(z2);
subplot(2,1,2)
plot(0:20, Acorr_z1);
hold on
plot(0:20, Acorr_z2, 'r');
legend('autocorr z1','autocorr z2')
%% 7 - 9
z1 = [1];
z2 = [1];
a = 0.2 * randn(1,100); 
for i = 2:100  
 z1(i) = a(i) - 0.8 * a(i-1); 
 z2(i) = a(i) + 0.8 * a(i-1);  
end
figure()
subplot(2,1,1)
plot (z1);
hold on
plot(z2,'r');
title('Для процессов среднего скользящего первого порядка')
legend('z1','z2')
Acorr_z1 =  autocorr(z1);
Acorr_z2 =  autocorr(z2);
subplot(2,1,2)
plot(0:20, Acorr_z1);
hold on
plot(0:20, Acorr_z2, 'r');
legend('autocorr z1','autocorr z2')
%% 10
t1 = -0.8;
t2 = 0.8;
ro_1 = (-1*t1)/(1+t1^2);
ro_2 = (-1*t2)/(1+t2^2);
disp('Весовые коэффициенты')
ro_1
ro_2
%% 11
corr_coef_v1 = corrcoef(z1);
corr_coef_v2 = corrcoef(z2);
%% 12
z1 = [1];
z2 = [1];
a = 0.2 * randn(1,100); 
for i = 2:100  
 z1(i) = 0.8 * a(i-1) + a(i) - 0.3 * a(i-1); 
 z2(i) = a(i) -0.8 * a(i-1) - 0.3 * a(i-1);  
end
figure()
subplot(2,1,1)
plot (z1);
hold on
plot(z2,'r');
title('Для процесса АРСС(1)')
legend('z1','z2')
Acorr_z1 =  autocorr(z1);
Acorr_z2 =  autocorr(z2);
subplot(2,1,2)
plot(0:20, Acorr_z1);
hold on
plot(0:20, Acorr_z2, 'r');
legend('autocorr z1','autocorr z2')
%% 16 - 28
load ('4.mat')
figure()
subplot(3,1,1)
plot (x);
legend('x')
title('Для значений из таблицы')
Acorr_x =  autocorr(x);
subplot(3,1,2)
plot(0:20, Acorr_x);
legend('autocorr x')
% Порядок АР модели
a1 = aryule(x,1); 
a2 = aryule(x,2); 
a3 = aryule(x,3); 
% АР3
z3(1:4) = [1];
for i = 4:100  
 z3(i) = -a3(2) * z3(i-1) -a3(3) * z3(i-2) - a3(4) * z3(i-3); 
end 
% АР2
z2(1:3) = [1];
for i = 3:100  
 z2(i) = -a2(2) * z2(i-1) - a2(3) * z2(i-2); 
end
% АР1
z1(1:2) = [1];
for i = 2:100  
 z1(i) = -a1(2) * z1(i-1); 
end
subplot(3,1,3)
plot (z3);
hold on
plot (z2,'r')
hold on
plot (z1,'m')
legend('АР3','АР2','АР1')
%% 25-30
ro1 = autocorr(z1);
ro2 = autocorr(z2);
disp('Весовые коэффициенты')
fi_1 = ro1;
fi_2(1) = (ro1 .* (1 - ro2))/(1 - ro1.^2);
fi_2(2) = (ro2 - ro1.^2)/(1 - ro1.^2)
%% 31 - 34
load ('2_4.mat');
y = z4;
acorr = autocorr(y);
figure()
subplot(3,1,1)
plot (y)
legend('ВР')
title('ВР из файла')
subplot(3,1,2)
plot (acorr)
legend('Автокорреляционная функция')
% Порядок АР модели
a1 = aryule(y,1); 
a2 = aryule(y,2); 
a3 = aryule(y,3); 
% АР3
z3(1:4) = [1];
for i = 4:100  
 z3(i) = -a3(2) * z3(i-1) -a3(3) * z3(i-2) - a3(4) * z3(i-3); 
end 
% АР2
z2(1:3) = [1];
for i = 3:100  
 z2(i) = -a2(2) * z2(i-1) - a2(3) * z2(i-2); 
end
% АР1
z1(1:2) = [1];
for i = 2:100  
 z1(i) = -a1(2) * z1(i-1); 
end
subplot(3,1,3)
plot (z3);
hold on
plot (z2,'r')
hold on
plot (z1,'m')
legend('АР3','АР2','АР1')