clc;
clear all;
close all;
a=imread('SpecifyGammaWhenAdjustingContrastExample_01.jpg');
a=rgb2gray(a);
figure;
imshow(a);
a=double(a);
[x y]=size(a);
c=input('Enter value of c:');
gam=input('Enter value of gamma:');
max=a(1,1);
for i=1:1:x
 for j=1:1:y
 a(i,j)=c*(a(i,j))^gam;
 if(max<a(i,j))
 max=a(i,j);
 end
 end
end
a=a*255/max;
a=uint8(a);
figure;
imshow(a);