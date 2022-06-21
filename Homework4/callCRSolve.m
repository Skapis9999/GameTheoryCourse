A1=[1,2;2,3;3,4];
A2=[1,2;2,3;3,4;4,1]; 
A3=[1,2;1,3;2,4;3,4;4,5];

[V,Sc,Sr]= CRSolve(A1)

%for validation
win= isCopWin(A1) %returns 1 if graph is cop win



