clc; 
clear all;
close all;
a=imread('SpecifyGammaWhenAdjustingContrastExample_01.jpg');
a=rgb2gray(a);
imshow(a);
[x y]=size(a);
a=double(a);
for k=7:-1:0
 for i=1:1:x
 for j=1:1:y
 if bitand(2^k,a(i,j))==0
 b(i,j)=0;
 else
 b(i,j)=255;
 end
 end
 end
 b=uint8(b);
 figure;
 imshow(b);
end