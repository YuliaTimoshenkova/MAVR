function [ predict_trend ] = Predict_T( trend, b, M )

global nyse
N = length(trend);
predict_trend = nyse;
if length(b) == 2
%     for l = N-M:1:N-1
%         predict_trend(l+1) = b(1)+ trend(l+1)*b(2); 
%     end
predict_trend = nyse(1:N-1);
for t = 1:M
    predict_trend(N+t-M-1) = b(1) + trend(N-M) * b(2);
end
end
if length(b) == 3
    for l = N-M:N
        predict_trend(l) = b(1) + b(2)*trend(l) + b(3)*trend(l)^2;
    end
end
if length(b) == 4
	for l = N-M:N
        predict_trend(l) = b(1) + b(2)*trend(l) +b(3)*trend(l)^2+ b(4)*trend(l)^3;
    end
end
end

