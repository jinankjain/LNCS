clc;
clear all;
format long;
tic();
load A.mat;
load b.mat;
m = length(b);
Nmax = 100;
tol = 0.001;
P = zeros(m,1);
for i = 1:m
	P(i) = b(i)/A(i,i);
end
x = zeros(m,1);
for i = 1:Nmax
	for k = 1:m
		temp = zeros(m,1);
		for j = 1:(k-1)
			temp(k) = temp(k) + A(k,j)*x(j);
		end
		for j = k+1:m
			temp(k) = temp(k) + A(k,j)*P(j);
		end
		x(k) = (b(k)-temp(k))/A(k,k);
	end
	if norm((x-P), inf) <= tol
		ans = i;
		ans;
		break;
	endif
	P = x;
end
P
ans
toc();
