function out = shuffle(in)
% FUNCTION NAME:
%   shuffle
%
% DESCRIPTION:
%   Applies one permutation on a given points collection with linear order
%   O(n) to make the collection randomly ordered
%   
% INPUT:
%   in - (matrix) collection of points
%
% OUTPUT:
%   out - (matrix) randomly collection of points
%
% AUTHOR
%   Vinicius Almada
%

for k=size(in,1):-1:2
    r = randi([1,k]);
    aux = in(k,:);
    in(k,:) = in(r,:);
    in(r,:) = aux;
end
out = in;
end