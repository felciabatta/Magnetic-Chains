function B = Magnetic_Field(position,dipole)
%MAGNETIC_FIELD Calculates the magnitude and direction of the MF induced by
%               the dipole (at the origin), at a given position
% 
%   position:   (vec/vec matrix)    a coordiante, X within the field
%   dipole:     (vec/vec matrix)    the dipole moment, M of the magnet

X = position;
M = dipole;

mu0 = 4*pi*10^-7;       % permeability of free space
K = mu0/(4*pi);         % magnetic field constant
X_hat = X./vecnorm(X);  % unit position vectors

B = K * (3*dot(M,X_hat).*X_hat - M) ./ (vecnorm(X).^3);
end