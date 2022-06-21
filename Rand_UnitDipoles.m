function dipoles = Rand_UnitDipoles(N)
%RAND_UNITDIPOLES Gives N randomly generated unit dipole moments
%   Detailed explanation goes here

V = @(theta) [sin(theta); cos(theta)];
rand_thetas = 2*pi*rand(1,N);
dipoles = V(rand_thetas);
end