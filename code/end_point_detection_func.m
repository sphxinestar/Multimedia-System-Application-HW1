function [] = end_point_detection_func(y,fs,frame_shift,frame_size)

ec = energy_contour_func(y,fs,frame_shift);
zcr = zero_crossing_rate_contour_func(y,fs,frame_size,frame_shift);
avg_energy = sum(abs(ec)) / length(ec);
ITU = avg_energy;

for i = 1:length(ec) - 1 
    if(ec(i) < ITU)
        if(ec(i + 1) > ITU)
            begin_p = i;
            break
        end
    end
end
 
for j = length(ec):-1:2 
    if(ec(j) < ITU)
        if(ec(j - 1) > ITU)
            end_p = j;
            break
        end
    end
end

t = 1/fs:1/fs:(length(y)/fs); 
subplot(5,1,4);
plot(t,y);
hold on;
plot([(begin_p * (length(y)/fs)/length(ec)),(begin_p * (length(y)/fs)/length(ec))],[-1,1]);
hold on;
plot([(end_p * (length(y)/fs)/length(ec)),(end_p * (length(y)/fs)/length(ec))],[-1,1]);
hold off;
title('End point detection');
xlabel('time(s)');
end