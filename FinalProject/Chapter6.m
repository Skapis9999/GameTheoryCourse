clearvars

%% Chapter 6

a11 = 1;
a10 = 1;
a01 = -1;
a00 = -1;

b00 = 1;
b01 = -3;
b10 = 2;
b11 = -4;

syms x1 x2
% Equations with x and y, a's replaced with numerical values for chapter4
% eqn = (1*x*y+1*x*(1-y)-1*(1-x)*y-1*(1-x)*(1-y))*x*(1-x);
% eqn2 = (-4*x*y-3*y*(1-x)+2*(1-y)*x+1*(1-y)*(1-x))*y*(1-y);
eqn = (a11*x1*x2+a10*x1*(1-x2)+a01*(1-x1)*x2+a00*(1-x1)*(1-x2))*x1*(1-x1);
eqn2 = (b11*x1*x2+b10*x1*(1-x2)+b01*(1-x1)*x2+b00*(1-x2)*(1-x1))*x2*(1-x2);

S = vpasolve([eqn==0,eqn2==0], [x1 x2]);
S.x1;
S.x2;
% Equilibria
A =[double(S.x1)';double(S.x2)'];

% Jacobians
eqns = [eqn,eqn2];
J=jacobian(eqns,[x1,x2]);
a = size(A(1,:));
for i = 1:a(2)
    % remove ; to see couples and their Jacobians
    [A(1,i),A(2,i)]
    j1 = subs(J,[x1,x2],[A(1,i),A(2,i)])
    eig(j1)
end
