function [p1,p2,V]=FictPlay(A,P0,m0,Iter)
    M = size(A)
    
    next = -1;
    if (P0 == 2)
        next = 1;
    elseif(P0 == 1)
        next = 2;
    endif
    
    for i = 1:Iter
        if (next==1)
            [M,I] = max(A(mo,:))
            p1 = A(mo,I);
            p2 = -A(mo,I);
            next = 2;    %end of turn
        elseif (next==2)
            [M,I] = max(A(:,mo))
            p1 = A(I,mo);
            p2 = -A(I,mo);
            next = 1;    %end of turn
        else
            disp ("Error")    
        endif
    endfor
endfunction
