

function y = exampleFun2( x, def )
% function [ y ] = exampleFun2( x )
%   system of 2 nonlinear equations
%
% roots near (0.58,2.55) and (2.59,2.04)
%
% Start from (0,0) difficult to converge
% from (0.5,0.5) no convergence
% from (2,2) both converge but line-search better
% from (1,1) Newton diverge, NewtonL converge

y = [ -2*x(1,:).^2 + 3*x(1,:).*x(2,:)   + 4*sin(x(2,:)) - 6;
      3*x(1,:).^2 - 2*x(1,:).*x(2,:).^2 + 3*cos(x(1,:)) + 4 
      ];

end
