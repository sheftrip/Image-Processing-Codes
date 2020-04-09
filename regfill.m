clc;
clear all;
close all;
a=imread('images.jpg');
b=im2bw(a,0.5);
figure; imshow(b);
[m, n] = size(b);
w=[1,1,1; 1,1,1; 1,1,1];

reg=zeros(m,n);

reg(200,150)=1;

figure; imshow(reg);

imgcmp=~b;

figure; imshow(imgcmp);

while(true)
    finalimg= imdilate(reg,w) & b;
    if(finalimg==reg)
        break;
    end
    
    reg=finalimg;    
end

figure; imshow(finalimg);
