function [c,r] = circleFrom2Pts(p1,p2)
% FUNCTION NAME:
%   circleFrom2Pts
%
% DESCRIPTION:
%   Calculate the center and radius of a circle from
%   2 points.
%   
%   The center is calculated from the midpoint of the 
%   line formed by the two points.
%   
%   The radius is calculated as the half distance from 
%   the center to one of the given points.
%   
%
% INPUT:
%   p1 - (vector) point with 2 coordinates
%   p2 - (vector) point with 2 coordinates
%
% OUTPUT:
%   c - (vector) Calculated center of the circle
%   r - (double) Calculated radius of the circle
%
% ASSUMPTIONS AND LIMITATIONS:
%   The two points must be distincts
%
% AUTHOR
%   Vinicius Almada
%
c = middlePoint(p1,p2);
r = halfDistance(p1,p2);
end