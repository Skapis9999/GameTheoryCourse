function [p11,p12,p21,p22] = NashPlot (A1,A2)
  syms p1 p2
  
  %M1=((A1(1,1)-A1(1,2)-A1(2,1)+A1(2,2))*p2)+(A1(1,2)-A1(2,2))
  %M2=((A2(1,1)-A2(1,2)-A2(2,1)+A2(2,2))*p1)+(A2(2,1)-A2(2,2))
  
  %find the strategies
  x1=solve((((A1(1,1)-A1(1,2)-A1(2,1)+A1(2,2))*p2)+(A1(1,2)-A1(2,2)))== 0,p2);
  x2=solve((((A2(1,1)-A2(1,2)-A2(2,1)+A2(2,2))*p1)+(A2(2,1)-A2(2,2)))== 0,p1);
  
  %need to convert syms back to double so we can plot the lines
  x1 = double(x1);
  x2 = double(x2);
  
  p11=x1;
  p12=1-x1;
  p21=x2;
  p22=1-x2;
  %the response functions are actually step functions at M=0
  
  %R1=heaviside(x-x1);
  %R2=heaviside(x-x2);
  
  %graphical representation
  line([x1 x1],[0 1],"color", "r")
  line([x1 1],[1 1],"color", "r")
  line([0 1],[x2 x2],"color", "b")
  line([1 1],[x2 1],"color", "b")

endfunction