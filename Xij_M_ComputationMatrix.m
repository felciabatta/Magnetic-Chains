function [Xij,M] = Xij_M_ComputationMatrix(positions,dipoles)
%XIJ_M_COMPUTAIONMATRIX Finds the Xij matrix and corresponding M matrix, for use
%                       with vectorised computation
X = positions; M = dipoles;

% Find all possible Xi-Xj
% PERMUTE swaps dimensions of an N-D matrix
Xij = permute(X,[2 4 1 3])-permute(X,[4 2 1 3]); % Xi-Xj (Nx1x3xP) - (1xNx3xP)
% For Xj, swapping dim 1 and 3 is needed to separate the x,y,z components
% Since dim 1 now contains the alternate 'configurations', we move these to
% to dim 4, as dim 1 needs to be singleton, to use X'-X operation
% Note, instead of X', we use permute to swap dim 1 and 2
Xij = permute(Xij,[3 2 1 4]);   % 3xNxNxP matrix
% Dimensions of Xij:
%   1st - represents x, y, z components
%   2nd - columns in this dim are vectors, corresponding to some Xj
%   3rd - columns in this dim are vectors, corresponding to some Xi
%   4th - corresponds to alternative configurations of the dipoles,
%         e.g. for plotting U for a linspace of orientations

% So for a single set of positions:
%   the top layer matrix is thus the x coordiantes;
%   the middle layer matrix are the y coordiantes;
%   and the bottom layer contain the z coordiantes;

% M must be same size as Xij in order to compute together
% by default, the orientation of M corresponds to the Mjs
% simple swap 2nd and 3rd dim to give i.e. permute(M,[1 3 2 4])
M   = permute(M,[1 2 4 3]);     % swap 3rd & 4th DIM, to make 3xNx1xP
M   = ones(1,1,size(M,2)).*M;   % copy entries of M to make 3xNxNxP matrix
end