close all
clear all
%% 1 - 5 how to plot predict
load('nyse.mat')
global nyse
yyy = nyse;
N = length(nyse);
% figure('Name','Predict','Color','w')
% plot(1:500+100, nyse(1:500+100), 501:500+100, forecast);
% legend('VR','predict')
%% 6 - 8 метод прогноза среднего абсолютного прироста 
% 9 - 10 оценка точности
M = 20;
y = nyse;
% 2.1. Метод прогноза среднего абсолютного прироста    
Z = Average_Absolute_Increase( y , M );  
%% 11 2.2. Метод прогноза среднего темпа роста 
M = 1000;
H = Average_Growth_Rate( y , M );
%% 9 - 10 оценка точности
eps_2_2 = Tochnost_Predict( M , y , H );
% figure('Name','Average_Growth_Rate','Color','w')
% plot(H,'r')
% hold on
% plot(y,'k')
% legend('predict','VR')
%% 12) Постройте регрессионную модель тренда первого, второго и
% третьего порядка на основе методики, которая изучалась в
% лабораторной работе №4. Напоминаем, что самый быстрый вариант
% для этого – это использование функций MATLAB Basic Fitting с
% указанием коэффициентов полученных полиномов.
figure('Name','Исходный ВР','Color','w')
subplot(2,1,1)
plot(nyse)
x = nyse;
N = length(x);
t = 1:N;
N = length(x);
%%
y1=0.19*t+100;
y2=3.3e-05*t.^2+0.086*t+160;
y3=-6e-08*t.^3+0.00031*t.^2-0.24*t+240;
b1 = [100 0.19];
b2 = [160 0.086 3.3e-05];
b3 = [240 -0.24 0.00031 -6e-08];
subplot(2,1,2)
plot (y1);
hold on
plot (y2,'r')
hold on
plot (y3,'m')
legend('y1','y2','y3')
 M = 500;
tau1 = Predict_T( y1, b1, M );
tau2 = Predict_T( y2, b2, M );
tau3 = Predict_T( y3, b3, M );
figure('Name','прогноз на основе трендов первого, второго и третьего порядков','Color','w')
plot(nyse,'r')
hold on
plot(tau1,'m')
hold on
plot(tau2,'g')
hold on
plot(tau3,'--k')
title('прогноз на основе трендов первого, второго и третьего порядков')
legend('VR','predict for y1','priduct for y2','priduct for y3')
%% Регрессионная модель
 a1 = aryule(x,1);
 a2 = aryule(x,2);
 a3 = aryule(x,3);
 % АР3
z3(1:4) = [1];
for i = 4:N  
 z3(i) = -a3(2) * z3(i-1) -a3(3) * z3(i-2) - a3(4) * z3(i-3); 
end 
% АР2
z2(1:3) = [1];
for i = 3:N  
 z2(i) = -a2(2) * z2(i-1) - a2(3) * z2(i-2); 
end
% АР1
z1(1:2) = [1];
for i = 2:N  
 z1(i) = -a1(2) * z1(i-1); 
end
% figure('Name','Исходный ВР','Color','w')
% subplot(2,1,1)
% plot(nyse)
% subplot(2,1,2)
% plot (z3);
% hold on
% plot (z2,'r')
% hold on
% plot (z1,'m')
% legend('АР3','АР2','АР1')
%% 13) Постройте прогноз на основе трендов первого, второго и третьего порядков
 M = 500;
tau1 = Predict_AR( nyse, a1, M );
tau2 = Predict_AR( nyse, a2, M );
tau3 = Predict_AR( nyse, a3, M );
% eps_tr1 = Tochnost_Predict(M,x, tau1);
% eps_tr2 = Tochnost_Predict(M,x, tau2);
% eps_tr3 = Tochnost_Predict(M,x, tau3);
% figure('Name','прогноз на основе трендов первого, второго и третьего порядков','Color','w')
% plot(nyse,'r')
% hold on
% plot(tau1,'m')
% hold on
% plot(tau2,'g')
% hold on
% plot(tau3,'--k')
% title('прогноз на основе трендов первого, второго и третьего порядков')
% legend('VR','predict for y1','priduct for y2','priduct for y3')

%% 14) Постройте доверительные интервалы для тренда первого порядка
% на рисунке вместе с прогнозом и самим рядом
delta = Delta( tau1, M, x, y1);
[ tv , tn ] = Confidence_Intervals( tau1 , delta );
%% correction predict

[ C1 , C2 ] = Correction_Predict( y1 , a1 , M , y2, a2 );
% figure('Name','Последнее задание','Color','w')
% plot(y1)
% hold on
% plot(C1,'r')
% hold on
% plot(C2,'k')
% legend('истина','C1','C2')
P = Correction_Predict_Weighet(y1 , a1, y,M);