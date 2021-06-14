close all
clear all
clc
filename = 'dog.jpg';
 [X, map] = imread(filename);
 figure('Name','ORIGINAL component of the imported image');
 imshow(X);
 imwrite(X, '!original.jpg');
 R = X(:,:,1);
 G = X(:,:,2);
 B = X(:,:,3);
 Rimg = cat(3, R, zeros(size(R)), zeros(size(R)));
 Gimg = cat(3, zeros(size(G)), G, zeros(size(G)));
 Bimg = cat(3, zeros(size(B)), zeros(size(B)), B);
 %figure('Name','RED component of the imported image');
 %imshow(Rimg);
 %imwrite(Rimg, '!red.jpg');
 %figure('Name','GREEN component of the imported image');
 %imshow(Gimg);
 %imwrite(Gimg, '!green.jpg');
 %figure('Name','BLUE component of the imported image');
 %imshow(Bimg);
 %imwrite(Bimg, '!blue.jpg');
Red =double(R);
Green = double(G);
Blue = double(B);
N = 1;
% Compute values for the red image
[U,S,V]=svd(Red);
C = S;
C(N+1:end,:)=0;
C(:,N+1:end)=0;
Dr=U*C*V';
% Rebuild the data back into a displayable image and show it
%figure;
%buffer = sprintf('Red image output using %d singular values', N);
Rimg = cat(3, Dr, zeros(size(Dr)), zeros(size(Dr)));
%imshow(uint8(Rimg));
%imwrite(uint8(Rimg), sprintf('%dred.jpg', N));
%title(buffer);
% Compute values for the green image
[U2, S2, V2]=svd(Green);
C = S2;
C(N+1:end,:)=0;
C(:,N+1:end)=0;
Dg=U2*C*V2';
% Rebuild the data back into a displayable image and show it
%figure;
%buffer = sprintf('Green image output using %d singular values', N);
Gimg = cat(3, zeros(size(Dg)), Dg, zeros(size(Dg)));
%imshow(uint8(Gimg));
%imwrite(uint8(Gimg), sprintf('%dgreen.jpg', N));
%title(buffer);
% Compute values for the blue image
[U3, S3, V3]=svd(Blue);
C = S3;
C(N+1:end,:)=0;
C(:,N+1:end)=0;
Db=U3*C*V3';
% Rebuild the data back into a displayable image and show it
%figure;
%buffer = sprintf('Blue image output using %d singular values', N);
Bimg = cat(3, zeros(size(Db)), zeros(size(Db)), Db);
%imshow(uint8(Bimg));
%imwrite(uint8(Bimg), sprintf('%dblue.jpg', N));
%title(buffer);
% Thake the data from the Red, Green, and Blue image
% Rebuild a colored image with the corresponding data and show it
figure;
buffer = sprintf('Colored image output using %d singular values', N);
Cimg = cat(3, Dr, Dg, Db);
imshow(uint8(Cimg));
imwrite(uint8(Cimg), sprintf('%dcolor.jpg', N));
title(buffer);

for N=2:2:20
 % Recompute modes for the red image - already solved by SVD above
 C = S;
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 Dr=U*C*V';
 % Rebuild the data back into a displayable image and show it
 %figure;
 %buffer = sprintf('Red image output using %d singular values', N);
 Rimg = cat(3, Dr, zeros(size(Dr)), zeros(size(Dr)));
 %imshow(uint8(Rimg));
 %imwrite(uint8(Rimg), sprintf('%dred.jpg', N));
 %title(buffer);
 % Recompute modes for the green image - already solved by SVD above
 C = S2;
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 Dg=U2*C*V2';
 % Rebuild the data back into a displayable image and show it
 %figure;
 %buffer = sprintf('Green image output using %d singular values', N);
 Gimg = cat(3, zeros(size(Dg)), Dg, zeros(size(Dg)));
 %imshow(uint8(Gimg));
 %imwrite(uint8(Gimg), sprintf('%dgreen.jpg', N));
 %title(buffer);
 % Recompute modes for the blue image - already solved by SVD above
 C = S3;
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 Db=U3*C*V3';
 % Rebuild the data back into a displayable image and show it
 %figure;
 %buffer = sprintf('Blue image output using %d singular values', N);
 Bimg = cat(3, zeros(size(Db)), zeros(size(Db)), Db);
 %imshow(uint8(Bimg));
 %imwrite(uint8(Bimg), sprintf('%dblue.jpg', N));
 %title(buffer);
 % Thake the data from the Red, Green, and Blue image
 % Rebuild a colored image with the corresponding data and show it
 figure;
 buffer = sprintf('Colored image output using %d singular values', N);
 Cimg = cat(3, Dr, Dg, Db);
 imshow(uint8(Cimg));
 imwrite(uint8(Cimg), sprintf('%dcolor.jpg', N));
 title(buffer);
end
for N=25:25:100
 % Recompute modes for the red image - already solved by SVD above
 C = S;
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 Dr=U*C*V';
 % Rebuild the data back into a displayable image and show it
 %figure;
 %buffer = sprintf('Red image output using %d singular values', N);
 Rimg = cat(3, Dr, zeros(size(Dr)), zeros(size(Dr)));
 %imshow(uint8(Rimg));
 %imwrite(uint8(Rimg), sprintf('%dred.jpg', N));
 %title(buffer);
 % Recompute modes for the green image - already solved by SVD above
 C = S2;
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 Dg=U2*C*V2';
 % Rebuild the data back into a displayable image and show it
 %figure;
 %buffer = sprintf('Green image output using %d singular values', N);
 Gimg = cat(3, zeros(size(Dg)), Dg, zeros(size(Dg)));
 %imshow(uint8(Gimg));
 %imwrite(uint8(Gimg), sprintf('%dgreen.jpg', N));
 %title(buffer);
 % Recompute modes for the blue image - already solved by SVD above
 C = S3;
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 Db=U3*C*V3';
 % Rebuild the data back into a displayable image and show it
 %figure;
 %buffer = sprintf('Blue image output using %d singular values', N);
 Bimg = cat(3, zeros(size(Db)), zeros(size(Db)), Db);
 %imshow(uint8(Bimg));
 %imwrite(uint8(Bimg), sprintf('%dblue.jpg', N));
 %title(buffer);
 % Thake the data from the Red, Green, and Blue image
 % Rebuild a colored image with the corresponding data and show it
 figure;
 buffer = sprintf('Colored image output using %d singular values', N);
 Cimg = cat(3, Dr, Dg, Db);
 imshow(uint8(Cimg));
 imwrite(uint8(Cimg), sprintf('%dcolor.jpg', N));
 title(buffer);
end
