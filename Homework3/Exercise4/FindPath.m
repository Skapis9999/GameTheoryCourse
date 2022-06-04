function P = FindPath (1, D, S)
  P=zeros(s,1);
  a=1;
  j=1;
  do
    P(a)=j;
    a++;
    j=S(j); #move to the optimal child node
  until ((S(j)!=-1)) #reach a final node
  P(a)=j;#add the final node to the path
  P=P(1:a)
endfunction
