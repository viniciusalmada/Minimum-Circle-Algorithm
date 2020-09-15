function hd = halfDistance(A, B)
% FUNCTION NAME:
%   halfDistance
%
% DESCRIPTION:
%   Calculate the half Euclidian distance between two points
%   
% INPUT:
%   A - (vector) point with 2 coordinates
%   B - (vector) point with 2 coordinates
%
% OUTPUT:
%   d - (double) Calculated half euclidian distance
%
% AUTHOR
%   Vinicius Almada
%
hd = norm(A - B) / 2;
end