function [ x,f ] = explicitEuler( systemFunction, x0, dt )

% Explicit Euler's method for time stepping
%  function [ x,f ] = explicitEuler( systemFunction, x0, dt )
% Input: systemFunction - nonlinear function name
%        x0 - initial state
%        dt - time step size
% Output: x - final point
%         f - final function value
  
x = x0;             % initial point
f = feval( systemFunction, x );  % initial function values
x = x - dt * f;                  % update x
f = feval( systemFunction, x );  % new function values
end
