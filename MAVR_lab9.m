clear all
close all
load('Fort.mat')
%% 1- 33
load('net.mat')
load('net_m.mat')
figure('Name','Исходный ВР','Color','w')
plot(Fort,'k')
legend('Исходный ВР')
%ntstool
%% 34 - 35 Замкнутая модель прогноза
netc = closeloop(net);
netc.name = [net.name ' - Closed Loop'];
%view(netc)
%% 36- 37 параметры прогноза
T = tonndata( [Fort(end-23:end) NaN(1,48)] , true, false);
%Конвертируем координаты:
[xc,xic,aic,tc] = preparets(netc,{},{},T);
yc = netc(xc,xic,aic);
%% 38 - 39 построение прогноза
figure('Name','Прогноз с помощью замкнутой NAR-модели','Color','w')
title('Прогноз с помощью замкнутой NAR-модели')
plot(1:174, Fort, 174:174+48, [Fort(end) cell2mat(yc)])
legend('VR','Forecast')
%% 40 
T = tonndata( [Fort(end-23-24:end-24) NaN(1,24)] , true, false);
%Далее все остается также. Сдвигаем координаты:
[xc,xic,aic,tc] = preparets(netc,{},{},T);
%И получаем прогноз нашей сетью.
yc = netc(xc,xic,aic);
%Изобразим этот прогноз на 24 точки (рисунок 10):
figure('Name','Ретроспективный прогноз на 24 точки ','Color','w')
title('– Ретроспективный прогноз на 24 точки ')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','Forecast')
%% 41 
%сокращенная форма записи ретроспективного прогноза, в виде:
T = tonndata( Fort(end-23-24:end) , true, false);
%% 42
%Далее все остается также. Сдвигаем координаты:
[xc,xic,aic,tc] = preparets(netc,{},{},T);
%И получаем прогноз нашей сетью.
yc = netc(xc,xic,aic);
%Изобразим этот прогноз на 24 точки (рисунок 10):
figure('Name','2 вариант Ретроспективный прогноз на 24 точки ','Color','w')
title('2 вариант Ретроспективный прогноз на 24 точки ')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','Forecast')
%% 43 Моя модель нейронной сети
% training 80%
% validation 10%
% testing 10%
% hidden neurons 20
% d = 24
% Bayesian Regularization
% Замкнутая модель прогноза
netc_m = closeloop(net_m);
netc_m.name = [net_m.name ' - Closed Loop'];
%view(netc_m)
% параметры прогноза
T = tonndata( [Fort(end-23:end) NaN(1,48)] , true, false);
%Конвертируем координаты:
[xc,xic,aic,tc] = preparets(netc_m,{},{},T);
yc = netc_m(xc,xic,aic);
%% 44 - 45 построение прогноза
figure('Name','Прогноз с помощью замкнутой NAR-модели с моими параметрами','Color','w')
title('Прогноз с помощью замкнутой NAR-модели с моими параметрами')
plot(1:174, Fort, 174:174+48, [Fort(end) cell2mat(yc)])
legend('VR','Forecast')
% параметры прогноза
T = tonndata( [Fort(end-23-24:end-24) NaN(1,24)] , true, false);
%Далее все остается также. Сдвигаем координаты:
[xc,xic,aic,tc] = preparets(netc_m,{},{},T);
%И получаем прогноз нашей сетью.
yc = netc_m(xc,xic,aic);
%Изобразим этот прогноз на 24 точки:
figure('Name','Ретроспективный прогноз на 24 точки с моими параметрами','Color','w')
title('Ретроспективный прогноз на 24 точки с моими параметрами')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','Forecast')
%% 46 - 48
%% Получаем компоненту
Modes = EMD(Fort);
Xt = Modes(2,:);
%ntstool
%training 75%
%validation 10%
%testing 15%
%number of HN 24
%d=24
load('netNARX.mat')
%% прогноз
netcNARX = closeloop(netNARX);
netcNARX.name = [netNARX.name ' - Closed Loop'];
% view(netcNARX)
% параметры прогноза
T = tonndata( Fort(end-23-24:end) , true, false);
[xc,xic,aic,tc] = preparets(netcNARX, num2cell(Xt(end-47:end)), {}, T);
yc = netcNARX(xc,xic,aic);
figure('Name','Ретроспективный прогноз на основе базисного ряда и NARX-сети','Color','w')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
hold on
plot(Xt,'r')
legend('VR','NARX forecast','Base Model from EMD')

figure('Name','Ретроспективный прогноз на основе базисного ряда и NARX-сети','Color','w')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','NARX forecast')