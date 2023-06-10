% Set sampling frequency and time vector
fs = 1000;
t = 0:0.001:1;

% Generate signal with two sinusoidal components and noise
x = [1 2]*sin(2*pi*[50 250]'.*t) + randn(size(t))/10;

% Apply low-pass filter to the signal
fc = 150; % cutoff frequency
y = lowpass(x, fc, fs);

% Plot original and filtered signals
figure;
subplot(2,1,1);
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');
legend('Signal');

subplot(2,1,2);
plot(t, y, 'g');
xlabel('Time (s)');
ylabel('Amplitude');
title(sprintf('Low-pass Filtered Signal (cutoff frequency = %d Hz)',fc));
legend('Signal');

% Adjust figure settings
set(gcf, 'Position', [100 100 800 600]);
set(gca, 'FontName', 'Arial', 'FontSize', 12);