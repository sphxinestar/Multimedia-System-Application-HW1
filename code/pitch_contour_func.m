function [] = pitch_contour_func(y,fs)

%cal Pitch
frame_size = 30;
frame_shift = 10;
max_value=max(abs(y));
y=y/max_value;
window_period = frame_size / 1000;
window_length = window_period*fs;
shift_period = frame_shift / 1000;
sample_shift = shift_period*fs;
pitch_freq = 0;

sum1 = 0;autocorrelation = 0;sample_no = 0;
for i = 1:(floor((length(y))/sample_shift)-ceil(window_length/sample_shift)) % for setting the window size in short term
    k = 1;yy = 0;
    for j = (((i-1)*sample_shift)+1):(((i-1)*sample_shift)+window_length) % copy data in short term
        yy(k) = y(j);
        k = k + 1;
    end
    for l = 0:(length(yy) - 1) % calculate the pitch
        sum1 = 0;
        for u = 1:(length(yy) - l)
            s = yy(u)*yy(u + l);
            sum1 = sum1 + s;
        end
        autocor(l + 1) = sum1;
        autocorrelation(l + 1,i) = autocor(l + 1);
    end
    auto = autocor(21:160);
    max1= 0;
    for uu = 1:140
        if(auto(uu)>max1)
            max1 = auto(uu);
            sample_no = uu;
        end
    end
    pitch_freq(i) = 1/((20+sample_no)*(1/fs));
end
[rows,cols] = size(autocorrelation);
pitch_t = 1/fs:shift_period:(cols*shift_period);
subplot(5,1,5);
plot(pitch_t,pitch_freq,'-'); % plot pitch contour
title('Pitch Contour');
xlabel('time(s)');
end