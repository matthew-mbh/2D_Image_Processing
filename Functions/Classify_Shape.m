function [statment] = Classify_Shape(area, circularity,colour,number)
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
          statment = sprintf(['%s"',' shape is a Small Circle,',...
              ' consisting of an area of ','%d',...
              ' pixels.'],colour, area);
      end
       if (area > circle)
           statment = sprintf(['%s"',' shape is a Large Circle,',...
               ' consisting of an area of ','%d',...
               ' pixels.'],colour, area);
       end
    elseif (circularity > circ_S)
       if area < square
           statment = sprintf(['%s"',' shape is a Small Square,',...
               ' consisting of an area of ','%d',...
               ' pixels.'],colour, area );
       end
       if (area > square)
           statment = sprintf(['%s"',' shape is a Large Square,',...
               ' consisting of an area of ','%d',...
               ' pixels.'],colour, area );
       end
    elseif (circularity > 0.550)
       if area < triangle
           statment = sprintf(['%s"',' shape is a Small Triangle,',...
               ' consisting of an area of ','%d',...
               ' pixels.'],colour, area );
       end
       if (area > triangle)
           statment = sprintf(['%s"',' shape is a Large Triangle,',...
               ' consisting of an area of ','%d',...
               ' pixels.'],colour, area);
       end
    else
     statment = sprintf(['%s"',' shape ID is of an unknown type,',...
         ' consisting of an area of ','%d',...
         ' pixels.'],colour, area);
    end
    return
end

