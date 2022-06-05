function U = BackInd (p,U0,Tr,O)
s=size(Tr,1);
U=zeros(s,1);


% a and b are the probabillities to shoot and not to shoot
a=1/2;
b=1/2;

for j=1:s
  if (U0(j))                  #for final states we have fixed payoff
    if(O(j-1)==p)
      U(j)=U0(j)
    else
      U(j)=-U0(j)
    endif
    endif
endfor

for j=s:-1:1                  #start from final node and update step by step
##  max=0;
##  if (!U0(j))                 #for non-final states we need to examine child-nodes
##    for t=1:s
##      if(Tr(t)==j&&U(t)>max)  #nodes that have our current node as a parent
##        max=U(t)              #update the maximum payoff for the current node
##      endif
##    endfor
##    endif
##    U(j)=max+1;
  if (!U0(j))
    if(j==s-1)
      U(j)=U(j+1)
    else
      U(j)=a*U(j+1)+b*U(j+2)
    endif

  endif


endfor
endfunction
