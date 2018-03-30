function [  ] = Analis_VR( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

figure(3);
plot(x,'--r'); 
%5
N = length(x);
m = mean(x);
m_mine = sum(x) * (1 / N);
%6
d = var(x);
d_mine = sum((x-m).^2)*(1/(N-1))
%7
a = (mean((x-m).^3))/((std(x))^3);
%8
e = (mean((x-m).^4))/((std(x))^4);
%9
l = 20;
corr = autocorr(x);
corr_mine = My_autocorr(x,l);
corr_coef = corrcoef(x);
figure();
title('јвтокоррел€ци€');
plot(0:20,corr);
end

