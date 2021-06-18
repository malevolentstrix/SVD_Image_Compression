close all
clear all
clc
%reading and converting the image
inImage=imread('bridge.png');
inImage=rgb2gray(inImage);
inImageD=double(inImage);
imwrite(uint8(inImageD), 'original.png');
% decomposing the image using singular value decomposition
[U,S,V]=svd(inImageD);
% Using different number of singular values (diagonal of S) to compress and
% reconstruct the image
dispEr = [];
numSVals = [];
N = 1
 % store the singular values in a temporary var
 C = S;
 % discard the diagonal values not required for compression
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 % Construct an Image using the selected singular values
 D=U*C*V';
 % display and compute error
 figure;
 buffer = sprintf('Image output using %d singular values', N)
 imshow(uint8(D));
 imwrite(uint8(D), sprintf('%dbw.png', N));
 title(buffer);
 error=sum(sum((inImageD-D).^2));
 % store vals for display
 dispEr = [dispEr; error];
 numSVals = [numSVals; N];

for N=10:10:50
 % store the singular values in a temporary var
 C = S;
 % discard the diagonal values not required for compression
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 % Construct an Image using the selected singular values
 D=U*C*V';
 % display and compute error
 figure;
 buffer = sprintf('Image output using %d singular values', N)
 imshow(uint8(D));
 imwrite(uint8(D), sprintf('%dbw.png', N));
 title(buffer);
 error=sum(sum((inImageD-D).^2));
 % store vals for display
 dispEr = [dispEr; error];
 numSVals = [numSVals; N];
end
for N=50:50:300
 % store the singular values in a temporary var
 C = S;
 % discard the diagonal values not required for compression
 C(N+1:end,:)=0;
 C(:,N+1:end)=0;
 % Construct an Image using the selected singular values
 D=U*C*V';
 % display and compute error
 figure;
 buffer = sprintf('Image output using %d singular values', N)
 imshow(uint8(D));
 imwrite(uint8(D), sprintf('%dbw.png', N));
 title(buffer);
 error=sum(sum((inImageD-D).^2));
 % store vals for display
 dispEr = [dispEr; error];
 numSVals = [numSVals; N];
end
% dislay the error graph
figure;
title('Error in compression');
plot(numSVals, dispEr);
grid on
xlabel('Number of Singular Values used');
ylabel('Error between compress and original image');