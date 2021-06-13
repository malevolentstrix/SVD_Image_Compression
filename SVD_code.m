clear all;
close all;
clc
A=imread('bridge.png');
X=im2gray(A); % Convert RBG to gray, 256 bit to double.
Y=im2double(X);
nx = size(Y,1); ny = size(Y,2);
[U,S,V] = svd(Y);
figure, subplot(2,3,1)
imagesc(Y), axis off, colormap gray
title('Original')
plotind = 2;
for r=[10 40 100 150 296]; % Truncation value
 Xapprox = U(:,1:r)*S(1:r,1:r)*V(:,1:r)'; % Approx. image
 subplot(2,3,plotind), plotind = plotind + 1;
 imagesc(Xapprox), axis off
 title(['r=',num2str(r,'%d'),', ',num2str(100*r*(nx+ny)/(nx*ny),'%2.2f'),'% storage']);
 %error(r)=immse(Xapprox,Y);
 %psne(r)=psnr(Xapprox,Y);
end
set(gcf,'Position',[100 100 550 400])
%psne=psnr(Y,Xapprox)
%error=immse(Y,Xapprox)

R=1:450;
   for i=1:450
       Xap=U(:,1:i)*S(1:i,1:i)*V(:,1:i)'; 
       error(i)=immse(Xap,Y);
       psne(i)=psnr(Xap,Y);
   end
   figure
   plot(R,psne); hold on
   figure
   plot(R,error); hold on




