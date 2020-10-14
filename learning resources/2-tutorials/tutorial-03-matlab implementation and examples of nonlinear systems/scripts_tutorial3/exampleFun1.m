function [ y ] = exampleFun1( x )
% function [ y ] = exampleFun( x )
%   system of 2 nonlinear equations
%
% will converge from all starting point near (0,0)

y = zeros(2,size(x,2));
y(1,:) = 2*x(1,:) - x(2,:) - exp(-x(1,:));
y(2,:) = -x(1,:) + 2*x(2,:) - exp(-x(2,:));

end

