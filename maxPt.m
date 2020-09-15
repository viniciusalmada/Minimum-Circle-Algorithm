function pt = maxPt(pts,coord)
% FUNCTION NAME:
%   maxPt
%
% DESCRIPTION:
%   Returns the point with maximum absolute given coordinate (x or y) from
%   a one points collection.
%   
% INPUT:
%   pts -  (matrix) points collection with n elements [n,2]
%   coord - (int) 1 to x coordinate and 2 to y coordinate
%
% OUTPUT:
%   pt - (vector) point with maximum absolute coordinate x or y
%
%
% AUTHOR
%   Vinicius Almada
%
pt = pts(1,:);
for i=2:size(pts,1)
    if (pts(i,coord) > pt(coord))
        pt = pts(i,:);
    end
end
end