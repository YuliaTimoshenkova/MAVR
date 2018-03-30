% clear all
% close all
% Create a random 1D signal
t = linspace(0,1,50); 
F = sin(2*pi*10*t) + sin(2*pi*20*t);
[maxPeaks,maxLocs] = findpeaks(F);
[minPeaks,minLocs] = findpeaks(-F);
minPeaks  = -1 * minPeaks;
figure()
plot(F)
hold on
plot(maxLocs, maxPeaks, '*' )
hold on
plot(minLocs, minPeaks,'r*' )
N =  length(F);
% 4
if size(F,2) < size(F,1), F = F'; end
% 5 нормируем ряд
Fstd = std(F); 
F = F / Fstd; 
% 6 Вычисляем, сколько у нас будет компонент: 
Nc = fix(log2(N)) + 1; 
% 7 Выделяем память под конечный результат и под все моды: 
Modes = zeros(N,Nc); 
mode = zeros(N,Nc); 
% 8-9
mode(:,1) = F;
xend = F;
% 10
for nm = 2:Nc-1
    xstart = xend;
    for j = 1:10 
%         s1 = getspline(xstart);
%         s2 = -getspline(-xstart);
%         mean_ul = (s2 + s1)/2;
        [maxPeaks,maxLocs] = findpeaks(xstart);
        [minPeaks,minLocs] = findpeaks(-1*xstart);
        minPeaks = -1 * minPeaks;
        upper = spline(maxPeaks,maxLocs,1:1:N);
        lower = spline(minPeaks,minLocs,1:1:N); 
        mean_ul = (upper + lower)/2; 
        xstart = xstart - mean_ul;
        mode(:,nm)=xstart; 
        xend = xend - xstart;        
   
    end
 mode(:,Nc) = xend;

end
Modes= Modes + mode; 
Modes = Modes * Fstd; 
Modes = Modes';
Modes(1,:) = []; 

% t=linspace(0,1,128);
% F=sin(2*pi*10*t)+sin(2*pi*20*t);
% 
% %% emd
% N =  length(F);
% % 4
% if size(F,2) < size(F,1), F = F'; end
% % 5 нормируем ряда
% Fstd = std(F); 
% F = F / Fstd; 
% % 6 Вычисляем, сколько у нас будет компонент: 
% Nc = fix(log2(N)) + 1; 
% % 7 Выделяем память под конечный результат и под все моды: 
% Modes = zeros(N,Nc); 
% mode = zeros(N,Nc); 
% % 8-9
% mode(:,1) = F;
% xend = F;
% % 10
% for nm = 2:Nc-1
%     xstart = xend;
%     for j = 1:10 
%         h = diff(F);
%         maxmin = []; 
%       for i=1:N-2
%          if h(i)==0                        
%             maxmin = [maxmin, i];
%          elseif sign(h(i))~=sign(h(i+1))   
%             maxmin = [maxmin, i+1];        
%          end
%       end
%       
%       if size(maxmin,2) < 2 
%          break
%       end
%       
%       if maxmin(1)>maxmin(2)              % first one is a max not a min
%          maxes = maxmin(1:2:length(maxmin));
%          mins  = maxmin(2:2:length(maxmin));
%       else                                % is the other way around
%          maxes = maxmin(2:2:length(maxmin));
%          mins  = maxmin(1:2:length(maxmin));
%       end
%       maxes = [1 maxes N];
%       mins  = [1 mins  N];
%       maxenv = spline(maxes,F(maxes),1:N);
%       minenv = spline(mins, F(mins),1:N);
%         upper = maxenv;%spline(max,F(max),1:1:N);
%         lower = minenv;%spline(min,F(min),1:N); 
%         mean_ul = (upper + lower)/2; 
%     xstart = xstart - mean_ul;
%     mode(:,nm)=xstart; 
%     xend = xend - xstart;        
%    
%     end
%  mode(:,Nc) = xend;
% 
% end
% Modes= Modes + mode; 
% Modes = Modes *Fstd; 
% Modes = Modes';
% Modes(1,:) = []; 
% 
% G = sin(2*pi*20*t)
% figure('Color','w')
% plot(G,'r')
% hold on
% plot(Modes(1,:),'k')
% 
% % figure('Name','ВР из двух гармоник с шумом','Color','w')
% % plot(t*100, F, 'k')
% % title('ВР из двух гармоник с шумом')
% % N = length(F);
% % p = 0;
% % for L = 10:N/2
% %     a(1:9) = NaN;
% % K = N-L+1; 
% % X = zeros(L,K);  
% % for i = 1:K
% %     X(1:L,i) = F(i:L+i-1); 
% % end
% % S = X*X'; 
% % [U,A] = eig(S);
% % [lambda,i] = sort(-diag(A));  
% % lambda = -lambda;
% % for j = 1:length(lambda)-1
% %     l(j) = abs(lambda(j+1) - lambda(j));
% % end 
% % w(L,1:length(l)) = l(1,1:length(l));
% % a(L) = std(l);
% % end
% % L_best = find(a==min(a)); %=37
% % 
% % L = 100; % длина окна
% % [lambda,U,V]=SSA_modes(F,L); % функция разбиения
% % функция группировки
% G1 = SSA_group(L,lambda,U,V,[1 3]);
% G2 = SSA_group(L,lambda,U,V,[2 4]);
% figure('Name','Выделенные из ВР гармоники ','Color','w')
% subplot(2,1,1)
% plot(G1, 'k')
% title('Выделенные из ВР гармоники ')
% subplot(2,1,2)
% plot(G2, 'k')
% L_best


% a = [1 2 3 4 5 6];
% X(1,1:3) = a(1:3)';
% X(2,1:3)= a(2:4)';
%  f1=10;
% f2=45;
% t=0:0.001:4;   
% F = sin(2*pi*f1*t)+sin(2*pi*f2*t)+0.1*randn(1,length(t));
% L = 10;
% N = length(F);
% %% 5
% K = N - L + 1;
% %% 6- 7 Строим матрицу 
% n = length(F(1:2+L-2)');
% X = ones(1,n)
% X(1,1:n) = F(1:2+L-2)';
% for i = 2:K
%     X(i,1:n)=F(i-1:i+L-2)';
% end
% % load('3.mat')
% % y = x;
% % N = length(y);
% X = [ones(1, length(y)); 1 : length(y); (1 : length(y)).^2,; (1 : length(y)).^3];
% X = X';
% b = (X'*X)^-1*X'*y;
% 
% e = y - X*b;
% ch = 0;zn = 0;e(N+1)=e(N);
% for i = 1:N
%     
%     ch = ch + (e(i)-mean(e))*((e(i+1)-mean(e)));
%     zn = zn + (e(i)-mean(e))^2;
% end
% nu = (N/(N-1))*ch/zn;
% std = sqrt(1-nu^2);
% G = diag([10e-2 10e-2]);
% b(1) = 1;
% for i = 2:N
%     b(i) = 1 + nu^2;
% end
% D = diag(b);
% for i = 1:N
%     for j = 1:N
%         if D(i,j) == (1 + nu^2)
%             D(i-1,j) = -nu;
%             D(i,j-1) = -nu;
%         end
%     end
% end
% V = D';
% Vs = V * 1 / std^2;
% b1 = (X'*(Vs)^(-1)*X)^(-1)*X'*(Vs)^(-1)*y;
% e = y - X*b1;
% ch = 0;zn = 0;e(N+1)=e(N);
% for i = 1:N
%     
%     ch = ch + (e(i)-mean(e))*((e(i+1)-mean(e)));
%     zn = zn + (e(i)-mean(e))^2;
% end
% nu1 = (N/(N-1))*ch/zn;
% std1 = ((1-nu1^2)/N)*zn