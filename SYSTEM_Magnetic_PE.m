function U = SYSTEM_Magnetic_PE(positions,dipoles)
%MAGNETIC_PE Finds total MPE of a magnet configuration
% 
%   positions:  (vector 3xN matrix) a set of N coordinates representing the 
%               positions of N dipoles
%   dipoles:    (vector 3xN matrix) a set of N vectors representing the 
%               dipole moments of N dipoles

Xs = mat2cell(positions, 2,ones(1, size(positions,2)));
Ms = mat2cell(dipoles,   2,ones(1, size(dipoles,  2)));

X_pairs = nchoosek(Xs,2);
M_pairs = nchoosek(Ms,2);
shape   = [2, size(X_pairs, 1)];
c2m = @(c)  cell2mat(c);


Xij = @(Xi, Xj)         reshape(c2m(Xi)-c2m(Xj), shape);
Uij = @(Xi, Xj, Mi, Mj) -dot(                           reshape(c2m(Mi),shape) ,...
                             Magnetic_Field(Xij(Xi,Xj), reshape(c2m(Mj),shape) )...
                            );

Us = Uij(X_pairs(:,1), X_pairs(:,2), M_pairs(:,1), M_pairs(:,2));
U = sum(Us);

end