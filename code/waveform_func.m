function [] = waveform_func(y,fs)

time=(1:length(y))/fs;
subplot(5,1,1);
plot(time, y,'b'); %1
title('Waveform');
xlabel('time(s)');

end