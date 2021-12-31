# Spatial-Filtering-2DConvolution
In this project I implemented 2D convolution function using MATLAB and applied it on some images using different kernels. <br/>
This project is the final project of my Signals & Systems course at Shahid Beheshti University (Fall 2021) instructed by Dr. Armin Salimi-Badr

### Result
below is the output of applying filters on the original image which is also displayed using subplot.

stride: 2
![sharpening and sobels](https://github.com/mehrshad-sdtn/Spatial-Filtering-2DConvolution/blob/master/output-images/Andrew.png)

stride: 1
![gaussian 5x5](https://github.com/mehrshad-sdtn/Spatial-Filtering-2DConvolution/blob/master/output-images/Bengio.png)

stride: 3
![averaging filter](https://github.com/mehrshad-sdtn/Spatial-Filtering-2DConvolution/blob/master/output-images/Goodfellow.png)

streide: 2
![horizontal & vertical edge](https://github.com/mehrshad-sdtn/Spatial-Filtering-2DConvolution/blob/master/output-images/Leskovec.png)
 
 
 <br/>
 smaller stride means smaller step in sliding operation, hence, output pixels will be closer and we will have better quality in the output
