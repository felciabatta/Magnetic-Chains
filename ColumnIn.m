function param_vec = ColumnIn(positions,directions)
%COLUMNIN Turns input configuration into a column vector of parameters
%   Detailed explanation goes here
X = positions; D = directions;

[th phi ~] = cart2sph(D(1,:,:),D(2,:,:),D(3,:,:));

param_mat = [X;th;phi];

param_vec = reshape(param_mat,[],1);

end