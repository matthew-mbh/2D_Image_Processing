function [blob_work_out] = Locate_Shape(blob_test,blob_work,colour)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if colour == 1
    centroid = 'r.';
    box = 'r';
end
if colour == 2
    centroid = 'g.';
    box = 'g';
end
%
for i = 1:length(blob_test)
    shape_test(i) = Shape_Comparitor(blob_test(i).area,blob_test(i).circularity,1);
end
%
for i = 1:length(blob_work)
    shape_work(i) = Shape_Comparitor(blob_work(i).area,blob_work(i).circularity,2);
end
%
blob_work_out = blob_work;
%
for i = 1:length(blob_work_out)
    for k = 1:length(blob_test)
        if shape_work(i) == shape_test(k)
           blob_work_out(i).plot(centroid); 
           blob_work_out(i).plot_box(box);
        end
    end
end
end

