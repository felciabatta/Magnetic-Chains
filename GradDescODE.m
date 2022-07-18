% Gradient descent via ODE method
% Fix magnet positions in X, 3xn matrix of cartesian vectors
% Magnet moments change within the xy plane, 
% moments parameterised as column vector of angles
% arbitrary timestep called tau

% currently setup for test 2

% start = [pi; (3/2)*pi];     % test 1
% start = pi*rand(3,1);       % random start
start = [pi; pi; (3/2)*pi]; % test 2

dof     = size(start,1);
X       = zeros(3,dof); % fix magnet positions: 3xN matrix

% X(1,2)  = 10^-2; % (0,0,0) and (1,0,0) test 1
X(1,:)=[-1 0 1]*10^-2; %test 2

tauspan = [0 100]; % default value
%tauspan = [0 250]; % testing
r0      = start';
torque_alpha = @(tau,r) torque(X, hat(r)); % makes torque a fnc of angle
[tau,r] = ode23s(torque_alpha,tauspan,r0);

%% plot 2 magnets
plot(tau,r(:,1),tau,r(:,2))
ax = gca;
ax.XLabel.Interpreter = 'latex';
ax.YLabel.Interpreter = 'latex';
xlabel('step, $\tau$')
ylabel('$\phi$')
legend('\phi_1','\phi_2')
title('Gradient Descent via ODE method')
subtitle('x1=(0,0,0), x2=(1,0,0), r0=(pi, (3/2)pi)')


%% plot 3 magnets
plot(tau,r(:,1),tau,r(:,2), tau,r(:,3))
ax = gca;
ax.XLabel.Interpreter = 'latex';
ax.YLabel.Interpreter = 'latex';
xlabel('step, $\tau$')
ylabel('$\phi$')
legend('\phi_1','\phi_2','\phi_3')
title('Gradient Descent via ODE method')
subtitle('x1=(-1 0 0), x2=(0,0,0), x3=(1,0,0), r0=(pi, pi, (3/2)pi)')

%% ANIMATE
M2 = hat(permute(r',[1 3 2]));
X2 = X.*ones(1, 1 ,size(M2,3));
MagAnimate(X2,M2)
