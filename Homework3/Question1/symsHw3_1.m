clear all
pkg load symbolic

syms x1 x2

x = x1 + x2;
profit1 = x1*(100 - 2*sqrt(x1+x2)) - (x1+10);
profit2 = x2*(100 - 2*sqrt(x1+x2)) - (2*x2+5);

dx1 = diff(profit1,x1);
dx2 = diff(profit2,x2);

eqns = [dx1,dx2];
S = solve(eqns,[x1 x2]);

A =[double(S.x1)';double(S.x2)']

% subs(dx1, [x1 x2], [795.8800 756.4800]);
% subs(dx1, [x1 x2], [796 756]);
% subs(dx2, [x1 x2], [796 756]);

J=jacobian([profit1 profit2],[x1,x2]);
j1 = subs(J,[x1,x2],[A(1),A(2)]);
%negative eigen values

p1 = subs(profit1, [x1,x2], [795.8800 756.4800])
p2 = subs(profit2, [x1,x2], [795.8800 756.4800])
p1 = subs(profit1, {x1,x2}, {796 756});
p2 = subs(profit2, [x1,x2], [796 756]);
