function P = FindPath (p, D, S)
  s=2*D;
  P=zeros(s,1);
  a=p;
  j=1;
  do
    P(a)=j;
    a++;
    j=S(j); #move to the optimal child node
  until ((S(j)==-1)) #reach a final node
  P(a)=j;#add the final node to the path
  P=P(1:a)  #keep only the non-zero elements
endfunction