function [ Modes ] = EMD( F )
%функция эмпирической модовой декомпозиции
% 3 длина ряда
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
        [max_y,max_x] = findpeaks(xstart);
        [min_y,min_x] = findpeaks(-1*xstart);
        min_y = -1 * min_y;
        max_x =[1 max_x];
        max_y = [xstart(1) max_y];
        min_x = [1 min_x];
        min_y = [-xstart(1) min_y];
        max_x = [max_x length(xstart)];
        min_x = [min_x length(xstart)];
        max_y = [max_y xstart(end)];
        min_y = [min_y -xstart(end)];
%         max_y(1) = xstart(1);
%         max_x(1) = 1;
%         min_y(1) = xstart(1);
%         min_x(1) = 1;
%         max_y(2:length(max_y_)+1) = max_y_;
%         min_y(2:length(min_y_)+1) = min_y_;
%         max_x(2:length(max_x_)+1) = max_x_;
%         min_x(2:length(min_x_)+1) = min_x_;
        if length(max_y) < 3 || length(min_x) < 3
            break;
        else
        upper = spline(max_x,max_y,1:1:N);
        lower = spline(min_x,min_y,1:N); 
        mean_ul = (upper + lower)/2; 
        xstart = xstart - mean_ul;
        end
    end
    
    mode(:,nm)=xstart; 
    xend = xend - xstart ;
    mode(:,Nc) = xend;

end
Modes= Modes + mode; 
Modes = Modes * Fstd; 
Modes = Modes';
Modes(1,:) = [];
end

