clc;
%clear all;
close all;
a=imread('assign1.jpg');
% figure(1);
% imhist(a);
figure(2);
imshow(a);
 a=double(a);
[x,y]=size(a);
b=a;

for i=1:x
    for j=1:y
        a(i,j)=2*a(i,j)^4;
        
    end
end

a=uint8(a);

figure(3);
imshow(a);
