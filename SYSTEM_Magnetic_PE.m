function U = SYSTEM_Magnetic_PE(positions,dipoles)
%MAGNETIC_PE Finds total MPE of a magnet configuration
% 
%   positions:  (vector 3xN matrix) a set of N coordinates representing the 
%               positions of N dipoles
%   dipoles:    (vector 3xN matrix) a set of N vectors representing the 
%               dipole moments of N dipoles

% Indexes for all possible pairs, I = [ [1 2] [1 3] [2 3] etc... ]
Index_Pairs = nchoosek(1:size(positions,2),2);
Index_Pairs = reshape(Index_Pairs',1,numel(Index_Pairs))
    % MAY BE QUICKER TO JUST CALCULATE EVERYTHING AND 1/2 IT
    % use x'-x to find difference in x positions and y'-y to find y differences
    % much more efficient vectorised 

% All possible pairs, as determined by Index_Pairs
X_Pairs     = positions(:,Index_Pairs,:);
M_Pairs     =   dipoles(:,Index_Pairs,:);

Xij = @(Xi, Xj)         Xi-Xj;
    % Xi/j = 3x(NC2)xQ matrix, where each column is a pos vector
    
Uij = @(Xi, Xj, Mi, Mj) -dot(Mi, Magnetic_Field(Xij(Xi,Xj), Mj) );
    % The inputs of this function are a lists containing every i/j position
    % and dipole pair we wish to compute, in respective order
    % ...This means the inputs have to be carefully prepared in the correct order,
    % without repeats.
    % ...Instead we could prepare the inputs using vectorised arithmetic, 
    % which is much more efficient, but has duplicate calculations
    % so we just /2 at end
    % ... Also note that to do things vectorised, it is much easier to separate
    % x and y components.

Us = Uij(X_Pairs(:,1:2:end,:), X_Pairs(:,2:2:end,:),... 
         M_Pairs(:,1:2:end,:), M_Pairs(:,2:2:end,:));
     
U = sum(Us,2);

end