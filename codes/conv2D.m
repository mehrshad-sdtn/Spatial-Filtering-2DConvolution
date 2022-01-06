function feature_map = conv2D(img, filters, stride, padding)
    h=size(img,1);  %img height
    w=size(img,2);  %img width
    c=size(img, 3); %no. of channels
    
    
    f = size(filters, 1); % filter height (assuming w = h)
    filters_count = size(filters, 3);
    
    feature_map = zeros(h-f+1, w-f+1, filters_count);
    rgb_output = zeros(h-f+1, w-f+1, 3);
    output = zeros(h-f+1, w-f+1, 1);
    
    if strcmp(padding, 'same')
        p = (f - 1)/2; %padding size
        fprintf('padding size: %d\n', p);
        padded = zeros(h+2*p , w+2*p, c); %padded array
        for i = 1:c
          padded(:,:,i) = padarray(img(:,:,i), [p, p], 0, 'both');    
        end 
    %reallocate result arrays to be the same size as image    
    rgb_output = zeros(h, w, 3);
    output = zeros(h,w,1);
    feature_map = zeros(h, w, filters_count);
    img = padded;
    end
  
    % 4 for loops might look scary but channels are never more than 3 and filters_count is always in the (0, 5) range 
    % so the time complexity is in fact not more than O(n^2)
    for k = 1:filters_count %for each filter in filters do 
        
        kernel = filters(:,:,k);
        for channel = 1:c  %for each of the RGB channels
          for row = 1:stride:h-f+1
            for col = 1:stride:w-f+1  
              local = img(row:row+f-1, col:col+f-1, channel);
              conv = double(local) .* kernel;
              rgb_output(row, col, channel) = sum(conv, 'all');
            end
          end
        end 
        
        output = sum(rgb_output, 3); %summon all channels output to get a greyscale output
        feature_map(:,:,k) = output;
        %disp(size(feature_map));
        
    end
    
    
   
end

