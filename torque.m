function t=torque(tau,dipoles,positions)
    %calculates the total torque on magnet i from all other magnets
    %inputs are in that order so it plays nice with ode45
    
    %takes positions as 3xn vectors as fixed
    %takes dipoles as column vector of angles in radians
    %gives a column vector where ith element is the k component of the
    %torque acting on ith magnet by all other magnets
    
    %currently very half-arsed cos I need this working to test the ode thing
    %I swear I will return and improve this
    
    n=size(positions,2);
    Tij=zeros(3,n);
    Xij = @(Xi, Xj)         Xi-Xj;
    t=zeros(3,n);
    m=hat(dipoles);
    
    for i=1:n
    
        for a=1:n
            Tij(:,a)=cross(m(:,i),Magnetic_Field(Xij(positions(:,i),positions(:,a)),m(:,a)));
            if a==i
                Tij(:,a)=0;
            end
        end
        t(:,i)=sum(Tij,2);
    
    end
    t(1:2,:)=[]; %yes, this is a bodge
    t=t';
end