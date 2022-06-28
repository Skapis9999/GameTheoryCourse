function v = findVal (q)
    a=(q(1)*q(4))-(q(2)*q(3));
    b=(q(1)-q(2))+(q(4)-q(3));
    v=a/b;
%the first part implements a simple minmax algorithm to find a pure equilibrium
%and the second one checks for non-pure strategies 
end