clear all
close all
%% первая часть 
%1
x = randn(1,10000);
%2
t = linspace(3,5,10000); 
N = length(x);
%3
figure(1);
plot(t,x,'r'); %стационарный ВР
title('стационарный ВР')
%5
m_v1 = mean(x);
m_mine_v1 = sum(x) * (1 / N);
%6
d_v1 = var(x);
d_mine_v1 = sum((x-m_v1).^2)*(1/(N-1))
%7
a_v1 = (mean((x-m_v1).^3))/((std(x))^3);
%8
e_v1 = (mean((x-m_v1).^4))/((std(x))^4);
%9
l = 20;
corr_v1 = autocorr(x);
corr_mine_v1 = My_autocorr(x,l);
corr_coef_v1 = corrcoef(x);
figure(2);
title('Автокорреляция');
plot(0:20,corr_v1);
hold on
plot(0:20,corr_mine_v1,'--r')
%% вторая часть 
load ('1.mat');
%x = z1;
Analis_VR(x)