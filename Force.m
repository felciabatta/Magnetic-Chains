function F = Force(positions,dipoles,varargin)
%FORCE  Calculates the total force acting on each dipole
%       This includes both the magnetic, contact and gravitational forces.
%       Note by convention, that the gravitational force acts in -k direction
%   Detailed explanation goes here

%   OPTIONAL ARGS:
%       Radius  a scalar, default = 0

if nargin-2 == 0
    radius = 0;
else
    radius = varargin{1};
end

[Xij,M] =  Xij_M_ComputationMatrix(positions,dipoles);

mu0 = 4*pi*10^-7;           % permeability of free space
K = 3*mu0/(4*pi);           % magnetic field constant
X_hat = Xij./vecnorm(Xij);  % unit position vectors

Fij = @(Mi, Mj) K * ( dot(Mi,X_hat).*Mj + dot(Mj,X_hat).*Mi + (dot(Mi,Mj) - 5*dot(Mi,X_hat).*dot(Mj,X_hat)).*X_hat ) ./ (vecnorm(Xij).^4);

% k = -10^10; %-10^8
% Fcontact = k.*(vecnorm(Xij)-2*radius).*(vecnorm(Xij)<=2*radius).*X_hat;

global K_CONTACT; % determined automatically using init.m
k = K_CONTACT;
Fcontact = ((k*vecnorm(Xij)).^-6).*X_hat;

Fs = Fij(permute(M,[1 3 2 4]),M)+Fcontact;
F = permute(sum(Fs,2,'omitnan'),[1 3 2 4]);
end
