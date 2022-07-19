function T = torque(positions,dipoles)
% calculates the total torque on magnet i from all other magnets
% inputs are in that order so it plays nice with ode45

% takes positions as 3xn vectors as fixed
% takes dipoles as column vector of angles in radians
% gives a column vector where ith element is the k component of the
% torque acting on ith magnet by all other magnets

% currently very half-arsed cos I need this working to test the ode thing
% I swear I will return and improve this

%{

% LOOP CODE (original)
n   = size(positions,2);
Tij = zeros(3,n);
Xij = @(Xi, Xj) Xi-Xj;
T   = zeros(3,n);

X   = positions;
M   = hat(dipoles);

for i = 1:n
    % for given i, find all torques on Mi due to Mjs
    for j = 1:n
        Tij(:,j) = cross( M(:,i), Magnetic_Field( Xij(X(:,i), X(:,j)), M(:,j)) );
    end
    % sum Tijs for particular Mi
    T(:,i) = sum(Tij,2,'omitnan');
end

%}

% VECTORISED CODE (new)
[Xij,M] = Xij_M_ComputationMatrix(positions,dipoles);

Tij = @(Xij, Mi, Mj) cross(Mi, Magnetic_Field(Xij, Mj) );
Ts  = Tij(Xij, permute(M,[1 3 2 4]), M);
T   = permute(sum(Ts,2,'omitnan'),[1 3 2 4]);

% extract k components only (assumes 2D rotation)
% T(1:2,:) = []; % yes, this is a bodge
% T = T';

end