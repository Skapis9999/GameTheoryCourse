clear all
clc

figure(1)
[X,Y] = meshgrid(-0.5:0.05:0.5,-0.5:0.05:0.5);
clf
a = X;
b = f(X,Y);
c = b(:,1:size(X));
d = b(:,size(X)+1:end);
quiver(X,Y,c,d,'Color','r','LineWidth',2)


figure(2)
clf
a2 = X;
b2 = f2(X,Y);
c2 = b2(:,1:size(X));
d2 = b2(:,size(X)+1:end);
quiver(X,Y,c2,d2,'Color','r','LineWidth',2)