function U = BackInd (p,U0,Tr,O)
s=size(Tr,1);
U=zeros(s,1);



for j=1:s
  if (U0(j))                  #for final states we have fixed payoff
    if(O(j-1)==p)
      U(j)=2*U0(j)-1; %prop hitting *1 plus prop of missing *(-1)
    else
      U(j)=1-2*U0(j); 
    endif
  endif
endfor

for j=s:-1:1              #start from final node and update step by step
  if (!U0(j))
    if(j==s-1)
      U(j)=U(j+1);
    else
      if(O(j)==p) 
        U(j)=max(U(j+1),U(j+2)); #player one tries to maximise the payoff
      else
        U(j)=min(U(j+1),U(j+2));#player two tries to minimise the payoff
      endif
    endif
  endif
endfor
endfunction

