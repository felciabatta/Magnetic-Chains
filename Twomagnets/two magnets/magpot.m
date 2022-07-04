function u=magpot(xi, xj, mhati, mhatj)
    
    %all inputs are 3x1 vectors. gives u a scalar
    %now returns (-1/2)uij+uji, so order of inputs is not important
    
    %This is very lazy code, intend to vectorise it properly if needed
    %assuming magnitude of moments are all constant for identical magnets
    
    %constants
    muo=1; 
    m=1; 
    
    %xij into magnitude and direction form
    xij=xi-xj; 
    dist=sqrt(sum(xij.^2));
    xhatij=xij/dist;
    
    u=dot(mhati,(((3*dot(mhatj,xhatij))*xhatij)-mhatj));
        
    xij=-xij;
    xhatij=-xhatij;
    u=u+(dot(mhatj,(((3*dot(mhati,xhatij))*xhatij)-mhati)));
    
    u=u*((muo*(m^2))/(4*pi*(dist^3))); 
    u=(-1/2)*u; %putting the minus inside the sum for now
    
end