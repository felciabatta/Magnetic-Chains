% 2 Dipoles

theta = linspace(0,2*pi,1000);
position = [0 2; 0 0; 0 0];
dipole = @(t) [1 sin(t); 0 cos(t); 0 0];

for i = 1:length(theta)
    U(i) = SYSTEM_Magnetic_PE(position,dipole(theta(i)));
end

plot(theta,U)