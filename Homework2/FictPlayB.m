function [p1,V1,p2,V2]=FictPlayB(A1,A2,P0,m0,Iter)  
    % Init
    [M1,M2]=size(A1);
    p1 = zeros(M1, 1)';
    p2 = zeros(M2, 1)';

    next = -1;
    if (P0 == 2)
        next = 1;
    elseif(P0 == 1)
        next = 2;
    endif
    previousMove = m0;
    
    for i = 1:Iter
        if (next==1)
            p1 = zeros(M1, 1)';
            [M,I] = max(A1(previousMove,:));
            V1 = A1(previousMove,I);
            next = 2;    %end of turn
            previousMove = I;
            p1(I) = 1;
        elseif (next==2)
            p2 = zeros(M2, 1)';
            [M,I] = min(A2(:,previousMove));
            V2 = A2(I,previousMove);
            next = 1;    %end of turn
            previousMove = I;
            p2(I) = 1;
        else
            disp ("Error")    
        endif
    endfor
endfunction
