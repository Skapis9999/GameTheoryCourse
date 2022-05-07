[p1,p2,V]=FictPlay(A,P0,m0,Iter)
    M = size(A)
    if (P0==1)
        [M,I] = max(A(mo,:))
        p1 = A(mo,I);
        p2 = -A(mo,I);
    else
        [M,I] = max(A(:,mo))
        p1 = A(I,mo);
        p2 = -A(I,mo);
    endif
    

endfunction
