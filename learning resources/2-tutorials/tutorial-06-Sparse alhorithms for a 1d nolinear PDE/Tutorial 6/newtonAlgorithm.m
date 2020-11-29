function [ x,f ] = newtonAlgorithm( systemFunction, x0, tol, ...
                                    makeJacobian, linearSolve, maxIts )

% Basic Newton algorithm for systems of nonlinear equations
%  function [ x,f ] = newtonAlgorithm( systemFunction, x0, tol, ...
%                                      makeJacobian, linearSolve, maxIts )
% Input: systemFunction - nonlinear function name
%        x0 - initial state
%        tol - convergence tolerance
%        makeJacobian - function to construct Jacobian matrix
%        linearSolve - function to solve a linear system
%        maxIts - maximum Newton iterations
% Output: x - final point
%         f - final function value

n = length(x0);     % number of equations

x = x0;             % initial point
f = feval( systemFunction, x );  % initial function values

iter=0;

while( norm(f)>tol && iter<maxIts )                    % test for convergence

  iter = iter + 1;
 
  J = feval( makeJacobian, n, x, f, systemFunction );  % build Jacobian
     
  delta = feval( linearSolve, J, -f );                 % solve linear system
  
  x = x + delta;                                       % update x
  
  f = feval( systemFunction, x );                      % new function values
 
end

if( iter < maxIts )
  %fprintf(' SUCCESS: Converged\n');
else
  fprintf(' WARNING: Not converged\n');
end

end

