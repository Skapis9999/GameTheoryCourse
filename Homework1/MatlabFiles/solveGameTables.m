A1=[2 4 6; -2 -2 1; 1 3 4];
A2=[1 1 0; 0 1 1; 1 0 2];
A3=[1 -2 3 -4; 0 1 -2 3; 0 0 1 -2; 0 0 0 1];
A4=[0 1 0; 1 0 0; 0 0 1];
A5=[4 3 2 1; 0 0 0 4; 0 0 5 2; 0 3 6 3];
A6=[1 -1 0; 0 1 -1; 0 0 1];
A7=[1 -1 0 0; 0 0 0 1; 0 0 1 -1; 0 1 -1 0];
A8=[1 -1 2 -1; 0 0 0 -1; 0 0 -1 2; -1 2 -1 0];

[p1,p2,V]=MinMax(A1);
fprintf('Game 1(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)

[p1,p2,V]=MinMax(A2);
fprintf('Game 2(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)

[p1,p2,V]=MinMax(A3);
fprintf('Game 3(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)

[p1,p2,V]=MinMax(A4);
fprintf('Game 4(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)

[p1,p2,V]=MinMax(A5);
fprintf('Game 5(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)

[p1,p2,V]=MinMax(A6);
fprintf('Game 6(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)

[p1,p2,V]=MinMax(A7);
fprintf('Game 7(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)

[p1,p2,V]=MinMax(A8);
fprintf('Game 8(value=%d) \n',V)
fprintf('optimal strategy for player 1: [%.2f %.2f %.2f]\noptimal strategy for player 2: [%.2f %.2f %.2f]\n\n',p1,p2)