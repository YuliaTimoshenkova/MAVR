clear all
close all
load('Fort.mat')
%% 1- 33
load('net.mat')
load('net_m.mat')
figure('Name','�������� ��','Color','w')
plot(Fort,'k')
legend('�������� ��')
%ntstool
%% 34 - 35 ��������� ������ ��������
netc = closeloop(net);
netc.name = [net.name ' - Closed Loop'];
%view(netc)
%% 36- 37 ��������� ��������
T = tonndata( [Fort(end-23:end) NaN(1,48)] , true, false);
%������������ ����������:
[xc,xic,aic,tc] = preparets(netc,{},{},T);
yc = netc(xc,xic,aic);
%% 38 - 39 ���������� ��������
figure('Name','������� � ������� ��������� NAR-������','Color','w')
title('������� � ������� ��������� NAR-������')
plot(1:174, Fort, 174:174+48, [Fort(end) cell2mat(yc)])
legend('VR','Forecast')
%% 40 
T = tonndata( [Fort(end-23-24:end-24) NaN(1,24)] , true, false);
%����� ��� �������� �����. �������� ����������:
[xc,xic,aic,tc] = preparets(netc,{},{},T);
%� �������� ������� ����� �����.
yc = netc(xc,xic,aic);
%��������� ���� ������� �� 24 ����� (������� 10):
figure('Name','��������������� ������� �� 24 ����� ','Color','w')
title('� ��������������� ������� �� 24 ����� ')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','Forecast')
%% 41 
%����������� ����� ������ ���������������� ��������, � ����:
T = tonndata( Fort(end-23-24:end) , true, false);
%% 42
%����� ��� �������� �����. �������� ����������:
[xc,xic,aic,tc] = preparets(netc,{},{},T);
%� �������� ������� ����� �����.
yc = netc(xc,xic,aic);
%��������� ���� ������� �� 24 ����� (������� 10):
figure('Name','2 ������� ��������������� ������� �� 24 ����� ','Color','w')
title('2 ������� ��������������� ������� �� 24 ����� ')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','Forecast')
%% 43 ��� ������ ��������� ����
% training 80%
% validation 10%
% testing 10%
% hidden neurons 20
% d = 24
% Bayesian Regularization
% ��������� ������ ��������
netc_m = closeloop(net_m);
netc_m.name = [net_m.name ' - Closed Loop'];
%view(netc_m)
% ��������� ��������
T = tonndata( [Fort(end-23:end) NaN(1,48)] , true, false);
%������������ ����������:
[xc,xic,aic,tc] = preparets(netc_m,{},{},T);
yc = netc_m(xc,xic,aic);
%% 44 - 45 ���������� ��������
figure('Name','������� � ������� ��������� NAR-������ � ����� �����������','Color','w')
title('������� � ������� ��������� NAR-������ � ����� �����������')
plot(1:174, Fort, 174:174+48, [Fort(end) cell2mat(yc)])
legend('VR','Forecast')
% ��������� ��������
T = tonndata( [Fort(end-23-24:end-24) NaN(1,24)] , true, false);
%����� ��� �������� �����. �������� ����������:
[xc,xic,aic,tc] = preparets(netc_m,{},{},T);
%� �������� ������� ����� �����.
yc = netc_m(xc,xic,aic);
%��������� ���� ������� �� 24 �����:
figure('Name','��������������� ������� �� 24 ����� � ����� �����������','Color','w')
title('��������������� ������� �� 24 ����� � ����� �����������')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','Forecast')
%% 46 - 48
%% �������� ����������
Modes = EMD(Fort);
Xt = Modes(2,:);
%ntstool
%training 75%
%validation 10%
%testing 15%
%number of HN 24
%d=24
load('netNARX.mat')
%% �������
netcNARX = closeloop(netNARX);
netcNARX.name = [netNARX.name ' - Closed Loop'];
% view(netcNARX)
% ��������� ��������
T = tonndata( Fort(end-23-24:end) , true, false);
[xc,xic,aic,tc] = preparets(netcNARX, num2cell(Xt(end-47:end)), {}, T);
yc = netcNARX(xc,xic,aic);
figure('Name','��������������� ������� �� ������ ��������� ���� � NARX-����','Color','w')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
hold on
plot(Xt,'r')
legend('VR','NARX forecast','Base Model from EMD')

figure('Name','��������������� ������� �� ������ ��������� ���� � NARX-����','Color','w')
plot(1:174, Fort, 174-24+1:174, [cell2mat(yc)])
legend('VR','NARX forecast')