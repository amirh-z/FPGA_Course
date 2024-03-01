clc
clear
close all
%% Generating Sine Wave 
t = 0:1:63; % Time Samples
f = 500; % Input Signal Frequency
fs = 32000; % Sampling Frequency
x = sin(2*pi*f/fs*t); % Generate Sine Wave

%% Mapping the sine wave to unsigned
xt_128 = fix(127/(max(abs(x))).*x);
xt_128 = xt_128 + 128;

%% Plot the actual wave and samples
stem(t*1/fs*1000,xt_128,'r'); % View the samples
hold on;
plot(t*1/fs*1000,xt_128),xlabel('Time(ms)'),ylabel('Amplitude'); % Plot Sine Wave
legend('Samples','Actual wave');
