clc; 
clear all;
close all;
a=imread('playboy.jpg');
a=im2bw(a);
[x,y]=size(a);
a=~a;
figure;
imshow(a);
w=[1,1,1;1,1,1;1,1,1];
skel=zeros(x,y);
while(true)
    if(imerode(a,w)==zeros(x,y))
        break;
    end
    a=imerode(a,w);
    skel=skel|(a-imopen(a,w));
    
end
figure;
imshow(a);

figure;
imshow(skel);

    