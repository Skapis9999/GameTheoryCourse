function PH = PrHit (D,K)
  PH=zeros(D+1,1);
  for i=1:D+1
    PH(i)=1-(1/(K*D))*(i-1); %1 chance at 0 distance.(and 0 chance at D distance for K=1)
  endfor
endfunction