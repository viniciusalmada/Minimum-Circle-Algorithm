function [c,r] = circleFrom3Pts(p1,p2,p3)
% FUNCTION NAME:
%   circleFrom3Pts
%
% DESCRIPTION:
%   Calculate the center and radius of a circle from
%   3 points.
%   
%   The center is calculated by the intersection of the mediatrices of the
%   triangle formed by the given points
%   
%   The radius is calculated as the half distance from 
%   the center to one of the given points.
%   
% INPUT:
%   p1 - (vector) point with 2 coordinates
%   p2 - (vector) point with 2 coordinates
%   p3 - (vector) point with 2 coordinates
%
% OUTPUT:
%   c - (vector) Calculated center of the circle
%   r - (double) Calculated radius of the circle
%
% ASSUMPTIONS AND LIMITATIONS:
%   The three points must be distincts and non-collinear
%
% AUTHOR
%   Vinicius Almada
%
% middle point of the line formed by p1 and p2 points
mid21 = middlePoint(p1,p2);
% point to construct a perpendicular line to line formed by p1 and p2
mid21pp = perpend(p1,p2);

mid32 = middlePoint(p2,p3);
mid32pp = perpend(p2,p3);

mid13 = middlePoint(p3,p1);
mid13pp = perpend(p3,p1);

pi2 = intersectionPoint(mid21,mid21pp,mid32,mid32pp);
pi1 = intersectionPoint(mid21,mid21pp,mid13,mid13pp);
pi3 = intersectionPoint(mid13,mid13pp,mid32,mid32pp);

% center is calculated as average from 3 intersections
c = (pi1 + pi2 + pi3) / 3;
r = distance(c,p1);
end