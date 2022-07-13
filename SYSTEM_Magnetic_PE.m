function U = SYSTEM_Magnetic_PE(positions,dipoles)
%MAGNETIC_PE Finds total MPE of a magnet configuration
% 
%   positions:  (vector 3xN matrix) a set of N coordinates representing the 
%               positions of N dipoles
%   dipoles:    (vector 3xN matrix) a set of N vectors representing the 
%               dipole moments of N dipoles
X = positions; M = dipoles;

% PERMUTE swaps dimensions of an N-D matrix
Xij = permute(X,[4 2 1 3])-permute(X,[2 4 1 3]);
Xij = permute(Xij,[3 2 1 4]); % 3xNxNxP matrix

M   = permute(M,[1 2 4 3]); % swap 3rd & 4th DIM, to make 2xNx1xP
M   = ones(1,1,size(M,2)).*M; % copy entries of M to make 2xNxNxP matrix

Uij = @(Xij, Mi, Mj) -dot(Mi, Magnetic_Field(Xij, Mj) );
Us  = Uij(Xij, permute(M,[1 3 2 4]), M);
U   = 0.5*sum(Us,[2 3],'omitnan');

end