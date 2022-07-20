function param_vec = ColumnOut(forces,torques)
%COLUMNOUT Turns output force/torque matrix into a column vector
%   Detailed explanation goes here
F = forces; T = torques;

phT = vecnorm(T(1:2,:,:));  % elevational torque (phi_dot)
thT = T(3,:,:);             % azimuthal torque (theta_dot)

param_mat = [F;thT;phT];

param_vec = reshape(param_mat,[],1);

end