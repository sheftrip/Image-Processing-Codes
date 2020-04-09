clear;
close;
a=imread('SpecifyGammaWhenAdjustingContrastExample_01.jpg');
a=rgb2gray(a);
a=double(a);
T=input('Type the initial threshold value\n');
To=1; % tolerence
[m,n] =size(a);
Tnew=sum(sum(a))/(m*n);
Told=T;
count3=0;
while abs(Told-Tnew)>To
    count3=count3+1;
    count1=1;
    count2=1;
    sum1=0;
    sum2=0;
    for i=1:m
        for j=1:n
            if a(i,j)>T
            count1=count1+1;
            sum1=sum1+a(i,j);
            else
            count2=count2+1;
            sum2=sum2+a(i,j);
            end
        end
    end
    avg1=sum1/count1;
    avg2=sum2/count2;
    Tnew=0.5*(avg1+avg2);
    Told=Tnew;
    T=Tnew;
end
for i=1:m
    for j=1:n
        if a(i,j)>T
        a(i,j)=255;
        else
        a(i,j)=0;
        end
    end
end
imshow(uint8(a));