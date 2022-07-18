% first go at finding equilibria using ODEd gradient descent
% Includes a plot :)
% please work
% it worked!

% copes with n magnets fixed in position, varying in moment
% is not fast because it currently calls on a very half-arsed torque function
% I intend to vectorise the torque properly eventually

start   = [pi; (3/2)*pi]; % starting moments, column vector length N
dof     = size(start,1);
X       = zeros(3,dof); % fix magnet positions: 3xN matrix
X(1,2)  = 10^-2; % (0,0,0) and (1,0,0) this time

tauspan = [0 100];
r0      = start';
torque_alpha = @(tau,r) torque(X, hat(r)) % makes torque a fnc of angle
[tau,r] = ode45(torque_alpha,tauspan,r0);

plot(tau,r(:,1),tau,r(:,2))
ax = gca;
ax.XLabel.Interpreter = 'latex';
ax.YLabel.Interpreter = 'latex';
xlabel('step, $\tau$')
ylabel('$\phi$')
legend('\phi_1','\phi_2')
title('Gradient Descent via ODE method')
subtitle('x1=(0,0,0), x2=(1,0,0), r0=(pi, (3/2)pi)')