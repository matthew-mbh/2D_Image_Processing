function [shape] = Shape_Comparitor(area,circularity,number)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if number == 1
        circle = 40000;
        square = 25000;
        triangle = 25000;
        circ_C = 0.900;
        circ_S = 0.740;
    end
    if number == 2
        circle = 4400;
        square = 3500;
        triangle = 3000;
        circ_C = 0.930;
        circ_S = 0.850;
    end
    
    if (circularity > circ_C)
      if (area < circle)
          shape = 1;
      end
       if (area > circle)
           shape = 2;
       end
    elseif (circularity > circ_S)
       if area < square
           shape = 3;
       end
       if (area > square)
           shape = 4;
       end
    elseif (circularity > 0.550)
       if area < triangle
           shape = 5;
       end
       if (area > triangle)
           shape = 6;
       end
    else
     shape = sprintf(['%s"',' shape ID is of an unknown type,',...
         ' consisting of an area of ','%d',...
         ' pixels.'],colour, area);
    end
    return
end



