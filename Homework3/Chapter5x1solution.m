%% Solver

% figure(1)
% [x1,x2] = meshgrid(0:0.1:1,0:0.1:1);
% eqn = -2*x2*x1^3 + 3*x2*x1^2 -4*x1^3+5*x1^2-x1*x2-x1;
% surf(x1,x2,eqn)
% 
% figure(2)
% x1 = 0:0.1:1;
% x2 = 0;
% eqn = -2*x2*x1.^3 + 3*x2*x1.^2 -4*x1.^3+5*x1.^2-x1*x2-x1;
% plot(x1,eqn)
% hold on 
% x = 0:0.001:1;
% c=0;
% const = @(x)(c).*x.^(0);
% plot(x, const(x))
% 
% syms x1 x2
% 
% eqn = -2*x2*x1^3 + 3*x2*x1^2 -4*x1^3+5*x1^2-x1*x2-x1
% 
% S = solve(eqn,[x1 x2]);
% S.x1
% S.x2



%% Checking all three solutions 

% x1 = 1/4;
% x2 = 0;

% x1 = 0;
% x2 = 0;

% x1 = -1.7808;
% x2 = -1.7808;
% 
% eqn = -2*x2*x1^3 + 3*x2*x1^2 -4*x1^3+5*x1^2-x1*x2-x1

% syms x1 x2
% 
% eqn = 2*x2*x1 +4*x1-x2-1;
% 
% S = solve(eqn,[x1 x2]);
% S.x1
% S.x2

syms x1 x2
eqn1 = -2*x2*x1^3 + 3*x2*x1^2 -4*x1^3+5*x1^2-x1*x2-x1;
eqn2 = -2*x2^3*x1 + 3*x2^2*x1 -4*x2^3+5*x2^2-x1*x2-x2;
eqns = [eqn1,eqn2];
S = solve(eqns);
A =[double(S.x1)';double(S.x2)'];

J=jacobian(eqns,[x1,x2]);
a=[0,1,0,1,1/4,0,1,1/3,-1.7808,0.2808];
b=[0,0,1,1,0,1/4,1/3,1,-1.7808,0.2808];
i=10;
[a(i),b(i)];
j1 = subs(J,[x1,x2],[a(i),b(i)]);