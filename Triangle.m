% TRIANGLE EXAMPLE

%   o   ->   3 
%  o o  ->  1 2

%% 2D - 1DoF

positions   = [ 0 1 1/2 ; 0 0 sqrt(3)/2 ; 0 0 0 ];
alpha       = 0;
beta        = 0;
dipoles     = @(a,b,t) [ cos(a) cos(b) cos(t) ; sin(a) sin(b) sin(t) ; 0 0 0 ];
theta       = linspace(0,2*pi,100);

U=[]
for i = 1:length(theta) 
    M = dipoles(alpha, beta, theta(i));
    U(i) = SYSTEM_Magnetic_PE(positions,M);
end

plot(theta,U)
xlabel("\theta")
ylabel("U [J]")

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.YLabel.Interpreter='latex';
grid on

xticks(0:pi/2:2*pi)
xticklabels({'$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$','$2\pi$'})
ax.XLim=[0,2*pi];

%% 3D - 2DoF

positions   = [ 0 1 1/2 ; 0 0 sqrt(3)/2 ; 0 0 0 ];
alpha       =  pi/6;
beta        = 5*pi/6;
theta       = linspace(0,2*pi,100);
phi         = linspace(0,2*pi,100);

dipoles     = @(a,b,t,p) [ cos(a) cos(b) cos(t)*cos(p) ;...
                           sin(a) sin(b) sin(t)*cos(p) ;...
                                0      0        sin(p) ];
U=[];
for i = 1:length(theta)
    for j = 1:length(phi)
        M = dipoles(alpha, beta, theta(i),phi(j));
        U(j,i) = SYSTEM_Magnetic_PE(positions,M);
    end
end

plt3D = surf(theta,phi,U);
ax = gca;
ax.TickLabelInterpreter = 'Latex';
ax.FontSize = 16;
ax.XTick = 0:pi/2:2*pi;
ax.XTickLabel = {'$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$','$2\pi$'};
ax.YTick = 0:pi/2:2*pi;
ax.YTickLabel = {'$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$','$2\pi$'};
ax.XLabel.String = "\theta";
ax.YLabel.String = "\phi";
ax.XLim = [0 2*pi];
ax.YLim = [0 2*pi];
ax.ZLim = [-0.2 0.5];

figure
M = dipoles(alpha, beta, pi/2, phi(1));
qplt = quiver(positions(1,:),positions(2,:),M(1,:),M(2,:));
qplt.AutoScaleFactor = 0.2;
qplt.LineWidth = 4;

% plot(theta,U)
% xlabel("\theta")
% ylabel("U [J]")
% 
% ax = gca;
% ax.TickLabelInterpreter = 'latex';
% ax.YLabel.Interpreter='latex';
% grid on
% 
% xticks(0:pi/2:2*pi)
% xticklabels({'$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$','$2\pi$'})
% ax.XLim=[0,2*pi];
