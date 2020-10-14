
function J =  trueJacobian( n, x, f, fnon )

% Analytical Jacobian
%  function J =  trueJacobian( n, x, f, fnon )
% Input: n - number of equations
%        x - current solution
%        f - current function value
%        fnon - nonlinear function handle
% Output: J - Jacobian matrix 

J = [ 2+exp(-x(1)), -1; ...
      -1,           2+exp(-x(2)) ];

end
