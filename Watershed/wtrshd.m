clc;
clear all;
close all;
bw=im2bw(imread('bluraf.jpg'));
figure;
imshow(bw);





figure; imshow(bw);
D = bwdist(bw);
figure; imshow(D,[]);
 D=-D;
figure; imshow(D,[]);
L = watershed(D);
 %L(~bw) = 0;
figure; imshow(im2bw(L,0));
