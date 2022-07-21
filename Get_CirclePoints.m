function Cpts = Get_CirclePoints(positions,radius,points)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

X = permute(positions,[1 4 3 2]); % swap dim and 4, as dim 2 will contain Cpts
X = X.*ones(1,points); % lengthen columnways from length==1 to length==points

th = linspace(0,2*pi,points);
C = radius*[cos(th);sin(th);zeros(1,points)];
C = C.*ones(1,1,size(X,3),size(X,4));

Cpts = X+C;

end

