function [V,S1,S2]= DuelSolveZeroSum(A,K1,K2,M1,M2)
  Q1=1; %payoff player gets when hitting
  Q2=-1;%payoff player gets when getting hit
  n=max(max(A)); %number of vertices
  dmax=n-1;
  p1=zeros(dmax,1);
  p2=zeros(dmax,1);
  for i=1:dmax
    a=n-i;
    b=n-1;
    p1(i)=(a/b)^M1; %chance player one hits at distance d
    p2(i)=(a/b)^M2; %chance player two hits at distance d
  endfor

  s=2*(K1+1)*(K2+1)*(n^2); %we don't know the initial positions so we take all combinations
  states=zeros(s,5);
  
  a=1;
  %loop to create all states
  for i=1:n %player 1 position
    for j=1:n %player 2 position
      for k=1:K1+1
        for l=1:K2+1
          for m=1:2
            states(a,:)=[i,j,k-1,l-1,m]; %distance,bullets,who plays
            a++;
          endfor
        endfor
      endfor
    endfor
  endfor
  
  %since both players are maximizing we initialize values as minus infinite
  pay=zeros(s,1);  
  

    %loop to initialize the payoffs for the final states
  for i=1:s
    temp1=states(i,1);%player 1 position
    temp2=states(i,2);%player 2 position
    temp3=states(i,3);
    temp4=states(i,4);
    temp5=states(i,5);
    if(temp1==temp2-1||temp1==temp2+1)
      if(temp5==1&&temp3)
        pay1(i)=Q1;
        pay2(i)=Q2;
      elseif(temp5==1&&temp4)
        pay1(i)=Q2;
        pay2(i)=Q1;
      endif
    endif
  endfor
 
  
  
  %max 6 possible moves from each states
  % move+1,move-1,stay, stay&shoot
  nextStates=zeros(s,4); 
  
  P=-1*ones(s,4); %propability vextor of going to next positions

  for i=1:s
    if(states(i,1)==states(i,2))
      continue %save time
    endif
    if(states(i,3)==0&&states(i,4)==0)
      continue %save time
    endif
    temp1=states(i,1);%player 1 position
    temp2=states(i,2);%player 2 position
    temp3=states(i,3);
    temp4=states(i,4);
    temp5=states(i,5);
    a=1;
    if(temp5==1) %player 1 turn
      for j=1:s
        if(states(j,1)==temp2||states(j,2)==temp1)
          continue %save time
        endif
        if(temp2==states(j,2)&&temp4==states(j,4)&&states(j,5)==2)
          d=abs(states(j,1)-temp2);%distance between players. player 2 doesn't move
          if(abs(states(j,1)-temp1)<=1)%player moves 1 or stays in same vertice
            if(temp3==states(j,3))%player doesn't shoot
              nextStates(i,a)=j;
              P(i,a)=1;
              a+=1;
            elseif(temp3==states(j,3)+1&&states(j,1)==temp1)%player shoots
              nextStates(i,a)=j;
              P(i,a)=1-p1(d); %1 minus the chance of hitting & ending the game
              a+=1;
            endif
          endif
        endif
      endfor
    else
      for j=1:s %player 2 turn
        if(states(j,1)==temp2||states(j,2)==temp1)
          continue %save time
        endif
        if(temp1==states(j,1)&&temp3==states(j,3)&&states(j,5)==1)
          d=abs(states(j,2)-temp1);%distance between players. player 1 doesn't move
          if(abs(states(j,2)-temp2)<=1)
            if(temp4==states(j,4))%player doesn't shoot
              nextStates(i,a)=j;
              P(i,a)=1;
              a+=1;
            elseif(temp4==states(j,4)+1&&states(j,2)==temp2)%player shoots
              nextStates(i,a)=j;
              P(i,a)=1-p2(d); %1 minus the chance of hitting & ending the game
              a+=1;
            endif
          endif
        endif 
      endfor
    endif
  endfor

  best=zeros(s,1);
  %loop to find the values of each state
  for o=1:s
    for i=1:s
      if(states(i,1)==states(i,2))
        continue %avoid zero distance states, will never get there by playin optimally
      endif
      child=nextStates(i,:);%find the states you can go from state i
      child(child==0)=[];%remove zero elements
      sz=size(child,2);
      if(states(i,5)==1&&child) %player one moves
        for j=1:sz
          temp=child(j);%the next state number
          miss=P(i,j); %chance of missing and going to next state. zero if player doesn't shoot
          hit=1-miss; %chance of hitting and ending the game
          payoff=miss*pay(temp)*abs(Q1)+hit*Q1; %second part is zero if it's a non-shooting move
          if(payoff>=pay(i)||payoff==Q1)%maximizer
            best(i)=temp;
            pay(i)=payoff;
          endif
        endfor
      elseif(states(i,5)==2&&child) %player two moves 
        for j=1:sz
          temp=child(j);%the next state number
          miss=P(i,j); %chance of missing and going to next state. zero if player doesn't shoot
          hit=1-miss; %chance of hitting and ending the game
          payoff=-(miss*pay(temp)*abs(Q1)+hit*Q1); %second part is zero if it's a non-shooting move
          if(payoff<=pay(i)||payoff==Q1)%minimizer
            best(i)=temp;
            pay(i)=payoff;
          endif
        endfor
      endif
    endfor
  endfor

  S1=zeros(n,n);
  S2=zeros(n,n);
  V=zeros(n,n);
  for i=1:s
    temp1=states(i,1);
    temp2=states(i,2);
    temp3=states(i,3);
    temp4=states(i,4);
    temp5=states(i,5);
    temp=best(i);%number of the optimal next state
    if(temp==0) %zero distance case
      S1(temp1,temp2)=0;
      continue;
    endif
    if(temp3==K1&&temp4==K2) %at starting position everyone has max bullets
      if(temp5==1)
        S1(temp1,temp2)=temp; %only returns best position 
        V(temp1,temp2)=pay(i);
      else
        S2(temp1,temp2)=temp;
        %V(temp1,temp2)=pay(i); %this is equivalent to the above for zero sum
      endif
    endif
  endfor
endfunction