function pp = perpend(A,B)
% FUNCTION NAME:
%   perpend
%
% DESCRIPTION:
%   Calculate the point that can be used to construct a perpendicular line
%   to the middle of another line formed by two given points
%   
% INPUT:
%   A - (vector) point with 2 coordinates
%   B - (vector) point with 2 coordinates
%
% OUTPUT:
%   pp - (vector) point that can be used to construct a perpendicular line
%
% AUTHOR
%   Vinicius Almada
%

vecBA = A - B;
vecBAperp = [vecBA(2), -vecBA(1)];
midAB = middlePoint(A,B);
pp = midAB + vecBAperp;
end