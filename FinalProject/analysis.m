function [] = analysis(a11,a10,a01,a00,b11,b10,b01,b00,j)
syms x1 x2

eqn = (a11*x1*x2+a10*x1*(1-x2)+a01*(1-x1)*x2+a00*(1-x1)*(1-x2))*x1*(1-x1);
eqn2 = (b11*x1*x2+b10*x2*(1-x1)+b01*(1-x2)*x1+b00*(1-x2)*(1-x1))*x2*(1-x2);

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
    [A(1,i),A(2,i)];
    j1 = subs(J,[x1,x2],[A(1,i),A(2,i)]);
    eig(j1);
end

% Phase Plots
figure(j)
[X,Y] = meshgrid(0:0.05:1,0:0.05:1);
clf
a = X;
b = f(X,Y,a11,a10,a01,a00,b11,b10,b01,b00);
c = b(:,1:size(X));
d = b(:,size(X)+1:end);
quiver(X,Y,c,d,'Color','r','LineWidth',2) 
hold on
plot(A(1,:),A(2,:), '.', 'markersize', 8)
end

