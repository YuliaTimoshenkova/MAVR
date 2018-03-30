function [ z1, z2, z3, a1, a2 ] = Make_AR_Model( x )
N = length(x);
a1 = aryule(x,1);
a2 = aryule(x,2);
a3 = aryule(x,3);
z3 = x;
for i = 4:N  
 z3(i) = -a3(2) * z3(i-1) -a3(3) * z3(i-2) - a3(4) * z3(i-3); 
end 
% Ра2
z2 = x;
for i = 3:N  
 z2(i) = -a2(2) * z2(i-1) + -a2(3) * z2(i-2); 
end
% Ра1
z1 = x;
for i = 3:N  
 z1(i) = -a1(2) * z1(i-1); 
end
end

