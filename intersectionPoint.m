function ip = intersectionPoint(P1,P2,Q1,Q2)
% FUNCTION NAME:
%   intersectionPoint
%
% DESCRIPTION:
%   Calculate the intersection point from two lines formed 
%   by given points
%   
% INPUT:
%   P1 - (vector) first point with 2 coordinates of line 1
%   P2 - (vector) second point with 2 coordinates of line 1
%   Q1 - (vector) first point with 2 coordinates of line 2
%   Q2 - (vector) second point with 2 coordinates of line 2
%
% OUTPUT:
%   ip - (double) Calculated intersection point
%
% ASSUMPTIONS AND LIMITATIONS:
%   The two lines must not be parallels
%
% AUTHOR
%   Vinicius Almada
%

% Calculate the coeficientes of line from line general equation
% ax + by + c = 0 
a1 = P1(2) - P2(2);
b1 = P2(1) - P1(1);
c1 = P1(1) * P2(2) - P1(2) * P2(1);

a2 = Q1(2) - Q2(2);
b2 = Q2(1) - Q1(1);
c2 = Q1(1) * Q2(2) - Q1(2) * Q2(1);

% Calculate the intersection coordinates points
xp = (c2*b1 - c1*b2)/(a1*b2 - a2*b1);
yp = (a2*c1 - a1*c2)/(a1*b2 - a2*b1);

ip = [xp, yp];
end