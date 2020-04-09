clc;
clear all;
close all;
a=imread('SpecifyGammaWhenAdjustingContrastExample_01.jpg');
a=rgb2gray(a);
imshow(a);
figure;
a=double(a);
[m, n]=size(a);
hist=zeros(1,256);
for i=1:1:m
 for j=1:1:n
 curpix=a(i,j);
 hist(curpix+1)=hist(curpix+1)+1;
 end
end
hist=hist/(m*n);
s=zeros(1,256);
for i=1:1:256
 for j=1:1:i
 s(i)=s(i)+hist(j);
 end
end
% s(1)=hist(1);
% for i=2:1:256
% s(i)=s(i-1)+hist(i);
% end
s=s*255;
b=zeros(m,n);
for i=1:1:m
 for j=1:1:n
 b(i,j)=s(a(i,j)+1);
 end
end
b=uint8(b);
imshow(b);