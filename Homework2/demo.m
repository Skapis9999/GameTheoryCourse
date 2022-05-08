array = 1; % array selects 1 of the 5 arays of ex.2

switch array
    case 1
        A1=[-10 2; 1 -1];
        A2=[5 -2; -1 1];
    case 2
        A1=[-2 3; 1 -1];
        A2=[2 -3; -1 1];
    case 3
        A1=[1 3 1; -2 0 2; 1 5 0];
        A2=[2 3 1; -2 2 -1; 4 1 7];
    case 4
        A1=[2 0 -1; 0 1 1];
        A2=[1 0 1; 0 2 3];
    case 5
        A1=[-3 2 0 1; 2 2 -3 1; 2 -5 -1 1; -4 2 1 -3];
        A2=[-4 -1 6 1; 0 2 0 -2; -3 1 -1 -3; 3 -5 2 1];        
end


mode = 3; % mode selects method of solution:
    % 1 pure NE
    % 2 graphical solution
    % 3 non linear
    % 4 fictitious play

switch mode
    case 1
        % pure NE
        P = NashPure(A1,A2);
        P
    case 2
        % graphical solution
        if (and(size(A1)(1) == 2, size(A1)(2) == 2))
            [p11,p12,p21,p22] = NashPlot(A1,A2);
            P = [p11,p12,p21,p22];
            P
        else
            disp ("Not a 2x2 matrix")
        endif
    case 3
        % non linear
        [p11,p12,p21,p22,test] = Nash(A1,A2);
        P = [p11,p12,p21,p22,test];
        P    
    case 4
        % fictitious play
        [p1,V1,p2,V2] = FictPlayB(A1,A2,1,1,4);
        P = [p1, p2];
        V = [V1, V2];    
    end
