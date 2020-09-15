function [center,rad] = minCircleIncremental(pts)
% FUNCTION NAME:
%   minCircleIncremental
%
% DESCRIPTION:
%   Calculate the center and radius of the minimum circle (smallest
%   possible radius) that envolves all points from a given collection.
%   
%   This algorithm has a linear order O(n), when is assumed a random
%   ordered points, otherwise, this order can grow to O(n³)
%   
% INPUT:
%   pts - (matrix) points collection with n elements [n,2]
%
% OUTPUT:
%   c - (vector) Calculated center of the circle
%   r - (double) Calculated radius of the circle
%
% AUTHOR
%   Vinicius Almada
%

if (size(pts,1) == 1)
    center = pts;
    rad = 0;
    
elseif (size(pts,1) == 2)
    [center,rad] = circleFrom2Pts(pts(1,:),pts(2,:));
    
elseif (size(pts,1) == 3)
    if (isColinear(pts(1,:),pts(2,:),pts(3,:)))
        dist12 = distance(pts(1,:),pts(2,:));
        dist23 = distance(pts(2,:),pts(3,:));
        dist13 = distance(pts(1,:),pts(3,:));
        if (max([dist12,dist23,dist13]) == dist12)
            [center,rad] = circleFrom2Pts(pts(1,:),pts(2,:));
            
        elseif (max([dist12,dist23,dist13]) == dist23)
            [center,rad] = circleFrom2Pts(pts(2,:),pts(3,:));
            
        else
            [center,rad] = circleFrom2Pts(pts(1,:),pts(3,:));
            
        end
    else
        angle123 = angle3Points(pts(1,:),pts(2,:),pts(3,:));
        angle312 = angle3Points(pts(3,:),pts(1,:),pts(2,:));
        angle231 = angle3Points(pts(2,:),pts(3,:),pts(1,:));
        if (angle123 >= 90)
            [center,rad] = circleFrom2Pts(pts(1,:),pts(3,:));
            
        elseif (angle312 >= 90)
            [center,rad] = circleFrom2Pts(pts(2,:),pts(3,:));
            
        elseif (angle231 >= 90)
            [center,rad] = circleFrom2Pts(pts(1,:),pts(2,:));
            
        else
            [center,rad] = circleFrom3Pts(pts(1,:),pts(2,:),pts(3,:));
            
        end
    end
elseif (size(pts,1) >= 4)
    pts = shuffle(pts);
    [center,rad] = circleFrom2Pts(pts(1,:),pts(2,:));
    for i=3:size(pts,1)
        p_i = pts(i,:);
        if (distance(p_i,center) > rad)
            sub = pts(1:i-1,:);
            [center, rad] = minCircleWithPoint(sub,p_i);
        end        
    end
end
end