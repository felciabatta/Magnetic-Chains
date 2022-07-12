% TWO DIPOLE Example
points = 1000;

theta = reshape(linspace(0,2*pi,points),1,1,points);

positions = [ones(1,2,points); zeros(2,2,points)];
positions = positions.*(0:1);

dipoles = @(t) [ones(1,1,points) sin(t); zeros(1,1,points) cos(t); zeros(1,2,points)];
M = dipoles(theta);

U = SYSTEM_Magnetic_PE(positions,M);

plot(reshape(theta,1,points),reshape(U,1,points))