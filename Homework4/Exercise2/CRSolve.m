function [V,Sc,Sr]= CRSolve(A)
  k=size(A,1); %number of edges
  n=max(max(A)); %number of vertices
  s=2*(n^2) %number of states
  states=zeros(s,3); %(player1 position, player2 position, who plays next)
  nextStates=zeros(n-1,1);
  val=zeros(s,1); %current expected payoffs for each vertices

  outD=zeros(n,1); %find outdegree for each vertice  
  for i=1:k
    temp1=A(i,1);
    temp2=A(i,2);
    outD(temp1)+=1;
    outD(temp2)+=1;
  endfor
  maxOut=max(outD); %to save computational time and space
  
  %create all the possible states
  a=1;
  for i=1:n
    for j=1:n
      for m=1:2
        states(a,:)=[i,j,m]; %Cop vertex,Robber vertex, next move
        a++;
      endfor
    endfor
  endfor
  

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
  
  nextStates=zeros(s,maxOut+1); %stores the following states of each state
  for i=1:s
    cur1=states(i,1); %current position of the cop
    cur2=states(i,2); %current position of the robber    
    if(states(i,3)==1) %Cop moves
      temp=outD(cur1)+1; %amount of possible moves the cop has (+1: case he doesn't move)
      for j=1:s
        isNext=any(nextVertices(cur1,:)==states(j,1)); %cop position of state j can be reached from current cop position
        if(isNext&&states(j,2)==cur2&&states(j,3)==2) %only states where the robber plays
          nextStates(i,temp)=j;
          temp-=1;
        elseif(states(j,1)==cur1&&states(j,2)==cur2&&states(j,3)==2)
          nextStates(i,temp)=j; %cop stays at same vertice and robber plays now
          temp-=1;          
        endif 
      endfor
    else %Robber moves
      temp=outD(cur2)+1; %amount of possible moves the robber has(+1: case he doesn't move)
      for j=1:s
        isNext=any(nextVertices(cur2,:)==states(j,2));%robber position of state j can be reached from current robber position
        if(isNext&&states(j,1)==cur1&&states(j,3)==1) %only states where the cop plays
          nextStates(i,temp)=j;
          temp-=1;
        elseif(states(j,1)==cur1&&states(j,2)==cur2&&states(j,3)==1)
          nextStates(i,temp)=j; %robber stays at same vertice and cop plays now
          temp-=1;          
        endif 
      endfor
    endif
  endfor
  
  val=s*ones(s,1); %initialise the values as very large numbers
  for i=1:s
    temp1=states(i,1);%Cop's position
    temp2=states(i,2);%Robber's position
    if(temp1==temp2)
      val(i)=0;
    endif
  endfor
  
  
  for i=1:s-1%loop to find the values of each position
    for j=1:s
      if(states(j,1)==states(j,2))
        continue
      endif
      child=nextStates(j,:);%find the states you can go from state j
      child(child==0)=[];%remove zero elements
      child=val(child); %the values of the possible next states
      minv=min(child);
      maxv=max(child);
      if(states(j,3)==1)
        if(val(j)>minv+1)
          val(j)=minv+1; %cop minimises
        endif
      else
        if(val(j)!=maxv+1) %the value of state j is the best case among children state values plus 1 always
          val(j)=maxv; %robber maximises
          if(val(j)!=s) %to avoid values higher than n
            val(j)+=1;  
          endif
        endif
      endif
    endfor
  endfor
  
  Sc=zeros(n,n);
  Sr=zeros(n,n);
  V=zeros(n,n);
  for i=1:s %loop to fill the Sc,Sr,V tables
    child=nextStates(i,:);%find the states you can go from state i
    child(child==0)=[];%remove zero elements
    sz=size(child,2); %amount of possible moves from the current state
    CopPos=states(i,1);
    RobberPos=states(i,2);
    if(states(i,3)==1) %states where cop moves
      V(CopPos,RobberPos)=val(i);%Cop moves first 
      for j=1:sz
        if(val(child(j))==val(i)-1) %next position with best value
          CopPosNew=states(child(j),1); %where cop moves by choosing optimally
          Sc(CopPos,RobberPos)=CopPosNew;
        endif
      endfor
    else %states where robber moves
      for j=1:sz
        if(val(child(j))==val(i)-1) %next position with best value
          RobberPosNew=states(child(j),2); %where robber moves by choosing optimally
          Sr(CopPos,RobberPos)=RobberPosNew;
         endif
      endfor
    endif
  endfor
endfunction
