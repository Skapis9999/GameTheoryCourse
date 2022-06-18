clearvars

%% Chapter 5

a11 = 2;
a10 = 2;
a01 = -9;
a00 = -9;

syms x1 x2
% Equations with x and y, a's replaced with numerical values for chapter4
% eqn = (1*x*y+2*x*(1-y)+-3*(1-x)*y+-4*(1-x)*(1-y))*x*(1-x);
% eqn2 = (1*x*y+2*y*(1-x)+-3*(1-y)*x+-4*(1-y)*(1-x))*y*(1-y);
eqn = (a11*x1*x2+a10*x1*(1-x2)+a01*(1-x1)*x2+a00*(1-x1)*(1-x2))*x1*(1-x1);
eqn2 = (a11*x1*x2+a10*x2*(1-x1)+a01*(1-x2)*x1+a00*(1-x2)*(1-x1))*x2*(1-x2);

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