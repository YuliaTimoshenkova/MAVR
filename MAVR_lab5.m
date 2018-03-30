clear all
close all
%% 1 - 33
% Создание функций 
%% 33 - 34
f1=10;
f2=45;
t=0:0.001:4;   
F = sin(2*pi*f1*t)+sin(2*pi*f2*t)+0.1*randn(1,length(t)); 
figure('Name','ВР из двух гармоник с шумом','Color','w')
plot(t*100, F, 'k')
title('ВР из двух гармоник с шумом')
%% 35 - 42 
L = 100; % длина окна
[lambda,U,V]=SSA_modes(F,L); % функция разбиения
% функция группировки
G1 = SSA_group(L,lambda,U,V,[1 3]);
G2 = SSA_group(L,lambda,U,V,[2 4]);
figure('Name','Выделенные из ВР гармоники ','Color','w')
subplot(2,1,1)
plot(G1, 'k')
title('Выделенные из ВР гармоники ')
subplot(2,1,2)
plot(G2, 'k')
%% 43
L = 100; % длина окна
[lambda,U,V]=SSA_modes(F,L); % функция разбиения
% функция группировки
G1 = SSA_group(L,lambda,U,V,[1 3]);
G2 = SSA_group(L,lambda,U,V,[2 4]);
figure('Name','Подбор нужного окна ','Color','w')
subplot(2,1,1)
plot(G1, 'k')
title('Подбор нужного окна ')
subplot(2,1,2)
plot(G2, 'k')
%% 44 - 45
t=0:0.001:4;  
F = exp(-pi*t) + 0.5*randn(1,length(t)); 
figure('Name','ВР из двух гармоник с шумом','Color','w')
plot( F, 'k')
title('ВР из двух гармоник с шумом')
L = 100; % длина окна
[lambda,U,V]=SSA_modes(F,L); % функция разбиения
% функция группировки
G1 = SSA_group(L,lambda,U,V,[1 3]);
G2 = SSA_group(L,lambda,U,V,[2 4]);
figure('Name','exp Выделенные из ВР гармоники ','Color','w')
subplot(2,1,1)
plot(G1, 'k')
title('Выделенные из ВР гармоники для exp')
subplot(2,1,2)
plot(G2, 'k')
%% 46
w = Window(F);
%% 47
f1 = 10;
f2 = 45;
f3 = 50;
f4 = 15;
t=0:0.001:4;   
F = sin(2*pi*f1*t) + sin(2*pi*f2*t) + ...
    sin(2*pi*f3*t) + sin(2*pi*f4*t) + ...
    0.1*randn(1,length(t)); 
figure('Name','ВР из 4 гармоник с шумом','Color','w')
plot(t*100, F, 'k')
title('ВР из 4 гармоник с шумом')
L = 100; % длина окна
[lambda,U,V]=SSA_modes(F,L); % функция разбиения
% функция группировки
G1 = SSA_group(L,lambda,U,V,[1 3]);
G2 = SSA_group(L,lambda,U,V,[2 4]);
G3 = SSA_group(L,lambda,U,V,[2 4]);
G4 = SSA_group(L,lambda,U,V,[2 4]);
figure('Name','Выделенные из ВР 4 гармоники ','Color','w')
subplot(4,1,1)
plot(G1, 'k')
title('Выделенные из ВР 4 гармоники ')
subplot(4,1,2)
plot(G2, 'k')
subplot(4,1,3)
plot(G3, 'k')
subplot(4,1,4)
plot(G4, 'k')