function [statment] = Shape_Homography(blobs_calibration, blob_work,...
    blob_test, colour)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    for i=1:length(blobs_calibration)
       Pb(1,i) = blobs_calibration(i).uc;
       Pb(2,i) = blobs_calibration(i).vc;
    end
    %
    Q = [20 380; 200 380; 380 380; 20 200; 200 200; 200 20;...
        380 200; 20 20; 380 20];
    %
    H = homography(Pb, Q'); 
    %
    shape_test = Shape_Comparitor(blob_test.area,...
        blob_test.circularity,1);
    %
    for i = 1:length(blob_work)
    shape_work(i) = Shape_Comparitor(blob_work(i).area,...
        blob_work(i).circularity,2);
    end
    %
    for i = 1:length(blob_work)
        if shape_work(i) == shape_test
            format long
            p = [blob_work(i).uc blob_work(i).vc];
            q = homtrans(H,p');
            statment = sprintf(['%s"',' shape ID ','%d',' is is located at: ','%.8f','mm ','%.8f','mm.'],colour, i, q(1)-20, q(2)-20);
        end
    end
end

