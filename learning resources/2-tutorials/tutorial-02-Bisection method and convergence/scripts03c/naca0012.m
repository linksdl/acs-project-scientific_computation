function f = naca0012(x,th)

% function f = naca0012(x)
%
% Evaluate the nonlinear function for the naca0012 aerofoil example.
%
% ARGUMENTS:  x   the point at which to evaluate
%             th  target thickness
%
% RETURNS:    f   the value of the function at x

%
% th = 0.1, x0 = 1,   fzero(@(x)naca0012(x, th), 1)
% th = 0.1, x0 = 0.1, fzero(@(x)naca0012(x, th), 0.1)


% Evaluate the function.
  y = -0.1015*x.^4 + 0.2843*x.^3 - 0.3516*x.^2 - 0.126*x + 0.2969*sqrt(x);
  f = 2*y - th;
