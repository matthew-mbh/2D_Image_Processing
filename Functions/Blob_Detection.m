function [blobs] = Blob_Detection(PP_img,number)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% Set Image Parameters:
    if number == 0              % Zero will signify test image.
        Pixel_min = 200;        % Set min number of pixels. 
        Pixel_max = 100000;      % Set max number of pixels.
    end
    if number == 1              % One will signify calibration image.
        Pixel_min = 200;        % Set min number of pixels. 
        Pixel_max = 10000;      % Set max number of pixels.
    end
    if number == 2              % Two will signify work image.
        Pixel_min = 200;        % Set min number of pixels. 
        Pixel_max = 10000;      % Set max number of pixels.
    end
    if number == 3              % Two will signify work image.
        Pixel_min = 200;        % Set min number of pixels. 
        Pixel_max = 10000;      % Set max number of pixels.
    end
    if number == 4              % Three will signify needle image.
        Pixel_min = 800;        % Set min number of pixels. 
        Pixel_max = 1260;       % Set max number of pixels.
    end
% 
%% Find & Store Blobs: 
blobs = iblobs(PP_img,'area',[Pixel_min, Pixel_max],'boundary','touch',0);      % Determine and store number of blobs.
%
%%
for i=1:length(blobs(:))
    if number == 1
        blobs(i).plot('b.');
        blobs(i).plot_box('y');
    end
    if number == 2
        blobs(i).plot('r.');
        if (blobs(i).circularity >= 0.700) && ...
                (blobs(i).circularity <= 0.850)
            blobs(i).plot_box('r');
        end
    end
    if number == 3
        blobs(i).plot('r.');
        blobs(i).plot_box('g--');
    end
    if number == 4
        blobs(i).plot('r.');
    end
end
%
    return                      % Return 'img' variable.
end

