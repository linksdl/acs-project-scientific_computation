function y = cantilever(x,def)

% def = 0.6 
% fzero(@(x)cantilever(x, def), 0.6)
%
% function y = cantilever(x,def)
%
% Evaluate the nonlinear function for the cantilever beam example.
%
% ARGUMENTS:  x   the point at which to evaluate
%             def desired deflection (fraction of defmax)
%
% RETURNS:    y   the value of the function at x


% Evaluate the function.
  y = x.^4 - 4*x.^3 + 6*x.^2 - 3*def;
