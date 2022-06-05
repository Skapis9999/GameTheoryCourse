clear all

D=10;
K1=1;
K2=1;

%%%%%%%%%%%%%%%%   HITTING PROBS    %%%%%%%%%%%%%%
PH1=PrHit(D,K1);
PH2=PrHit(D,K2);

%%%%%%%%%%%%%%%% TREE GAME SOLUTION %%%%%%%%%%%%%%
[Tr,O,U0]=DuelTree(D,PH1,PH2);
U=BackInd(1,U0,Tr,O);
S=FindSucc(Tr,U,D);
P=FindPath(1,D,S);
