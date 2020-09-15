function col = isColinear(A,B,C)
% FUNCTION NAME:
%   isColinear
%
% DESCRIPTION:
%   Verify if three given points are collinear.
%   Based on determinant of them.
%   
% INPUT:
%   A - (vector) point with 2 coordinates
%   B - (vector) point with 2 coordinates
%   C - (vector) point with 2 coordinates
%
% OUTPUT:
%   col - (boolean) true, if the three points are collinear, false
%   otherwise
%
% ASSUMPTIONS AND LIMITATIONS:
%   The determinant result is considered 0 whether it results less than
%   10^-5
%
% AUTHOR
%   Vinicius Almada
%

col = abs(det([A,1; B,1; C,1])) < 10e-5;
end