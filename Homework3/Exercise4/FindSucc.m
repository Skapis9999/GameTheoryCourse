function S = FindSucc (Tr,U,D)
  s=size(Tr,1);
  S=-ones(s,1);
  for j=1:s
    for t=1:s
      if(Tr(t)==j&&U(t)==U(j)) #checks if node is child and if payoff is max
        S(j)=t; #highest payoff child node stored as best next move
    endfor
  endfor
endfunction


#Tr(t) returns the parent node of node t
#U(t)==U(j) means that the parent j has the same payoff as child t which
#only happens if child t has the best payoff among j's children