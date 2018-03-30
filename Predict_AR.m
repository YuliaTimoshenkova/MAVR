function [ tau ] = Predict_AR( y, a, M )
N = length(y);
tau = y;
if length(a) == 2
    for l = N-M:N
        tau(l) = a(1) + a(2) * y(l); 
    end
end
if length(a) == 3
    for l = N-M:N
        tau(l) = a(1) +a(2)*y(l) + a(3)*y(l)^2;
    end
end
if length(a) == 4
	for l = N-M:N
        tau(l) = a(1) +a(2)*y(l) + a(3)*y(l)^2 + a(4)*y(l)^3;
    end
end
end

