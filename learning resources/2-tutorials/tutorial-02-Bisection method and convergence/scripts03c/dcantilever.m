function d = dcantilever(x)

% function d = dcantilever(x)
%
% Evaluate the derivative function for the cantilever beam example.
%
% ARGUMENTS:  x   the point at which to evaluate
%
% RETURNS:    d   the value of the derivative at x


% Evaluate the function.
  d = 4*x.^3 - 12*x.^2 + 12*x;
