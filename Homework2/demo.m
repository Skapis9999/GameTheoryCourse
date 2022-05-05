array = 1; % array selects 1 of the 5 arays of ex.2

switch array
    case 1
        A1=[-10 2; 1 -1];
        A2=[5 -2; -1 1];
    case 2
        A1=[4 1; 3 2];
        A2=[4 3; 1 2];
    case 3
        A1=[-10 2; 1 -1];
        A2=[5 -2; -1 1];
    case 4
        A1=[-10 2; 1 -1];
        A2=[5 -2; -1 1];
    case 5
        A1=[-10 2; 1 -1];
        A2=[5 -2; -1 1];
        
end


mode = 1; % mode selects method of solution:
    % 1 pure NE
    % 2 graphical solution
    % 3 non linear
    % 4 fictitious play
    % 5 Gambit

switch mode
    case 1
        % pure NE
        [p11,p12,p21,p22] = NashPure(A1,A2);
        P = [p11,p12,p21,p22];
        P
    case 2
        % graphical solution
        [p11,p12,p21,p22] = NashPlot(A1,A2);
        P = [p11,p12,p21,p22];
        P
    case 3
        % non linear
        [p11,p12,p21,p22] = Nash(A1,A2);
        P = [p11,p12,p21,p22];
        P    
    case 4
        % fictitious play
        [p11,p12,p21,p22] = FictPlayB(A1,A2,P0,m0,Iter);
        P = [p11,p12,p21,p22];
        P
    case 5
        % Gambit
        [p11,p12,p21,p22] = zeros(2,2);
        P = [p11,p12,p21,p22];
        P    