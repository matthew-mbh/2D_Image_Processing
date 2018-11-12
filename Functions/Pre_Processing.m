function [img] = Pre_Processing(filename,number,colour)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    % Code your answer below
%% Import & Convert:
    img = imread(filename);                     % Read in image file.
    if colour < 4
        img = iscale(img,0.25);                 % Reduce size to 25%.
        %
        IRed = img(:,:,1);                      % Segment red shapes.
        IGreen = img(:,:,2);                    % Segment green shapes.
        IBlue = img(:,:,3);                     % Segment blue shapes.
        %
        IRedNormalise = double(IRed)/255;       % Normalise red image.
        IGreenNormalise = double(IGreen)/255;   % Normalise green image.
        IBlueNormalise = double(IBlue)/255;     % Normalise blue image.
        %
        IRGamma = IRedNormalise.^2.5;           % Red gamma correction. 
        IGGamma = IGreenNormalise.^2.5;         % Green gamma correction.
        IBGamma = IBlueNormalise.^2.5;          % Blue gamma correction.
        %
        if colour == 1                                        % Red.
            IRCromaticy = IRGamma./(IRGamma+IGGamma+IBGamma); % Chromaticy.
            thresh_val = IRCromaticy>0.5;                     % threshold.
            for i = 1:150           % For loop for row.
                for k = 1:756    % For loop for column. 
                    thresh_val(i,k) = 0;
                end
            end
        end
        if colour == 2                                        % Green.
            IBCromaticy = IBGamma./(IRGamma+IGGamma+IBGamma); % Chromaticy.
            thresh_val = IBCromaticy>0.5;                     % threshold.
        end
        if colour == 3                                        % Blue
            IGCromaticy = IGGamma./(IRGamma+IGGamma+IBGamma); % Chromaticy.
            thresh_val = IGCromaticy>0.5;                     % threshold.
        end
    else
        img = double(img)/255;  % Normalize image.
        img = rgb2gray(img);    % Convert to greyscale.
    end
%
%% Set Image Parameters:
    if number == 2              % Two will signify needle image.
        Row_max = 950;          % Set max row length. 
        column_max = 950;       % Set max column length.
        thresh_val = 170/255;   % Set threshold value.
    end
%% Smoothing
    if colour < 4
        thresh_val = irank(thresh_val, 13, ones(5,5));
        thresh_val = iopen(thresh_val, ones(10,10));         % Erode then dilate.
        for i = 1:1008           % For loop for row.
            for k = 1:756    % For loop for column.
                if thresh_val(i,k) < 1.0
                    thresh_val(i,k) = 0;
                else
                    thresh_val(i,k) = 1;
                end
            end
        end
        img = thresh_val;       % Set image to threshold image
    else
        img = irank(img, 5, ones(3,3));
    end
% 
%% Threshold - For loop:
% Cycles through each row and column of image matrix. If value is lower 
% than 150, this will be set to a value of zero. If it does not, it will 
% be set to a value of zero.
    if number == 2
        for i = 1:Row_max           % For loop for row.
            for k = 1:column_max    % For loop for column.
                if (img(i,k) <= thresh_val)  % Checks if pixel value equal or greater.
                    img(i,k)= 0;    % Set pixel value to one.
                else
                    img(i,k)= 1;    % Set pixel value to zero.
                end
            end
        end
    end
%
    return                      % Return 'img' variable.
end

