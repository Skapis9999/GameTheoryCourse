clear all
clc

% figure(1)
% [X,Y] = meshgrid(-0.5:0.05:0.5,-0.5:0.05:0.5);
% clf
% a = X;
% b = f(X,Y);
% c = b(:,1:size(X));
% d = b(:,size(X)+1:end);
% quiver(X,Y,c,d,'Color','r','LineWidth',2)


% figure(2)
% clf
% a2 = X;
% b2 = f2(X,Y);
% c2 = b2(:,1:size(X));
% d2 = b2(:,size(X)+1:end);
% quiver(X,Y,c2,d2,'Color','r','LineWidth',2)

%% Chapter 6

a11 = 1;
a10 = 1;
a01 = -1;
a00 = -1;

b00 = 1;
b01 = 2;
b10 = -3;
b11 = -4;

%% figure
figure(1)
[X,Y] = meshgrid(0:0.05:1,0:0.05:1);
clf
a = X;
b = f(X,Y,a11,a10,a01,a00,b11,b10,b01,b00);
c = b(:,1:size(X));
d = b(:,size(X)+1:end);
quiver(X,Y,c,d,'Color','r','LineWidth',2) 
