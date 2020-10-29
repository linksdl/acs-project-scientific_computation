
function [x,f] = newtonSys( fnon, dfdx, x0, tol, maxk )

% function [x,f] = myNewton( fnon, dfdx, x0, tol, maxk )
% Classic Newton Method for F(x)=0
% Input: fnon - nonlinear function F(x) 
%        dfdx - derivative function dFdx(x)
%        x0 - initial guess for x
%        tol - convergence measure for |F(x)|
%        maxk - max number of iterations allowed
% Output: x - final point computed by Newton algorithm
%         f - F(x) evaluated at the final point

fprintf('   k   |F(x_k)|\n');

k = 0;
n = length(x0);
f0 = feval(fnon,x0);
fprintf(' %3d   %8.3g\n',k,norm(f0));

while( norm(f0)>tol && k<maxk )
    
    J = feval(dfdx,x0);    
    
    k = k + 1;
    x = x0 - J\f0;
    f = feval(fnon,x);
    fprintf(' %3d   %8.3g\n',k,norm(f));
    
    x0 = x;
    f0 = f;
end

if( k == maxk )
    fprintf('Not converged\n');
else
    fprintf('Converged\n')
end

end
