function [center,rad] = minCircleHeuristic(pts)
% FUNCTION NAME:
%   minCircleHeuristic
%
% DESCRIPTION:
%   Calculate the center and radius of a circle that envolves all points
%   from a given collection using one heuristic as a premise.
%   This algorithm has a linear order O(n), where n is the number of points
%   in the given collection
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
    maxPtX = maxPt(pts,1);
    minPtX = minPt(pts,1);
    maxPtY = maxPt(pts,2);
    minPtY = minPt(pts,2);
    distX = distance(maxPtX,minPtX);
    distY = distance(maxPtY,minPtY);
    if (distX > distY)
        [center, rad] = circleFrom2Pts(maxPtX,minPtX);
    else
        [center, rad] = circleFrom2Pts(maxPtY,minPtY);
    end
    
    for i=1:size(pts,1)
        currPt = pts(i,:);
        dist = distance(currPt,center);
        if (dist > rad)
            vecD = currPt - center;
            vecD = vecD / norm(vecD);
            center = center + (dist - rad)/2 .* vecD;
            rad = rad + (dist - rad)/2;
        end
    end
end
end