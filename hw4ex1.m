q1=[5,2,3,1];
q2=[3,-3,-2,4];
q3=[0,0,0,0];
p1=[0.5,0.25,0.25; 0,1,0; 0.33,0.33,0.33; 0.5,0,0.5];
p2=[0.25,0.5,0.25; 0.5,0.25,0.25; 0.5,0.25,0.25; 0.25,0.5,0.25];
p3=[0,0,1; 0,0,1; 0,0,1; 0,0,1];

gamma=0.7;
T=4;
s0=1; %the game starts from game s0

P=solveStochastic(q1,q2,q3,p1,p2,p3,gamma,T,s0)


