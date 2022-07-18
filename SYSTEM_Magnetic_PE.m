function U = SYSTEM_Magnetic_PE(positions,dipoles)
%MAGNETIC_PE Finds total MPE of a magnet configuration
% 
%   positions:  (vector 3xN matrix) a set of N coordinates representing the 
%               positions of N dipoles
%   dipoles:    (vector 3xN matrix) a set of N vectors representing the 
%               dipole moments of N dipoles
[Xij,M] = Xij_M_ComputationMatrix(positions,dipoles) % prepare Xij and M matrices

Uij = @(Xij, Mi, Mj) -dot(Mi, Magnetic_Field(Xij, Mj) ); % find U for ij pair
Us  = Uij(Xij, permute(M,[1 3 2 4]), M); % evaluate Uij for all dipoles
U   = 0.5*sum(Us,[2 3],'omitnan'); % sum of all Uij

end