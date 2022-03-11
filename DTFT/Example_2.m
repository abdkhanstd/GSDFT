% Example: Copmputing DTFT for a five frequency sinosidal signal
% using the proposed transformation matrix. This example is a modified 
% version of example provided by MATHWORKS.
close all

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
N = 150;             % Length of signal
t = (0:N-1)*T;        % Time vector

% Form a signal containing a 50 Hz sinusoid of amplitude 
% 0.7 and a 120 Hz sinusoid of amplitude 1.

v = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t) +  sin(2*pi*150*t) +  sin(2*pi*10*t) +  sin(2*pi*180*t);
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
% Calculating DFT
DFT=v*F;


x0=0;
y0=0;
width=300;
height=180


% Plot the obtained Fourier transforms

% Plot the original signal
set(gcf,'position',[x0,y0,width,height])
set(gca, 'FontName', 'Times new roman');
set(gca,'FontSize',8)
plot(v,'LineWidth',1.5)
xlabel('Time')
ylabel('Amplitude')

figure;

Y = fft(v);
P2 = abs(Y/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(N/2))/N;
set(gcf,'position',[x0,y0,width,height])
set(gca, 'FontName', 'Times new roman');
set(gca,'FontSize',8)
plot(f,P1,'LineWidth',1.5)
xlabel('Frequency (Hz)')
ylabel('|Amplitude|')


figure;
Y=v*F;
P2 = abs(Y/N);
P1 = P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(N/2))/N;
set(gcf,'position',[x0,y0,width,height])
set(gca, 'FontName', 'Times new roman');
set(gca,'FontSize',8)
plot(f,P1,'LineWidth',1.5)
xlabel('Frequency (Hz)')
ylabel('|Amplitude|')

