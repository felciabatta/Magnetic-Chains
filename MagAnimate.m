function animation = MagAnimate(positions,dipoles)
%MAGANIMATE Will produce an animation of a set of magnetic dipoles whose
%           positions and dipole moments vary over time
%   Detailed explanation goes here

% NOTE - Currently only for 2D plots (automatic, input is 3D)
X = positions; M = dipoles; 

M_phi = cart2pol(M(1,:,:),M(2,:,:));

SCALE = 0.005;
M_hat = SCALE*M./vecnorm(M);
tail_pos = X - (SCALE/2)*[cos(M_phi);sin(M_phi);zeros(1,size(M_phi,2),size(M_phi,3))];

ax = axes;
ax.DataAspectRatio = [1 1 1];
ax.XLim = [min(X(1,:,:),[],'all')-SCALE/2,max(X(1,:,:),[],'all')+SCALE/2];
ax.YLim = [min(X(2,:,:),[],'all')-SCALE/2,max(X(3,:,:),[],'all')+SCALE/2];

for f = 1:size(X,3)
    quiver(ax,tail_pos(1,:,f),tail_pos(2,:,f),M_hat(1,:,f),M_hat(2,:,f),0,'LineWidth',4);
%     quiver(ax,X(1,:,f),X(2,:,f),M(1,:,f),M(2,:,f));
    ax.DataAspectRatio = [1 1 1];
    ax.XLim = [min(X(1,:,:),[],'all')-SCALE/2,max(X(1,:,:),[],'all')+SCALE/2];
    ax.YLim = [min(X(2,:,:),[],'all')-SCALE/2,max(X(3,:,:),[],'all')+SCALE/2];
    input("continue?");
%     frames(f) = getframe
end
