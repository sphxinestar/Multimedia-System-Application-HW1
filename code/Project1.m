clear('all');
close('all');
[y,fs] = audioread('TEST.wav');
max_value = max(abs(y));
y = y/max_value;
frame_size = 20;
frame_shift = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

waveform_func(y,fs); %1

%�Q�� audioread ��Ū�������� �ñN�ƾڦs��[y,fs]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ec = energy_contour_func(y,fs,frame_shift); %2
zcr = zero_crossing_rate_contour_func(y,fs,frame_size,frame_shift); %3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end_point_detection_func(y,fs,frame_shift,frame_size); %4

%func���]���٬O�|�Ψ� ec.zcr ���]����̤��e�Ӧh ���G����� �]���bfunc�����A�I�s�@��2 3 �D��func

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pitch_contour_func(y,fs); %5

%http://notedetection.weebly.com/center-clipping.html
%�ĤG�B�J����ec��ĤG�D�@�� �u�O�n��clipping�᪺�Ѽ�