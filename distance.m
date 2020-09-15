function d = distance(A, B)
% FUNCTION NAME:
%   distance
%
% DESCRIPTION:
%   Calculate the Euclidian distance between two points
%   
% INPUT:
%   A - (vector) point with 2 coordinates
%   B - (vector) point with 2 coordinates
%
% OUTPUT:
%   d - (double) Calculated euclidian distance
%
% AUTHOR
%   Vinicius Almada
%
d = norm(A - B);
end