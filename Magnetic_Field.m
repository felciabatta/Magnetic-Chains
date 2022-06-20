function B = Magnetic_Field(position,dipole)
%MAGNETIC_FIELD Calculates the magnitude and direction of the MF induced by
%               the dipole, at a given position
% 
%   position:   (vec/vec matrix)    a coordiante, X within the field
%   dipole:     (vec/vec matrix)    the dipole moment, M of the magnet

X = position;
M = dipole;

mu0 = 1;
K = mu0/(4*pi);
X_hat = X./vecnorm(X);

B = K * (3*dot(M,X_hat).*X_hat - M) ./ (vecnorm(X).^3);
end