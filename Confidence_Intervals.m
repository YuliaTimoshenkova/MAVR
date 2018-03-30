function [ tv , tn ] = Confidence_Intervals( tau , delta )
% доверительные интервалы для тренда первого порядка
tv = tau + delta;
tn = tau - delta;

end

