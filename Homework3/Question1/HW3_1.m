clear all
% syms x1 x2

% figure(1)
% fsurf(cost1(x1),[0 5 0 5])
% 
% figure(2)
% fsurf(cost2(x2),[0 5 0 5])
% 
% x=x1+x2;
% 
% figure(3)
% fsurf(price(x),[0 5 0 5])
history1 = [0];
history2 = [0];

x1 = 1;
x2 = 1;

mode1 = 1;
mode2 = 1;

lastProfit1 = 0;
lastProfit2 = 0;

for i = 1:100
    if(mode1 == 1)
        x1=x1+1;
    end
    if(mode2 == 1)
        x2=x2+1;
    end      
    x=product(x1,x2);
    p=price(x);
    profit1 = x*p - x*cost1(x1);
    profit2 = x*p - x*cost2(x2);
    if(profit1 < lastProfit1)
        mode1=2;
        x1=x1-1;
    end
    if(profit2 < lastProfit2)
        mode2=2;
        x2=x2-1;
    end
    history1 = [history1,x1];
    history2 = [history2,x2];
    x1
    x2
end

l = size(history1);
x = 1:1:l(2);

figure(4)
plot(x,history1,x,history2)




