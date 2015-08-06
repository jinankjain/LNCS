clc;
clear all;
format long;
tic();
load A.mat;
load b.mat;
m = length(b);

Nmax = 100;
tol = 0.0001;

% Initial Approximation Value
P = zeros(m,1);
for i = 1:m
	P(i) = b(i)/A(i,i);
end
x = zeros(m,1);

%Iterations for Jacobi method
for i = 1:Nmax
	for k = 1:m
		temp = zeros(m,1);
		for j = 1:m
			if(j!=k)
			 	temp(k) = temp(k) + A(k,j)*P(j);
			endif
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
