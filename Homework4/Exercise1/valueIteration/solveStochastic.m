function P=solveStochastic(q1,q2,q3,p1,p2,p3,gamma,T,s0)
  v1=findVal(q1);
  v2=findVal(q2);
  v3=0;  
  values=zeros(T,2);
  
  for j=T:-1:1
    for i=1:4
      q1(i)=q1(i)+(gamma*(p1(i,1)*v1+p1(i,2)*v2)); 
    endfor
    for i=1:4
      q2(i)=q2(i)+(gamma*(p2(i,1)*v1+p2(i,2)*v2));
    endfor
    v1=findVal(q1);
    v2=findVal(q2);
    values(j,1)=v1; 
    values(j,2)=v2;
  endfor
  
  if(s0==1)
    P=v1;
  elseif(s0==2)
    P=v2;
  else
    P=v3;
  endif  
  
  plot(values(:,1))
  hold on
  plot(values(:,2))  
  legend('q1','q2')
endfunction