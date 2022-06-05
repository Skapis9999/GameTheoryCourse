function S = FindSucc (Tr,U,D)
  s=size(Tr,1);
  S=-ones(s,1);
  k=1; #we start with player 1
  S(s-1)=s; #only one choice at the last step: to shoot.
  for j=1:s-2
    if(mod(j,2)) #for non-final nodes
      if(U(j+1)>=U(j+2)) #compare the payoff of the 2 child nodes
        if(k==1)  #player 1 chooses
          S(j)=j+1;
          k=2;
        else
          S(j)=j+2;
          k=1;
        endif
      else
        if(k==2) #player 2 chooses
          S(j)=j+1;
          k=1;
        else
          S(j)=j+2;
          k=2;
        endif
      endif
    endif 
  endfor
endfunction