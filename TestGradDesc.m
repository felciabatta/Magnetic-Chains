% TEST GRADDESC

%% 2 DIPOLE 1 init
X0 = [0 1; 0 0;0 0]*10^-2;
M0 = [1 0; 0 1;0 0];

%% 2 DIPOLE 2 init
X0 = [0 1; 0 0;0 0]*10^-2;
[m,n]=pol2cart([0.01 pi-0.01],1);
M0 = [m;n;0 0];

%% 2 DIPOLE rand init
X0 = [0 1; 0 0;0 0]*10^-2;
[m,n]=pol2cart(2*pi*rand(1,2),1);
M0 = [m;n;0 0];

%% 3 DIPOLE 1 init
X0 = [-1 0 1;0 0 0;0 0 0]*10^-2;
M0 = [-1 -1 0;0 0 -1;0 0 0];

%% RUN
[tau,x,y,z,th]=GradDesc(X0,M0);
plot(tau,permute(x,[3 2 1]));
plot(tau,permute(y,[3 2 1]));
plot(tau,permute(th(1,:,:),[3 2 1]));
plot(tau,permute(th(2,:,:),[3 2 1]));
Xs = [x;y;z];

[u,v,w] = sph2cart(th(1,:,:),th(2,:,:),1);
Ms = [u;v;w];
MagAnimate(Xs,Ms);

