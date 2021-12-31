clc; clear;
%%%%%%%%%%% READ THE INPUT IMAGE %%%%%%%%%%%
img_bengio = imread('images/bengio.jpeg');
img_leskovec = imread('images/leskovec.jpeg');
img_andrew = imread('images/andrew.jpeg');
img_goodfellow = imread('images/goodfellow.jpeg');

%%%%%%%%%%% DEFINE FILTERS %%%%%%%%%%%
horizontal_edge = [[-1,-1,-1];
                   [0,0,0];
                   [1,1,1]];
               
vertical_edge = [[-1,0,1];
                 [-1,0,1];
                 [-1,0,1]];
             
sharpening = [[0,-1,0];
              [-1,5,-1];
              [0,-1,0]];
          
sobel_horizontal = [[-1,-2,-1];
                    [0,0,0];
                    [1,2,1]];
sobel_vertical = [[-1,0,1];
                  [-2,0,2];
                  [-1,0,1]];
              
gaussian_5x5 = (1/273)*[[1,4,7,4,1];
                        [4,16,26,16,4];
                        [7,26,41,26,7];
                        [4,16,26,16,4];
                        [1,4,7,4,1]];
                    
averaging_7x7 = (1/49)*ones(7,7);
              
          
% concatening filters ot build the `filters` tensor
filters_bengio = cat(3, gaussian_5x5);
filters_leskovec = cat(3, horizontal_edge, vertical_edge);
filters_andrew = cat(3, sharpening, sobel_vertical,sobel_horizontal);
filters_goodfellow = cat(3, averaging_7x7);
%%%%%%%%%%% PARAMETERS SETTING %%%%%%%%%%%
stride_bengio = 1;
stride_leskovec = 2;
stride_andrew = 2;
stride_goodfellow = 3;

%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%
%% function calls %%
bengio = uint8(conv2D(img_bengio, filters_bengio, stride_bengio, 'valid'));
leskovec = uint8(conv2D(img_leskovec, filters_leskovec, stride_leskovec, 'same'));
andrew = uint8(conv2D(img_andrew, filters_andrew, stride_andrew, 'same'));
goodfellow = uint8(conv2D(img_goodfellow, filters_goodfellow, stride_goodfellow, 'valid'));

%% input output sizes %%
disp('Yoshua Bengio');
disp('input size:');
disp(size(img_bengio));
disp('output size:');
disp(size(bengio));

disp('Leskovec');
disp('input size:');
disp(size(img_leskovec));
disp('output size:');
disp(size(leskovec));

disp('Andrew Ng');
disp('input size:');
disp(size(img_andrew));
disp('output size:');
disp(size(andrew));

disp('Goodfellow');
disp('input size:');
disp(size(img_goodfellow));
disp('output size:');
disp(size(goodfellow));


%% plots %%
figure(1);
subplot(1, 2, 1);
imshow(img_bengio);
title('original image');
subplot(1, 2, 2);
imshow(bengio(:,:,1));
title('Gaussian 5x5');

figure(2);
subplot(1, 3, 1);
imshow(img_leskovec);
title('original image');
subplot(1, 3, 2);
imshow(leskovec(:,:,1));
title('horizontal edge');
subplot(1, 3, 3);
imshow(leskovec(:,:,2));
title('vertical edge');

figure(3);
subplot(1, 4, 1);
imshow(img_andrew);
title('original image');
subplot(1, 4, 2);
imshow(andrew(:,:,1));
title('sharpening');
subplot(1, 4, 3);
imshow(andrew(:,:,2));
title('vertical sobel');
subplot(1, 4, 4);
imshow(andrew(:,:,3));
title('horizontal sobel');

figure(4);
subplot(1, 2, 1);
imshow(img_goodfellow);
title('original image');
subplot(1, 2, 2);
imshow(goodfellow(:,:,1));
title('averging');



