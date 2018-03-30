clear all
close all
%% 1 �������� ������� ��������
load('2.mat');
N = length(x);
%% 2 graph
figure(1);
plot(x,'r');
title('��')
%% 3 MX & DX
mx = mean(x);
dx = var(x);
%% 4 ��������������
acorr = autocorr(x);
figure(2);
plot(0:20,acorr);
title('��������������')
%% 5 �������������
periodogramma = periodogram(x);
%% 6 ������������ ��������� ��������
spect_pow = pwelch(x);
%% 7
figure(3);
periodogram(x);
hold on
pwelch(x);
%% 8
hold on
pmtm(x)
hold on
pburg(x,4)
hold on
pcov(x,4)
hold on
pmusic(x,4)
legend('periodogram','pwelch','pmtm','pburg','pcov','pmusic');
%% 10 ��������������
dt = 30 * 24 * 60 * 60;
Tmin = 2*dt;
%% 11 
% ��� N=24 ������� �������� ������������ �������� ������ 1.23 ( 0.05
alpha = 1.23;
anomals = Irvin(x,alpha);
%% 12 ������ �� � ������� �� 11�
figure()
plot (x,'r')
hold on
plot (anomals,'o')
title('��������')
%% 13 �������� �����
seria = K_Seria(x);
%% 14 - 15 ��������������
% ���������� �������
KPSS = kpsstest(x);
if KPSS == 1
    disp('�������� ������� (KPSS test)')
else
    disp('�������� ����������� (KPSS test)')
end
fisher = vartest2(x(1:N/2),x(N/2+1:N));
if fisher == 0
    disp('�������� ������� (�����)')
else
    disp('�������� ����������� (�����)')
end
%% 16
student = Student(x(1:N/2),x(N/2+1:N));