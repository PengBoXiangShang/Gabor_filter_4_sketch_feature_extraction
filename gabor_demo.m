%4个方向的Gabor滤波器对lena进行滤波
clear;
I = imread('./butterfly_72.png');
% I = imread('./ji.jpeg');

I = rgb2gray(I);
% f0 = 0.2; 
f0 = 0.4; 
count = 0;
for theta = [0,pi/4,pi/2,pi*3/4];%用弧度0,pi/4,pi/2,pi*3/4
    count = count + 1;
    x = 0;
    for i = linspace(-8,8,11)
        x = x + 1;
        y = 0;
        for j = linspace(-8,8,11)
            y = y + 1;
            z(y,x)=compute(i,j,f0,theta);
        end
    end
    figure(count);
    filtered = filter2(z,I,'valid');
    f = abs(filtered);
    imshow(f/max(f(:)))
end