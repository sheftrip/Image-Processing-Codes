clc;
clear all;
close all;
a=imread('SpecifyGammaWhenAdjustingContrastExample_01.jpg');
a=rgb2gray(a);
imshow(a);
%a=double(a);
[x y]=size(a);
for i=1:1:x
 for j=1:1:y
 a(i,j)=255-a(i,j);
 end
end
%a=uint8(a);
figure;
imshow(a);