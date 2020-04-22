clc;
clear all;
close all;
a=imread('SpecifyGammaWhenAdjustingContrastExample_01.jpg');
a=rgb2gray(a);
imshow(a);
a=uint256(a);
[x y]=size(a);
c=input('Enter value of c:');
max=a(1,1);
for i=1:1:x
 for j=1:1:y
 a(i,j)=c*(2^(a(i,j)));
 if(max<a(i,j))
 max=a(i,j);
 end
 end
end
a=a*255/max;
a=uint8(a);
figure;
imshow(a);