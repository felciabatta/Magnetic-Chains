function U = SYSTEM_Magnetic_PE(positions,dipoles)
%MAGNETIC_PE Finds total MPE of a magnet configuration
% 
%   positions:  (vector 3xN matrix) a set of N coordinates representing the 
%               positions of N dipoles
%   dipoles:    (vector 3xN matrix) a set of N vectors representing the 
%               dipole moments of N dipoles

Index_Pairs = nchoosek(1:size(positions,2),2);
Index_Pairs = reshape(Index_Pairs',1,numel(Index_Pairs));
X_Pairs     = positions(:,Index_Pairs,:);
M_Pairs     = dipoles(  :,Index_Pairs,:);

Xij = @(Xi, Xj)         Xi-Xj;
Uij = @(Xi, Xj, Mi, Mj) -dot(Mi, Magnetic_Field(Xij(Xi,Xj), Mj) );

Us = Uij(X_Pairs(:,1:2:end,:), X_Pairs(:,2:2:end,:),... 
         M_Pairs(:,1:2:end,:), M_Pairs(:,2:2:end,:));
U = sum(Us);

end