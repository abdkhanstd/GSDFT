% Example: Copmputing DTFT for a 2D image signal
% using the proposed transformation matrix. This example is a modified 
% version of example provided by MATHWORKS.
clear
close all


v = imread('board.tif');
v=rgb2gray(v);
v1=imresize(v,[300,300]);
v=imresize(v,[50,50]);

N = size(v,2);             % Length of signal
Gr=2000; % Dimension of the Generic Matrix
Gc=2000;  % Columns equal to number of rows

% Calculation The Generic Matrix
for x=0:Gr-1
    for y=0:Gc-1
    G(x+1,y+1)=(-6.2832*i*x*y);
    end
end

% Truncating Transformation matrix from Generic matrix
F=exp(G(1:N,1:N)/N);



x0=0;
y0=0;
width=300;
height=300

%Compute and visualize the 30-by-30 DFT of f with these commands.
F1 = fft2(double(v));
F2 = fftshift(F1);
figure
set(gcf,'position',[x0,y0,width,height])

imagesc(abs(F2))

set(gca,'XTick',[], 'YTick', [])



%Compute and visualize by using our method.
F1 = F *double(v)*F;
F2 = fftshift(F1);
figure
set(gcf,'position',[x0,y0,width,height])

imagesc(abs(F2))
set(gca,'XTick',[], 'YTick', [])

% Show original image
figure
set(gcf,'position',[x0,y0,width,height])

set(gca,'XTick',[], 'YTick', [])
imshow(v1)
set(gca,'XTick',[], 'YTick', [])


