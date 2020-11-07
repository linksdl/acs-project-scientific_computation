%%
% initial profile 
                
function [ t, u, x ] = initialData( m )

% Initial solution profile
%  function [t,u,x] = initialProfile( m )
% Input: grid size m
% Output: initial time t
%         initial conditions u(m-2)
%         grid x(m)

global h uL uR

xL = 0;   % spatial
xR = 1;   % domain 

x = linspace(xL,xR,m)'; % grid points
h = (xR-xL)/(m-1);      % mesh size

t = 0;  % initial time

%v = 0.4+0.2*exp(-40*(x-0.5).^2); % initial data
v = 0.6+0.2*tanh(20*(x-0.5));

uL = v(1);   % boundary
uR = v(m);   % conditions

u = v(2:m-1); % initial conditions

end
