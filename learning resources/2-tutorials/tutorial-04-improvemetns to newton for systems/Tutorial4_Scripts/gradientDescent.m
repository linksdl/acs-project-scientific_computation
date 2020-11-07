function [ x,f ] = gradientDescent( fnon, fjac, x0, tol, maxIt )

fprintf(' x      |f(x)|\n')

n = length(x0);

x = x0;             % initial point
f = feval(fnon,x);  % initial function values
normf = norm(f);
it = 0;
fprintf(' %d %12.6f\n',it,norm(f));

while (normf>tol) && (it<maxIt)
    
    J = feval( fjac, n, x, f, fnon ); % build Jacobian
    delta = -2*J'*f;                           % solve linear system
    
    xkp = x;
    x = lineSearch( fnon, x, normf, delta ); % update x
    xk  = x;
    
    f = feval(fnon,x);   % new function values
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
