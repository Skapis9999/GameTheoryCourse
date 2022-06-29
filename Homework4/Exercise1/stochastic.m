function A = stochastic (gamma)
q1=[5,2,3,1];
q2=[3,-3,-2,4];
q3=[0,0,0,0];
p1=[0.5,0.25,0.25; 0,1,0; 0.33,0.33,0.33; 0.5,0,0.5];
p2=[0.25,0.5,0.25; 0.5,0.25,0.25; 0.5,0.25,0.25; 0.25,0.5,0.25];
p3=[0,0,1; 0,0,1; 0,0,1; 0,0,1];

syms x1 x2;

eq1=[q1(1)+gamma*(p1(1,1)*x1+p1(1,2)*x2),q1(2)+gamma*(p1(2,1)*x1+p1(2,2)*x2),q1(3)+gamma*(p1(3,1)*x1+p1(3,2)*x2),q1(4)+gamma*(p1(4,1)*x1+p1(4,2)*x2)];
eq2=[q2(1)+gamma*(p2(1,1)*x1+p2(1,2)*x2),q2(2)+gamma*(p2(2,1)*x1+p2(2,2)*x2),q2(3)+gamma*(p2(3,1)*x1+p2(3,2)*x2),q2(4)+gamma*(p2(4,1)*x1+p2(4,2)*x2)];

eqn=findVal(eq1);
eqn2=findVal(eq2);

S = vpasolve([eqn==x1,eqn2==x2], [x1 x2]);
S.x1;
S.x2;

A =[double(S.x1)';double(S.x2)'];

endfunction
