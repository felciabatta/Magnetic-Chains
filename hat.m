function v=hat(theta)
    %takes theta, returns a unit vector in the xy plane
    v=zeros(3,length(theta));
    v(1,:)=cos(theta);
    v(2,:)=sin(theta);
    
end