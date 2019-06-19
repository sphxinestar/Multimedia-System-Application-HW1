function [ec] = energy_contour_func(y,fs,frame_shift)

frame_shift = frame_shift/1000 * fs;
energy = 0;
t1 = (1:frame_shift:length(y) - frame_shift) / fs;
temp = 0;

for i = 1:length(t1)
    for j = ((i-1) * frame_shift+1):(i+1) * frame_shift
        if j <= length(y)
            temp = temp + y(j).^2;
        end
    end
    energy(i) = temp;
    temp = 0;
end

subplot(5,1,2);
plot(t1,energy,'b');
title('Energy Contour');
xlabel('time(s)');
ec = energy;
end
