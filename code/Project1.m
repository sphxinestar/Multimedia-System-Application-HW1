clear('all');
close('all');
[y,fs] = audioread('TEST.wav');
max_value = max(abs(y));
y = y/max_value;
frame_size = 20;
frame_shift = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

waveform_func(y,fs); %1

%利用 audioread 來讀取音樂檔 並將數據存於[y,fs]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ec = energy_contour_func(y,fs,frame_shift); %2
zcr = zero_crossing_rate_contour_func(y,fs,frame_size,frame_shift); %3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end_point_detection_func(y,fs,frame_shift,frame_size); %4

%func內因為還是會用到 ec.zcr 但因為兩者內容太多 似乎不能傳 因此在func內部再呼叫一次2 3 題的func

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pitch_contour_func(y,fs); %5

%http://notedetection.weebly.com/center-clipping.html
%第二步驟的算ec跟第二題一樣 只是要用clipping後的參數