function v = findVal (q)
  if(((q(1)- q(2))*(q(4) - q(3))) < 0)
    if (q(1)>=q(3)&&q(1)<=q(2))
      v=q(1);
    elseif (q(2)>=q(4)&&q(2)<=q(1))
      v=q(2);
    elseif (q(3)>=q(1)&&q(3)<=q(4))
      v=q(3);
    elseif (q(4)>=q(2)&&q(4)<=q(3))
      v=q(4);
    endif
  else
    a=(q(1)*q(4))-(q(2)*q(3));
    b=(q(1)-q(2))+(q(4)-q(3));
    v=a/b;
   endif
%the first part implements a simple minmax algorithm to find a pure equilibrium
%and the second one checks for non-pure strategies 
endfunction