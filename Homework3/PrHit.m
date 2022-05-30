function PH = PrHit (D,K)
  PH=zeros(D+1,1)
  for i=1:D+1
    PH(i)=1-(1/K)*(i-1); %1 chance at 0 distance, 0 chance at D distance
  endfor
endfunction
