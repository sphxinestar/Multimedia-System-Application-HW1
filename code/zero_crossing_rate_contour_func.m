function [z] = zero_crossing_rate_contour_func(y,fs,frame_size,frame_shift)

frame_shift = frame_shift/1000 * fs;
zcr = 0;
temp = 0;
t1 = (1:frame_shift:length(y) - frame_shift) / fs; 

for i = 1:length(t1)
    for j = ((i-1) * frame_shift+2):(i+1) * frame_shift
        if j <= length(y)
            if(y(j-1) * y(j) < 0)
                temp = temp + 1;
            end
        end
    end
    zcr(i) = temp / (2 * frame_size);
    temp = 0;
end

subplot(5,1,3);
plot(t1,zcr,'b');
title('Zero-Crossing Rate Contour');
xlabel('time(s)');
z = zcr;

end
