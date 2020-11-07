function [ x,f ] = continuation( fnon, fjac, x0, nStep )

% Continuation algorithm for systems of nonlinear equations
% Forward Euler time-stepping
%  function [ x,f ] = continuation( fnon, fjac, x0, nStep )
% Input: fnon - function handle for nonlinear system
%        fjac - function handle for Jacobian matrix
%        x0 - initial state (column vector)
%        nStep - number of time steps
% Output: x - final point
%         f - final function value at t=1

fprintf('   t       |f(x)|\n')

n = length(x0);

t = 0;
dt = 1/nStep;

x = x0;              % initial point
f0 = feval(fnon,x);  % initial function values
f = f0;

fprintf(' %4.2f %12.6f\n',t,norm(f) )

for k=1:nStep
    
    J = feval( fjac, n, x, f, fnon );        % build Jacobian
    delta = -J\f0;                           % solve linear system
    xkp=x;
    x = x + dt*delta;       % update x
    f = feval(fnon,x);          % new function values
    xk=x;
    t = t + dt;
    % Print the new estimate and function value.
    fprintf(' %4.2f %12.6f\n',t,norm(f) )
    %plot([xkp(1) xk(1)], [xkp(2) xk(2)], 'ok-', 'LineWidth', 2)
    %pause
end

end

