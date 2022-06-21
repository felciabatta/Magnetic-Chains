function U = GENERAL_Magnetic_PE(configuration,Index_Pairs)
%GENERAL_MAGNETIC_PE Finds MPE for any given subset a magnet configuration
% 
%   configuration:  (vector 3xNx2 matrix) a set of N pos. and N dir. vectors 
%                   representing the positions & dipole moments of N dipoles

X_Pairs     = configuration(:,Index_Pairs,1);
M_Pairs     = configuration(:,Index_Pairs,2);

Xij = @(Xi, Xj)         Xi-Xj;
Uij = @(Xi, Xj, Mi, Mj) -dot(Mi, Magnetic_Field(Xij(Xi,Xj), Mj) );

Us = Uij(X_Pairs(:,1:2:end), X_Pairs(:,2:2:end),... 
         M_Pairs(:,1:2:end), M_Pairs(:,2:2:end));
U = sum(Us);

end