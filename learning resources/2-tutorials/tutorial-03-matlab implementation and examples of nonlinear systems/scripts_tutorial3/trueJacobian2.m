
function J =  trueJacobian2( n, x, f, fnon )

% Analytical Jacobian
%  function J =  trueJacobian( n, x, f, fnon )
% Input: n - number of equations
%        x - current solution
%        f - current function value
%        fnon - nonlinear function handle
% Output: J - Jacobian matrix 

J = [ -4*x(1,:) + 3*x(2,:),              3*x(1,:) + 4*cos(x(2,:)); ...
      6*x(1,:) - 2*x(2,:).^2 - 3*sin(x(1,:)), -4*x(1,:).*x(2,:) ];

end
