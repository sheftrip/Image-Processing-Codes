clc;
clear all;
close all;
I=imread('img_assgn2.png','png');
I = edge(I,'sobel');
figure;
imshow(I);
[H,theta,rho] = hough(I);
figure;
imshow(imadjust(rescale(H)),[],'InitialMagnification','fit');
xlabel('\theta (Degrees)')
ylabel('\rho')
axis on
axis normal 
hold on
