function [Tr,O,U0]=DuelTree(D,PH1,PH2)
#D=10;
k=2;

O=zeros(2*D,1);
Tr=zeros(2*D,1);
U0=zeros(2*D,1);
O(1)=1;

for j=2:2*D
   odd=mod (j, 2);
   Tr(j)=j-1-odd ;
   if(!odd)
     O(j)=0;              #even vertices respresent the leaves
     if(O(j-1)==1)        #the one who played at the last odd vertice shoots
       U0(j)=PH1(D-j/2+1);
     else
       U0(j)=PH2(D-j/2+1);
     endif
   else                    #odd vertices represent the non-final states
     O(j)=k;
     k=O(j-2);
   endif
endfor