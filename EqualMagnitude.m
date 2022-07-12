% EQUAL MAGNITUDE LINES

mu0 = 1;
K = mu0/(4*pi);
B = 0.1;

%% Implicit Plot
% f = @(s,t,beta) beta.*(s+t).^4 - (4*s+t);
% 
% lim = 1^2;
% 
% beta = (B/K)^2;
% 
% s = linspace(0,lim,100);
% t = linspace(0,lim,100)';
% 
% F = f(s,t,beta);
% 
% surf(s,t,F)
% 
% ax = gca;
% 
% ax.XLim = [0,lim];
% ax.YLim = ax.XLim;
% ax.ZLim = 1*ax.XLim;

%% Polar Plot
rho = @(theta,B) (K./B).^(1/3) .* (1+3*cos(theta).^2).^(1/6);

th = linspace(0,2*pi,100);

B = (logspace(-5,1,10))';
% B = linspace(10^-5,10,10)';
r = rho(th,B);
[x,y] = pol2cart(th,rho(th,B));

lim = max(max([x;y]))+0.1;
plot(x',y','LineWidth',1.5); grid on;
ax = gca;
ax.XLim = [-lim,lim];
ax.YLim = ax.XLim;

% r vs theta plot
figure
plt = plot (th,r,'LineWidth',2);
grid on
ax = gca;
ax.XLim = [0,2*pi];
ax.XLabel.String = '\theta';
ax.XTick = 0:pi/2:2*pi;
ax.TickLabelInterpreter = 'latex';
ax.XTickLabel = {'$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$','$2\pi$'};

