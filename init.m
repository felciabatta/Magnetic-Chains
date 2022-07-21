% INIT

global K_CONTACT RADIUS X_DFLT M_DFLT F_DFLT INERTIA;
K_CONTACT = Inf;

RADIUS = 10^-3/2;
X_DFLT = [0 2*RADIUS;0 0;0 0];
M_DFLT = [1 1;0 0;0 0];
F_DFLT = vecnorm(Force(X_DFLT,M_DFLT));
fnc0 = @(k) F_DFLT(1)-(k*2*RADIUS)^-6;
K_CONTACT = fzero(fnc0,10^2);

INERTIA = 10^7; % 10^7 optimal?
