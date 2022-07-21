% TEST GRADDESC
global RADIUS

%% 2 DIPOLE 1 init
X0 = [0 1; 0 0;0 0]*10^-2;
M0 = [1 0; 0 1;0 0];

%% 2 DIPOLE 2 init
X0 = [0 1; 0 0;0 0]*10^-2;
[m,n]=pol2cart([0.01 pi-0.01],1);
M0 = [m;n;0 0];

%% 2 DIPOLE 3 init
X0 = [0 1; 0 0;0 0]*10^-2;
M0 = [1 1; 0 0;0 0];

%% 2 DIPOLE rand init
X0 = [0 1; 0 0;0 0]*10^-2;
[m,n]=pol2cart(2*pi*rand(1,2),1);
M0 = [m;n;0 0];

%% 3 DIPOLE 1 init
X0 = [-1 0 1;0 0 0;0 0 0]*10^-2;
M0 = [-1 -1 0;0 0 -1;0 0 0];

%% TRIANGLE 1
X0  = [ 0 1 1/2 ; 0 0 sqrt(3)/2 ; 0 0 0 ]*0.2*10^-2;
TH0 = [0,2*pi/3,4*pi/3];
M0  = [cos(TH0);sin(TH0);0 0 0];

%% TRIANGLE 2
X0  = [ 0 1 1/2 ; 0 0 sqrt(3)/2 ; 0 0 0 ]*0.2*10^-2;
TH0 = [pi/6,5*pi/6,-pi/2];
M0  = [cos(TH0);sin(TH0);0 0 0];

%% N DIPOLES rand pos and dipoles
N = 10;
X0 = rand(3,N)*10^-2;
TH0 = rand(1,N)*2*pi;
M0 = [cos(TH0);sin(TH0);zeros(1,N)];

%% N ROW rand dipoles
N = 10;
X0 = [0:N-1;zeros(2,N)]*0.2*10^-2;
TH0 = rand(1,N)*2*pi;
M0 = [cos(TH0);sin(TH0);zeros(1,N)];

%% TWO ROWS 1 - forms circle
X0 = [[0 1 2 3 4 0 1 2 3 4]*2*RADIUS;[0 0 0 0 0],[1 1 1 1 1]*2*RADIUS;[0 0 0 0 0 0 0 0 0 0]]
M0 = [1 1 1 1 1 -1 -1 -1 -1 -1;0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0]

%% TWO ROWS 2 -
X0 = [[0 1 2 3 4 0.5 1.5 2.5 3.5 4.5]*2*RADIUS;[0 0 0 0 0],[1 1 1 1 1]*2*RADIUS;[0 0 0 0 0 0 0 0 0 0]]
M0 = [[1 1 1 1 1] [-1 -1 -1 -1 -1]*-1;0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0]

%% RUN
[tau,x,y,z,th] = GradDesc(X0,M0,10);
plot(tau,permute(x,[3 2 1]));
plot(tau,permute(y,[3 2 1]));
plot(tau,permute(th(1,:,:),[3 2 1]));
plot(tau,permute(th(2,:,:),[3 2 1]));
Xs = [x;y;z];

[u,v,w] = sph2cart(th(1,:,:),th(2,:,:),1);
Ms = [u;v;w];
close
MagAnimate(Xs,Ms);

