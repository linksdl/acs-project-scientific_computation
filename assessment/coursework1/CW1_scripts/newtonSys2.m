function [ x,f ] = newtonSys2( fnon, fjac, x0, tol, maxIt,locx,locy)

% Basic Newton algorithm for systems of nonlinear equations
% function [ x,f ] = newtonSys( fnon, fjac, x0, tol, maxit )
% Input: fnon - function handle for nonlinear system
%        fjac - function handle for Jacobian matrix 
%        x0 - initial state (column vector)
%        tol - convergence tolerance
%        maxIt - maximum allowed number of iterations
% Output: x - final point
%         f - final function value

fprintf(' x      |f(x)|\n')

n = length(x0);

x = x0;                % initial point
f = feval(fnon,x,locx, locy);     % initial function values
normf = norm(f);
it = 0;
fprintf(' %d %12.6f\n',it,norm(f));

while (normf>tol) && (it<maxIt) 
  
  J = feval(fjac, x);  % build Jacobian
  delta = -J\f;        % solve linear system
  
  xkp = x;
  xk  = x + delta;
 
  x = x + delta;       % update x
  f = feval(fnon,x, locx, locy);   % new function values
  normf = norm(f);
 
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
