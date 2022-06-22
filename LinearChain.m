% Horizontal Line of Dipoles

%% All Rotating

N = 10;
positions = [1:N;zeros(2,N)];
dipoles = @(t) [ones(1,N).*[cos(t);sin(t)];zeros(1,N)];
theta = linspace(0,2*pi,1000);

U = zeros(1,length(theta));
for i=1:length(theta)
    U(i) = SYSTEM_Magnetic_PE(positions,dipoles(theta(i)));
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

%% Every Other Rotating

N = 10;
positions = [1:N;zeros(2,N)];
dipoles = @(t) [ones(1,N).*[cos(t);sin(t)];zeros(1,N)];
theta = linspace(-pi/2,3*pi/2,1000);

U = zeros(1,length(theta));
for i=1:length(theta)
    M = dipoles(theta(i));  
    M(1,1:2:end) = 0;
    M(2,1:2:end) = 1;
    U(i) = SYSTEM_Magnetic_PE(positions,M);
end

plot(theta,U);
xlabel("\theta")
ylabel("U [J]")

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.YLabel.Interpreter='latex';
grid on

xticks(-pi/2:pi/2:3*pi/2)
xticklabels({'$-\frac{1}{2}\pi$','$0$','$\frac{1}{2}\pi$','$\pi$','$\frac{3}{2}\pi$'})

ax.XLim=[-pi/2,3*pi/2];