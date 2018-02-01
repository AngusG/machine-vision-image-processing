file_1 = 'IMG_5121_nseg1000_cmp30_sig3_ds2_17_x372_y932.jpg';
mask_1 = 'IMG_5121_nseg1000_cmp30_sig3_ds2_17_x372_y932_voc_mask.jpg';
mask_2 = 'IMG_5121_nseg1000_cmp30_sig3_ds2_17_x372_y932_mask.jpg';

close('all');

% note matlab thinks the file doesn't exists if you 
% prepend images/ with './'
PATH = 'images/'; 

image = imread(strcat(PATH, file_1));
mask = imread(strcat(PATH, mask_1));
int_mask = imread(strcat(PATH, mask_2));

% Visualize data
imshow(image);
figure();
imshow(mask);

% Smoothing
smooth_image = imgaussfilt(image, 3);
imshow(smooth_image);

% Sharpening
filter_smoothed_f = imgaussfilt(smooth_image, 1);
filter_original_f = imgaussfilt(image, 1);
alpha = 30;

sharpened_smooth = smooth_image + alpha * (smooth_image - filter_smoothed_f);
sharpened_original = image + alpha * (image - filter_original_f);

subplot(1,2,1);
imshow(sharpened_smooth);
title('Sharpened blurred')

subplot(1,2,2);
imshow(sharpened_original);
title('Sharpened original')

% median filter in 3x3 neighborhood spatially, per each channel
median = medfilt3(image, [3 3 1]);
figure();
imshow(median);

subplot(1,2,1);
imshow(image);
title('Original')

subplot(1,2,2);
imshow(median);
title('Median filtered')

%% Segmentation

% all at once
imhist(image, 100);

% or channel wise
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);

[ct_r, x] = imhist(r, 100);
[ct_g, x] = imhist(g, 100);
[ct_b, x] = imhist(b, 100);

plot(x, ct_r, 'Red', x, ct_g, 'Green', x, ct_b, 'Blue');

% unlike in Python, don't need to call .copy()
image_cp = image;
image_cp(image_cp < 50) = 0;

figure();
imhist(image_cp);

%% Histogram Equalization
hist_eq = histeq(image);
figure();
imshowpair(image, hist_eq, 'montage')
title('Histogram equalization')

% to also see histograms
%imhist(image);
%figure();
%imhist(J);

%% Adaptive Histogram Equalization
% may need to do this one channel at a time
hist_adapt = adapthisteq(image(:,:,1));
figure();
imshowpair(image, hist_adapt, 'montage')
title('Adaptive histogram equalization')

%% Morphology
integer_mask = int_mask;
integer_mask(integer_mask == 255) = 0; % get rid of void class for demo
integer_mask(integer_mask == 1) = 255; % set 'blue mussel' class to full-scale for demo

structure = ones(2, 2);
erosion_mask = imerode(integer_mask, structure);

% compare with median filter
median_mask = medfilt2(integer_mask, [3 3]);

figure();
subplot(1,3,1);
imshow(integer_mask);
title('original')

subplot(1,3,2);
imshow(erosion_mask);
title('original')

subplot(1,3,3);
imshow(median_mask);
title('original')
