function win= isCopWin(A)
  k=size(A,1); %number of edges
  n=max(max(A)); %number of vertices 
  outD=zeros(n,1); %find outdegree for each vertice  
  for i=1:k
    temp=A(i,1);
    outD(temp)+=1;
  endfor
  maxOut=max(outD); %to save computational time and space
    
  nextVertices=zeros(n,maxOut);
  for i=1:n
    temp=outD(i);%node I will have outD children
    for j=1:k
      if(A(j,1)==i) %find the edges that start from vertice n
        nextVertices(i,temp)=A(j,2); %fill with children nodes of n
        temp-=1; %should never go below 1
      endif
    endfor
  endfor
  
  nextVertices
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
      elseif(outD(i)==0)
        in(i)=0;
        done=0;
      else
        in(i)=0;
        for j=1:outD(i)
          temp=nextVertices(i,j); %check for existing childern
          %temp(temp==0)=[];
          if(in(temp)==1)
            in(i)=1; %we need at least one children node to still exist in the graph
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