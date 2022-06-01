function U = BackInd (1,U0,Tr,O)
s=size(Tr,1);
U=zeros(s,1);

for j=1:s
  if (U0(j)) #for final states we have fixed payoff
    U(j)=U0(j)
endfor

for j=s:-1:1 #start from final node and update step by step
  max=0;
  if (!U0(j)) #for non-final states we need to examine child-nodes
    for t=1:s
      if(Tr(t)==j&&U(t)>max) #nodes that have our current node as a parent
        max=U(t)  #update the maximum payoff for the current node
      endif
    endfor
    U(j)=max;
endfor
endfunction
