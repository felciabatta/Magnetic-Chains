% MAGNETIC FIELD PLOT

lim = 10;
range = -lim:1:lim;
len = length(range);

x = 2.5*range.*(ones(len));
y = 2.5*range'.*(ones(len));

positions = zeros(len);
positions(:,:,1) = x;
positions(:,:,2) = y;

positions = reshape(positions,1,[],2);
positions = [positions(:,:,1);positions(:,:,2)];

dipole = [1;0].*ones(1,size(positions,2));

B = Magnetic_Field(positions,dipole);

B_phi = cart2pol(B(1,:),B(2,:));

SCALE = 1;
B_hat = SCALE*B./vecnorm(B);
tail_pos = positions - (SCALE/2)*[cos(B_phi);sin(B_phi)];

% figure
qplt = quiver(tail_pos(1,:),tail_pos(2,:),B_hat(1,:),B_hat(2,:));
% qplt = quiver(tail_pos(1,:),tail_pos(2,:),B(1,:),B(2,:));
qplt.AutoScale = 'off'
% qplt.AutoScaleFactor = 0.8;
qplt.LineWidth = 0.7;
ax = gca;
ax.DataAspectRatio = [1 1 1];
ax.XLim = [-(lim+1) lim+1];
ax.YLim = ax.XLim;
grid on

%% CIRCLE Position Input

points = 100;
rho = [1];
theta = linspace(0,2*pi,points);
shift = [0;0];
positions = [cos(theta); sin(theta)].*reshape(rho,1,1,length(rho));
positions = reshape(positions,2,[],1)+shift;

dipole = [1;0].*ones(1,size(positions,2));

B = Magnetic_Field(positions,dipole);

B_phi = cart2pol(B(1,:),B(2,:));

SCALE = 0.2;
B_hat = SCALE*B./vecnorm(B);
tail_pos = positions - (SCALE/2)*[cos(B_phi);sin(B_phi)];

figure
qplt = quiver(tail_pos(1,:),tail_pos(2,:),B_hat(1,:),B_hat(2,:));
qplt.AutoScale = 'off';
qplt.LineWidth = 1;
ax = gca;
ax.DataAspectRatio = [1 1 1];
ax.XLim = [-(rho(end)+.5) rho(end)+.5]+shift(1);
ax.YLim = ax.XLim+shift(2);
grid on

% Plot B_phi vs theta

figure
plt = plot(theta,B_phi,'LineWidth',2);
grid on
ax = gca;
ax.XLim = [0,2*pi];
ax.YLim = [-pi,pi];
ax.XLabel.String = '\theta';
ax.YLabel.String = '\phi';
ax.XTick = 0:pi/2:2*pi;
ax.YTick = -pi:pi/2:pi;
ax.TickLabelInterpreter = 'latex';
ax.XTickLabel = {'$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$','$2\pi$'};
ax.YTickLabel = {'$-\pi$','$-\frac{1}{2}\pi$','$0$','$\frac{1}{2}\pi$','$\pi$'};




