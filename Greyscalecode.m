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
N = 1;
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

for N=10:10:100
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
for N=100:50:300
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
title("Error in Compression");
xlabel('Number of Singular Values used');
ylabel('Error between compress and original image');
R=1:450;
for i=1:450
    Xap=U(:,1:i)*S(1:i,1:i)*V(:,1:i)';
    psne(i)=psnr(Xap,inImageD);
end
figure;
title('PSNR Value in compression');
plot(R,psne);
grid on
title('PSNR Value in compression');
xlabel('Number of Singular Values used');
ylabel('PSNR');
