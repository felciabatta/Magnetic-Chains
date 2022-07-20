function [tau,x,y,z,th] = GradDesc(init_positions,init_dipoles)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

X0 = init_positions; M0 = init_dipoles;

V0 = ColumnIn(X0,M0);
MF = MinFunc([],V0);

tauspan = [0 3000]; % MAKE ARGUMENT?
[tau,V] = ode23s(@MinFunc,tauspan,V0); %

V = permute(V,[2 3 1]);
V = reshape(V,5,[],size(V,3));

x  = V(1,:,:);
y  = V(2,:,:);
z  = V(3,:,:);
th = V(4:5,:,:);

end