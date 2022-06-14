function P=solveStochastic(q1,q2,q3,p1,p2,p3,gamma,T,s0)
  v1=findVal(q1)
  v2=findVal(q2);
  v3=0;
  for i=1:4
    q1(i)=q1(i)+(gamma*(p1(i,1)*v1+p1(i,2)*v2)); 
  endfor
  for i=1:4
    q2(i)=q2(i)+(gamma*(p2(i,1)*v2+p2(i,2)*v2));
  endfor
  T=T-1;
  if T>1
    P=solveStochastic(q1,q2,q3,p1,p2,p3,gamma,T,s0);
  elseif(s0==1)
    P=v1;
  else
    P=v2;
  endif    
endfunction