%two magnet system
%This script is intended for playing around and getting graphs, nothing more
%constants are set in the magpot function, currently all 1 for ease
%bit franken-codey cos I was changing it a lot to get graphs

%keep the same/default values
pos1=[0;0;0];
pos2=[1;0;0]; %implies r=1/2
%mom1=[1;0;0];
%mom2=[-1;0;0];

res=150; %resolution

%things that change
theta = linspace(0,2*pi,res);
phi=linspace(0,2*pi,res);

%{
%change position 2
pos2=zeros(3,res);
pos2(1,:)=cos(theta);
pos2(2,:)=sin(theta);
%}

%change moment 2
mom2=zeros(3,res);
mom2(1,:)=cos(phi);
mom2(2,:)=sin(phi);

%change moment 1
mom1=zeros(3,res);
mom1(1,:)=cos(theta);
mom1(2,:)=sin(theta);

%surface plot of 2dof energy landscape
%forgive me for using for loops, I am tired and just want a pretty plot
u=zeros(res,res);
for i=1:length(theta)
    for j=1:length(phi)
        %u(i,j)=magpot(pos1,pos2(:,j),mom1,mom2(:,i)); %changing pos2 and mom2
        u(i,j)=magpot(pos1,pos2,mom1(:,j),mom2(:,i)); %changing both moments
        %moments
    end
end



%surface plot
surf(theta,phi,u)
xlabel('\theta')
ylabel('\phi')
zlabel('U')


%{
%line plot, 1dof
%u=zeros(1,res); %1dof results here
for i=1:length(theta)
    u(i)=u(i)+magpot(pos1,pos2(:,i),mom1,mom2);
    %(magpot now includes the reverse and halves it)
    %u(i)=u(i)+magpot(pos2,pos1,mom2(:,i),mom1);
end  

plot(theta,u)
title('Magnetic potential energy of a 2-dipole system, as one travels around the unit circle')
subtitle('x_1=(0,0,0), m_1=(1,0,0), x_2=(cos(\theta),sin(\theta),0), m_2=(-1,0,0)')
xlabel('\theta')
ylabel('Magnetic Potential Energy')
%}
