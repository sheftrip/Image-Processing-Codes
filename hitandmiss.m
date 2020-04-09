image=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 1 1 1 1 0 0 0 0 0 0 0 0 0;% structure A
       0 0 1 1 1 1 0 0 0 0 0 1 0 0 0;
       0 0 1 1 1 1 0 0 0 0 1 1 1 0 0;% structure C
       0 0 1 1 1 1 0 0 0 1 1 1 1 1 0;
       0 0 1 1 1 1 0 0 1 1 1 1 1 1 1;
       0 0 1 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0; %D-structure to find in an 15*15 image
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0;
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0;
       0 0 0 1 1 1 0 0 0 0 0 0 0 0 0; %another D-structure in image
       0 0 0 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];
[r, c]=size(image);

figure;
imshow(imresize(image,10));

D=[ 0 0 0 1 0 0 0;
    0 0 1 1 1 0 0; 
    0 1 1 1 1 1 0;
    1 1 1 1 1 1 1];

[rd, cd]=size(D);
WminusD=ones(rd+2,cd+2);
for i=2:1:rd+1
    for j=2:1:cd+1
%         if (D(i-1,j-1)==1)
%             WminusD(i,j)=0;
%         else 
%             WminusD(i,j)=1;
%         end
        WminusD(i,j)= ~D(i-1,j-1);
    end
end

figure; imshow(imresize(D,10));
figure; imshow(imresize(WminusD,10));

AeroD = imerode(image,D);
figure; imshow(imresize(AeroD,10));

imagecomp=bitcmp(image,1);
ero2=imerode(imagecomp,WminusD);

finalimage= zeros(r,c);

for i=1:1:r
    for j=1:1:c
        finalimage= AeroD&ero2;
    end
end

figure; imshow(imresize(finalimage,10));

% bw = [0 0 0 0 0 0
%       0 0 1 1 0 0
%       0 1 1 1 1 0
%       0 1 1 1 1 0
%       0 0 1 1 0 0
%       0 0 1 0 0 0];
%   
% se1=[0  -1  -1
%      1  1  -1
%      0  1  0];
% [m,n]=size(bw);
% hitmiss=zeros(m,n);
% for i=2:1:m-1
%     for j=2:1:n-1
%         flag=0;
%         for k=1:1:3
%             for l=1:1:3
%                 if(se1(k,l)==0)
%                     continue;
%                 elseif(se1(k,l)==-1) 
%                     if(bw(i+k-2,j+l-2)==1)
%                         flag=1;
%                     end
%                 elseif(se1(k,l)==1)
%                     if(bw(i+k-2,j+l-2)==0)
%                         flag=1;
%                     end
%                 end
%             end
%         end
%         if(flag==1)
%             hitmiss(i,j)=0;
%         else
%             hitmiss(i,j)=1;
%         end
%     end
% end
%  
%  
%  
%  disp(hitmiss);
% 
% 
% 
%     
% 
