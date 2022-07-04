%This is an old version gradient descent script 
%currently runs off my magpot function for U which is very inefficient
%working on a new version which uses System_Magnetis_PE instead
%could benefit from some more tuning and testing
%doesn't like being started at inflection points cos cendiff
%In theory, should be able to swap the cendiff grads for the torques and get the same results 
format long

%parameters of the magnets
start=[(0.45)*pi;(0.45)*pi]; %moments, in radians
dof=size(start,1); %generalisey
x=zeros(3,dof);%fix magnet positions: column vectors
x(1,2)=1; %(0,0,0) and (1,0,0) this time

%parameters of the numerical methods
maxsteps=500; tol=1e-4; %conditions to terminate the iteration
stepsize=0.5;%seems to work
h=pi/200; %h for cendiff

%setups
r=zeros(dof+1,maxsteps); %store the iterations
grad=ones(dof,maxsteps); %store the gradients, useful for debugging
r(1:dof,1)=start;
r(dof+1,1)=magpot(x(:,1),x(:,2),hat(start(1)),hat(start(2)));
%last row of r is the resulting U

%filler values, haven't caused problems yet
grad(:,1)=ones(dof,1); 
err=[10;10];

%The numerical method
it=1;
while (it<maxsteps)&(err>tol)
    it=it+1;
    
    %gradients via cendiff
    grad(1,it)=(magpot(x(:,1),x(:,2),hat(r(1,it-1)+h),hat(r(2,it-1)))-magpot(x(:,1),x(:,2),hat(r(1,it-1)-h),hat(r(2,it-1))))/(2*h);
    grad(2,it)=(magpot(x(:,1),x(:,2),hat(r(1,it-1)),hat(r(2,it-1)+h))-magpot(x(:,1),x(:,2),hat(r(1,it-1)),hat(r(2,it-1)-h)))/(2*h);
    
    %descent step
    grad(:,it)=grad(:,it)*stepsize; 
    r(1:dof,it)=r(1:dof,it-1)-grad(:,it);
    
    %put the U here
    r(dof+1,it)=magpot(x(:,1),x(:,2),hat(r(1,it)),hat(r(2,it)));
    
    err=abs(r(1:dof,it)-r(1:dof,it-1));
    
end

%plotting
r(:,all(~any(r),1))=[]; %remove excess zeroes
plot3(r(1,:),r(2,:),r(3,:))
xlabel('phi1')
ylabel('phi2')
zlabel('U')
axis([0 2*pi 0 2*pi])
