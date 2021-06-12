clear all, close all, clc
A=imread('bridge.ppm');
X=im2gray(A); % Convert RBG to gray, 256 bit to double.
Y=im2double(X);
nx = size(Y,1); ny = size(Y,2);
[U,S,V] = svd(Y);
figure, subplot(2,3,1)
imagesc(Y), axis off, colormap gray
title('Original')
plotind = 2;
for r=[10 40 300 400 1637]; % Truncation value
 Xapprox = U(:,1:10)*S(1:10,1:10)*V(:,1:10)'; % Approx. image
 subplot(2,3,plotind), plotind = plotind + 1;
 imagesc(Xapprox), axis off
 title(['r=',num2str(r,'%d'),', ',num2str(100*r*(nx+ny)/(nx*ny),'%2.2f'),'% storage']);
end
set(gcf,'Position',[100 100 550 400])
%psne=psnr(Y,Xapprox)
%error=immse(Y,Xapprox)


