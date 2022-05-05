function [p1,v1,p2,v2,test]=Nash(A1,A2)
 %initialization
 [M1,M2]=size(A1);
 x0=rand(M1+M2+2,1);

%required matrices for fmincon
 H=[zeros(M1,M1),A1,zeros(M1,2);A2',zeros(M2,M2+2);zeros(2,M1+M2+2)];
 c=[zeros(M1+M2,1);1;1];
 Ain=[zeros(M1,M1),A1,-ones(M1,1),zeros(M1,1);A2',zeros(M2,M2+1),-ones(M2,1)];
 bin=zeros(M1+M2,1);
 Aeq=[ones(1,M1),zeros(1,M2+2);zeros(1,M1),ones(1,M2),0,0];
 beq=[1;1];
 xlow=[zeros(M1+M2,1);-inf;-inf];
 xup=[ones(M1+M2,1);+inf;+inf];
 fun = @(x)-x'*H*x+c'*x;

%{
fmincon solves the nonlinear constrained minimization problem
min f (x) such that
Ainx <= bin
Aeqx = beq
xlow <= x <= xup
%}
 x = fmincon(fun,x0,Ain,bin,Aeq,beq,xlow,xup);


 p1=x(1:M1);
 p2=x(M1+1:M1+M2);
 v1=x(M1+M2+1);
 v2=x(M1+M2+2);
 test=fun(x);%have an actual NE the test output must be very close to 0

endfunction
