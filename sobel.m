clc;
clear all;
close all;
a=imread('SpecifyGammaWhenAdjustingContrastExample_01.jpg');
a=rgb2gray(a);
imshow(a);
a=double(a);
mask=[0,1,2;-1,0,1;-2,-1,0];
[x y]=size(a);
b=zeros(x,y);
for i=2:1:x-1
 for j=2:1:y-1
 for k=1:1:3
 for l=1:1:3
 b(i,j)=b(i,j)+mask(k,l)*a(i+k-2,j+l-2);
 end
 end
 end
end
b=uint8(b);
figure;
imshow(b);