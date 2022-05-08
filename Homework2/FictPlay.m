function [p1,p2,V]=FictPlay(A,P0,m0,Iter)
    
    next = -1;
    if (P0 == 2)
        next = 1;
    elseif(P0 == 1)
        next = 2;
    endif
    previousMove = m0;
    
    for i = 1:Iter
        if (next==1)
            [M,I] = max(A(previousMove,:));
            p1 = A(previousMove,I);
            p2 = -A(previousMove,I);
            next = 2;    %end of turn
            previousMove = I;
        elseif (next==2)
            [M,I] = min(A(:,previousMove));
            p1 = A(I,previousMove);
            p2 = -A(I,previousMove);
            next = 1;    %end of turn
            previousMove = I;
        else
            disp ("Error")    
        endif
    endfor
endfunction
