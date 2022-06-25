function win= isCopWin(A)
  k=size(A,1); %number of edges
  n=max(max(A)); %number of vertices 
  outD=zeros(n,1); %find outdegree for each vertice    
  for i=1:k
    temp1=A(i,1);
    temp2=A(i,2);
    outD(temp1)+=1;
    outD(temp2)+=1;
  endfor
  maxOut=max(outD); %to save computational time and space
    
  nextVertices=zeros(n,maxOut);
  for i=1:n
    temp=outD(i);%node I will have outD children
    for j=1:k
      if(A(j,1)==i) %find the edges that start from vertice i
        nextVertices(i,temp)=A(j,2); %fill with children nodes of i
        temp-=1; %should never go below 1
      elseif(A(j,2)==i) %find the edges that start from vertice i
        nextVertices(i,temp)=A(j,1); %fill with children nodes of i
        temp-=1; %should never go below 1      
      endif
    endfor
  endfor
  
  done=0;
  in=ones(n,1);%becomes zero for pitfalls we remove
  for o=1:n+1
    in
    if(done==1) %all nodes have been removed
      break
    endif
    done=1;
    for i=1:n
      if(!in(i)) %node has been removed
        continue
      elseif(outD(i)==1)
        in(i)=0;
        done=0;
      else
        in(i)=0;
        count=0;
        for j=1:outD(i)
          temp=nextVertices(i,j); %check for existing childern
          if(in(temp)==1)
            count+=1;
          endif
          if(count>=2) %node needs at least 2 neighbours to not be a pitfall
            in(i)=1;
          endif
        endfor
      endif
      done=0; %gets executed in a loop unless all nodes have been removed
    endfor
  endfor 
  
  if(any(in))
    win=0;
  else
    win=1;
  endif
endfunction
