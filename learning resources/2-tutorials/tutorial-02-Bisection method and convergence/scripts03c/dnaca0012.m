function d = dnaca0012(x)

% function d = naca0012(x)
%
% Evaluate the nonlinear derivative function for the naca0012 aerofoil example.
%
% ARGUMENTS:  x   the point at which to evaluate
%
% RETURNS:    d   the value of the derivative at x


% Evaluate the function.
  y = -4*0.1015*x.^3 + 3*0.2843*x.^2 - 2*0.3516*x - 0.126 + 0.5*0.2969/sqrt(x);
  d = 2*y;
