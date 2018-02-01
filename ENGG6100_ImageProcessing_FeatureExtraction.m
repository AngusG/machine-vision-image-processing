%% Feature Extraction

%first with synthetic data
% this function does not take a tuple for shape like in Python
img = zeros(256, 256);

% Make a big square in Python
% im[64:-64, 64:-64] = 1 # 

% Make a big square in MATLAB
img(64:end-64, 64:end-64) = 1;

% make a small rectangle in Python
% im[96:-96, 0:25] = 1
img(96:end-96, 1:26) = 1;

% rotate image and blur image so edges are less crisp
img = imrotate(img, 15);

sz = size(img);

% add some random noise
rand_noise = rand(sz(1), sz(2)) / 2;
img = img + rand_noise;
img = imgaussfilt(img, 8);
%imshow(img)

%% Sobel 

% empty bracket means choose threshold automatically
sx = edge(img, 'Sobel', [], 'horizontal');
sy = edge(img, 'Sobel', [], 'vertical');
sob = edge(img, 'Sobel');
%imshow(sob);

%% Canny
canny = edge(img, 'Canny', [], 3);

subplot(1,5,1);
imshow(img);
title('square')

subplot(1,5,2);
imshow(sx);
title('Sobel (x direction)')

subplot(1,5,3);
imshow(sy);
title('Sobel (y direction)')

subplot(1,5,4);
imshow(sob);
title('Sobel (both)')

subplot(1,5,5);
imshow(canny);
title('Canny')

%% Turn up the noise!

