function v = hat(theta)

% takes theta, returns a unit vector in the xy plane
v      = zeros(3,size(theta,1),size(theta,3));
v(1,:,:) = cos(theta);
v(2,:,:) = sin(theta);
    
end