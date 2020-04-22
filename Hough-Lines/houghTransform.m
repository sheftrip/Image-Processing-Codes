% clc;
clear all;
close all;
I=imread('img_assgn2.png','png');
I = edge(I,'sobel');
[H,theta,rho] = hough(I);
figure;
imshow(imadjust(rescale(H)),[],'InitialMagnification','fit');
xlabel('\theta (Degrees)')
ylabel('\rho')
axis on
axis normal 
hold on
colormap(gca,hot)
p=houghpeaks(H,4,'threshold',ceil(0.5*max(H(:))));
x=theta(p(:,2));
y=rho(p(:,1));

lines=houghlines(I,theta,rho,p);
figure, imshow(I,[]),hold on
max_len=0;

for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'Linewidth',2,'color','cyan');
    
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','magenta');
    
    len=norm(lines(k).point1 - lines(k).point2);
    if(len>max_len)
        max_len=len;
        xy_long=xy;
    end
end
