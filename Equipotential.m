% EQUIPOTENTIAL LINES
N = 10;
points = 1000;

rho = @(th,V) cos(th).^2 ./ (V.^2);

th = linspace(0,2*pi,points);
V = reshape(linspace(0.2,0.6,N),1,1,N);

[x,y] = pol2cart(th,rho(th,V));

plot(reshape(x,points,N),reshape(y,points,N))