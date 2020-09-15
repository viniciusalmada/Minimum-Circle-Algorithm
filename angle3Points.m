function ang = angle3Points(A,B,C)
% FUNCTION NAME:
%   angle3Points
%
% DESCRIPTION:
%   Calculate the angle between vectors BA and BC
%
% INPUT:
%   A - (vector) point with 2 coordinates
%   B - (vector) point with 2 coordinates
%   C - (vector) point with 2 coordinates
%
% OUTPUT:
%   ang - (double) Calculated angle between vectors BA and BC in degrees
%
% ASSUMPTIONS AND LIMITATIONS:
%   Return an angle from 0º to 180º
%
% AUTHOR
%   Vinicius Almada
%
BA = A - B;
BC = C - B;
angRad = acos(dot(BA,BC)/(norm(BA)*norm(BC)));
ang = rad2deg(angRad);
end