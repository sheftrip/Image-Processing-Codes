clc;
clear all;
close all;
a=imread('images.jpg');
b=im2bw(a,0.5);
figure; imshow(b);
[m, n] = size(b);
w=[1,1,1; 1,1,1; 1,1,1];

dil=zeros(m,n);
erod=zeros(m,n);

for i=2:1:m-1
    for j=2:1:n-1
        list = zeros(1,9);
        count=1;
        for k=1:1:3
            for l=1:1:3
                list(count)=w(k,l)*b(i+k-2,j+l-2);
                count=count+1;
            end
        end
        dil(i,j)=max(list);
        erod(i,j)= min(list);
    end
end
figure; imshow(dil);
% figure; imshow(erod);
% disp(m); disp(n);
% closing=zeros(m,n);

dil2=zeros(m,n);
for i=2:1:m-1
    for j=2:1:n-1
        flag=0;
        for k=1:1:3
            for l=1:1:3
                if(w(k,l)==0)
                    continue;
                else 
                    if(b(i+k-2,j+l-2)==1)
                        flag=1;
                    end
                end
            end
        end
        if(flag==1)
            dil2(i,j)=1;
        else
            dil2(i,j)=0;
        end
    end
end

figure; imshow(dil2);

                        

% for i=2:1:m-1
%     for j=2:1:n-1
%         list = zeros(1,9);
%         count=1;
%         for k=1:1:3
%             for l=1:1:3
%                 list(count)=w(k,l)*dil(i+k-2,j+l-2);
%                 count=count+1;
%             end
%         end
%         closing(i,j)=min(list);
%     end
% end
% 
% opening=zeros(m,n);
% 
% for i=2:1:m-1
%     for j=2:1:n-1
%         list = zeros(1,9);
%         count=1;
%         for k=1:1:3
%             for l=1:1:3
%                 list(count)=w(k,l)*erod(i+k-2,j+l-2);
%                 count=count+1;
%             end
%         end
%         opening(i,j)=max(list);
%     end
% end
% 
% figure; imshow(opening);
% figure; imshow(closing);
% 
% boundary=b-erod;
% 
% figure; imshow(boundary);
% 
% 
