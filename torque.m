function T = torque(positions,dipoles)
% TORQUE calculates the total torque on dipole(s) Mi due to all other Mj
% 
% IN ----------------------------------------------------------------------------
%   positions:  is a 3xN matrix (cartesian)
%     dipoles:  is a 3xN matrix (cartesian)
% OUT ---------------------------------------------------------------------------
%           T:  is a 3xN matrix, with columns Ti (xi,yi,zi) for each dipole Mi

[Xij,M] = Xij_M_ComputationMatrix(positions,dipoles); % prepare Xij and M matrices

Tij = @(Xij, Mi, Mj) cross(Mi, Magnetic_Field(Xij, Mj) ); % find T for ij pair
Ts  = Tij(Xij, permute(M,[1 3 2 4]), M); % evaluate Tij for all dipoles
T   = permute(sum(Ts,2,'omitnan'),[1 3 2 4]); % sum of Uij for each i
% permute swaps 2nd and 3rd dimensions ('sheets' becomes columns)

end