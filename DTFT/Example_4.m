% Example: Copmputing DTFT for a 2D image signal
% using the proposed transformation matrix. This example is a modified 
% version of example provided by MATHWORKS.

close all

N = 30;             % Length of signal
v = zeros(N,N);
v(5:24,13:17) = 1;
Gr=2000; % Dimension of the Generic Matrix
Gc=2000;  % Columns equal to number of rows

% Calculation The Generic Matrix
for x=0:Gr-1
    for y=0:Gc-1
    G(x+1,y+1)=(-6.2832*i*x*y);
    end
end

x0=0;
y0=0;
width=300;
height=300


% Truncating Transformation matrix from Generic matrix
F=exp(G(1:N,1:N)/N);

%Compute and visualize the 30-by-30 DFT of f with these commands.
F1 = fft2(v);
F2 = log(abs(F1));
imshow(F2,[-1 5],'InitialMagnification','fit');
set(gcf,'position',[x0,y0,width,height])
colormap(jet); colorbar


%Compute and visualize by using our method.
F1 = F *v*F;
F2 = log(abs(F1));
figure
imshow(F2,[-1 5],'InitialMagnification','fit');
set(gcf,'position',[x0,y0,width,height])
colormap(jet); colorbar

figure
% Show original image
set(gcf,'position',[x0,y0,width,height])
imshow(v,'InitialMagnification','fit')


