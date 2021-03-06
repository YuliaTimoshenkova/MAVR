clear all
close all
%-- ������������ ������� ������������
%% 26 - 28
t = linspace(0,1,128); 
F = sin(2*pi*10*t) + sin(2*pi*20*t);
Modes = EMD(F);
figure('Name','F = sin(2*pi*10*t) + sin(2*pi*20*t);','Color','w')
plot(t,F,'k')
hold on
plot(t,Modes(1,:),'r')
hold on
plot(t,Modes(7,:))
legend('signal','emd1','emd2')
wvtool(Modes(1,:))
% figure('Color','w')
% plot(G,'r')
% hold on
% plot(Modes(2,:),'k')
%% 29 - 30
t = linspace(0,1,128); 
F = sin(2*pi*10*t) + sin(2*pi*20*t) + sin(2*pi*15*t) + sin(2*pi*25*t); 
Modes = EMD(F);
G = sin(2*pi*10*t);
figure('Name','�� 4 ���������','Color','w')
plot(G,'r')
hold on
plot(Modes(1,:),'k')
legend('signal','emd1')
%% 31-33
load freqbrk;
F = freqbrk;
figure('Name','�� � ������ �����������������','Color','w')
plot(F,'r')
Modes = EMD(F);
hold on
plot(Modes(1,:),'k')
legend('signal','emd1')
F = wgn(1,1e4,0);
figure('Name','��,���������� ������ ����� �����','Color','w')
plot(F,'r')
Modes = EMD(F);
hold on
plot(Modes(1,:),'k')
t=linspace(0,1,1000);
F = chirp(t,0,1,100);
figure('Name','�� � ���� ��� ������� �� 0 �� 100 ��','Color','w')
plot(F,'r')
Modes = EMD(F);
hold on
plot(Modes(1,:),'k')
t=linspace(0,1,500);
F=sin(2*pi*10*t)+sin(2*pi*20*t)+0.2*randn(1,500);
figure('Name','�� � ���� 2-� �������� � �����','Color','w')
plot(F,'r')
Modes = EMD(F);
hold on
plot(Modes(1,:),'k')
legend('signal','emd1')

%% 39-40 �������, ������� �������� ��������  ��� F,  ���  ���������  ����� t �  ���������� ������� ���������� ������� �� ������� f_ht
%��� ������� ������� ��� ������ � �������� �� 0 �� 100 ��: 
t = linspace(0,1,1000);
F = chirp(t,0,1,100);
%% 41 - 42
f_ht = Instantaneous_Frequency(F, t);
figure('Name','������ �� � ���� ��� ������� �� 0 �� 100 ��','Color','w')
plot(f_ht,'k')
legend('��������� ������� �� ��������')%,'���������� ������� ��������')
% ���  �����  ��  �������  3,  ��������  �����  ���  ���  �����  100% 
% �������� �������� ������� ������� �� ������� ��� ��� ������� 
% �
% ����� �� 0 �� 100 ��, ��� � ���������. ������, �������, ���������� 
% ��  ���������,  �����  ���������  ���������.  �
% �  ����  ������� 
% �������� ���������� �������, ���������� �� ���������,
% ������ 
% ���������� ��� �������������� �������
% . 
% 43)
% ����������, ��������� ������� ���������� ������� ��� ��:
% ��� ������ � �������� �� 5 �� 50 ��;
% ��� ������ � �������� �� 200 �� 300 ��;
% ������
% ����
% ��
% �� ������ � �������� �� 0 �� 250 �� (��� ���� ����� 
% ������� 
% ������������ �����
% !);
% �� � ������ ���������� ������� 
% freqbrk
% ;
% 44)
% �������� ���������� ���������� �� ���������������. ����� �� 
% ����������� ��� ���
% �
% ��� ����� ��������� � ������?
% 45)
% ���������� ������
% ��� 
% ���������� �������
% ��� �� �� 
% ������� 
% �������� 
% � ��������� 10 ��, 40 ��, 80 ��, 160 ��. ������ ���������� 
% ������  ����
% �
% �  ������������������
% ����������  ���������.  ���  � 
% ������ ����. 
