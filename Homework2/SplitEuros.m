function [A1,A2,P]=SplitEuros(K)
  A1=zeros(K,K);
  A1=zeros(K,K);
  for i=1:K
    for j=1:K
      if (i+j <= K)
        A1(i,j)=i;
        A2(i,j)=j;
      endif
    endfor
  endfor
  [p1,V1,p2,V2] = FictPlayB(A1,A2,1,1,10);
  %[p1,V1,p2,V2] = Nash(A1,A2); %for non-pure strategies
  P=[p1;p2];
endfunction