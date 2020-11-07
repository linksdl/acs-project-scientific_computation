
function J =  fdTridiagJacobian( n, x0, f0, fnon )

% Finite difference approximation of a tridiagonal Jacobian
%  function J =  fdJacobian( n, x0, f0, fnon )
% Input: n - number of equations
%        x0 - current solution
%        f0 - current function value
%        fnon - nonlinear function handle
% Output: J - Jacobian matrix

J = zeros(n);

h = 10*sqrt(eps); % perturbation

% Divide the equations into groups of 3
g{1} = 1:3:n; g{2} = 2:3:n; g{3} = 3:3:n;

for i = 1:3   % compute all columns in a group at the same time
    
    f0rep = repmat(f0,1,length(g{i})); 
    X = repmat(x0,1,length(g{i}));
    
    % Perturb all the variables x(g{j}) simultaneously
    for j=1:length(g{i})
        X( g{i}(j), j ) = X( g{i}(j), j ) + h;    
    end
    
    % Evaluate the perturbed values of all the F
    f = feval( fnon, X );         
    
    % Update the columns J(:,g{j})
    J(1:n,g{i}) = ( f - f0rep ) / h; 

end
