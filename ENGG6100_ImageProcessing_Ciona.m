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
