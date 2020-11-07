function [ x,f ] = newtonSysL( fnon, fjac, x0, tol, maxIt )

% Newton algorithm with line-search for systems of nonlinear equations
%  function [ x,f ] = newtonSysL( fnon, fjac, x0, tol, maxit )
% Input: fnon - function handle for nonlinear system
%        fjac - function handle for Jacobian matrix 
%        x0 - initial state (column vector)
%        tol - convergence tolerance
%        maxIt - maximum allowed number of iterations
% Output: x - final point
%         f - final function value
%
% Example: [x,f]=newtonSysL( @example2, @fdJacobian, [1; 1], 1e-8, 40 )
% compare: [x,f] = newtonSys( @example2, @fdJacobian, [1; 1], 1e-8, 40 )
% compare: [x,f,flag]=fsolve( @example2, [ 1; 1 ], optimset('Display','Iter') )

fprintf(' it     |f(x)|\n')

n = length(x0);

x = x0;             % initial point
f = feval(fnon,x);  % initial function values
normf = norm(f);
it = 0;
fprintf(' %d %12.6f\n',it,normf);

while (normf>tol) && (it<maxIt) 
  
  J = feval( fjac, n, x, f, fnon ); % build Jacobian
  delta = -J\f;                     % solve linear system
  
  xkp = x;  

  [ x,f,normf ] = lineSearch( fnon, x, normf, delta ); % update x

  xk  = x;
  
  it = it + 1;
  % Print the new estimate and function value.
  fprintf(' %d %12.6f\n',it,normf)
 
  %plot([xkp(1) xk(1)], [xkp(2) xk(2)], 'ok-', 'LineWidth', 2)
  %pause
end

if( it==maxIt)
    fprintf(' WARNING: Not converged\n')
else
    fprintf(' SUCCESS: Converged\n')
end

end
