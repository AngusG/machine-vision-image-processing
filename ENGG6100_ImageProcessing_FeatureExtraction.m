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

sz = size(img);

% add some random noise in Python
% noise = np.random.randn(im.shape[0], im.shape[1]) / 2

% add some random noise in MATLAB (1-based indexing)
rand_noise = rand(sz(1), sz(2));
img = img + rand_noise;

%% Sobel 

%% Canny