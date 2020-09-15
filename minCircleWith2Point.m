function [c,r] = minCircleWith2Point(sub,q1,q2)
% FUNCTION NAME:
%   minCircleWith2Point
%
% DESCRIPTION:
%   Calculates the circuncircle from a given points collection and two
%   another points that must be in circle.
%   
% INPUT:
%   sub - (matrix) points collection with n elements [n,2]
%   q1 - (vector) point with 2 coordinates
%   q2 - (vector) point with 2 coordinates
%
% OUTPUT:
%   c - (vector) Calculated center of the circle
%   r - (double) Calculated radius of the circle
%
% AUTHOR
%   Vinicius Almada
%
[c,r] = circleFrom2Pts(q1,q2);
for k=1:size(sub,1)
    p_k = sub(k,:);
    if (distance(p_k,c) > r)
        [c,r] = circleFrom3Pts(q1,q2,p_k);
    end
end
end