% FORCE PLOTS

%%
X = [0 1;0 0;0 0]; 
M = [1 1;0 0;0 0];

X = X.*permute(linspace(8*10^-4,20*10^-4,1000),[1 3 2]);
M = M.*ones(1,1,1000);

F = Force(X,M);
plot(permute(X(1,2,:),[1 3 2]),permute(F(1,1,:),[1 3 2]))
grid on