% Horizontal Line of Dipoles

%% All Rotating
N = 10;
points = 50000;

%% FOR LOOP
theta = linspace(0,2*pi,points);

positions = [ones(1,N); zeros(2,N)];
positions = positions.*(1:N);
dipoles = @(t) [ones(1,N).*[cos(t);sin(t)];zeros(1,N)];

Ufor = zeros(1,points);
for i=1:points
    Ufor(i) = SYSTEM_Magnetic_PE(positions,dipoles(theta(i)));
end

%% VECTORISED
theta = reshape(linspace(0,2*pi,points), 1, 1, points);

positions = [ones(1,N,points); zeros(2,N,points)];
positions = positions.*(1:N);
dipoles = @(t) [ones(1,N).*[cos(t);sin(t)];zeros(1,N,length(t))];

Uvec = SYSTEM_Magnetic_PE(positions,dipoles(theta));

%PLOT
plot(reshape(theta,1,points),reshape(Uvec,1,points))
xlabel("\theta")
ylabel("U [J]")

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.YLabel.Interpreter='latex';
grid on

xticks(0:pi/2:2*pi)
xticklabels({'$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$','$2\pi$'})
ax.XLim=[0,2*pi];

%% Every Other Rotating

N = 10;
points = 1000
theta = reshape(linspace(-pi/2,3*pi/2,points), 1, 1, points);

positions = [ones(1,N,points); zeros(2,N,points)];
positions = positions.*(1:N);

dipoles = @(t) [ones(1,N).*[cos(t);sin(t)];zeros(1,N,length(t))];
M = dipoles(theta);
M(1,1:2:end,:) = 0;
M(2,1:2:end,:) = 1;

U = SYSTEM_Magnetic_PE(positions,M);

plot(reshape(theta,1,points),reshape(U,1,points));
xlabel("\theta")
ylabel("U [J]")

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.YLabel.Interpreter='latex';
grid on

xticks(-pi/2:pi/2:3*pi/2)
xticklabels({'$-\frac{1}{2}\pi$','$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$'})

ax.XLim=[-pi/2,3*pi/2];