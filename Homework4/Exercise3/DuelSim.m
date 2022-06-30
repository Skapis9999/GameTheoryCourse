function [X,Y]= DuelSim(A,K1,K2,M1,M2,S1,S2,x0,y0)
  Q1=0.9; %payoff player gets when hitting
  Q2=0;%payoff player gets when getting hit
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

  s=2*(K1+1)*(K2+1)*(n^2); 
  states=zeros(s,5);
  isFinal=zeros(s,1);
  a=1;
  current=0;
  %loop to create all states
  for i=1:n %player 1 position
    for j=1:n %player 2 position
      for k=1:K1+1
        for l=1:K2+1
          for m=1:2
            states(a,:)=[i,j,k-1,l-1,m]; %distance,bullets,who plays
            if(k==K1+1&&l==K2+1&&i==x0&&j==y0&&m==1)
              current=a; %set starting state as the current one
            endif
            if(abs(i-j)==1)
              isFinal(a)=1;
            endif
            a++;
          endfor
        endfor
      endfor
    endfor
  endfor  

  
  round=0;
  while(1)
    round+=1
    temp=current;
    positions=[states(temp,1),states(temp,2)]
    if(states(temp,3)==0&&states(temp,4)==0)
      X=0;
      Y=0;
      break;
    endif
    temp5=states(temp,5); 
    if(temp5==1)
      current=S1(states(temp,1),states(temp,2)); %optimal next state for player one
      if(isFinal(temp))
        X=Q1^round;
        Y=-abs(Q2^round);
        break;
      endif
      if(states(temp,3)!=states(current,3)) %player 1 shoots (since bullet number changed)
        dist=abs(states(current,1)-states(current,2));
        P=p1(dist);
        hit=rand;
        if(hit<=P)
          X=Q1^round; %happens to work with the three given payoffs.
          Y=-abs(Q2^round); %happens to work with the three given payoffs.
          break;
        endif
      endif
    else
      current=S2(states(temp,1),states(temp,2));
      if(isFinal(temp))
        Y=Q1^round;
        X=-abs(Q2^round);
        break;
      endif
      if(states(temp,4)!=states(current,4)) %player 2 shoots (since bullet number changed)
        dist=abs(states(current,1)-states(current,2));
        P=p2(dist);
        hit=rand;
        if(hit<=P)
          Y=Q1^round; %happens to work with the three given payoffs.
          X=-abs(Q2^round); %happens to work with the three given payoffs.
          break;
        endif
      endif
    endif 
  endwhile
endfunction