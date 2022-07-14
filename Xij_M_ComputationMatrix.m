function [Xij,M] = Xij_M_ComputationMatrix(positions,dipoles)
%XIJ_M_COMPUTAIONMATRIX Finds the Xij matrix and corresponding M matrix, for use
%                       with vectorised computation
X = positions; M = dipoles;

% PERMUTE swaps dimensions of an N-D matrix
Xij = permute(X,[4 2 1 3])-permute(X,[2 4 1 3]);
Xij = permute(Xij,[3 2 1 4]); % 3xNxNxP matrix

M   = permute(M,[1 2 4 3]); % swap 3rd & 4th DIM, to make 2xNx1xP
M   = ones(1,1,size(M,2)).*M; % copy entries of M to make 2xNxNxP matrix
end

