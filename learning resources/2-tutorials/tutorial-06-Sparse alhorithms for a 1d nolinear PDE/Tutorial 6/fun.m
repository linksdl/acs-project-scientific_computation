function f = fun(u, i, m, h, alpha, beta)


% function f = fun(u, i, m, h, alpha, beta) the discrete equation system

% Input:  
%       u, an m*1 vector containing the discrete values,
%       i, the index to the element of Fi,from 2 to m-1,
%       m, the number of nodal
%       h, the nodal spacing
%   alpha, beta: the boundary condition values.
%
% Output:
%      f, nonlinear functions evaluated at u 
%      
 

% spatial domain
xL = 0;
xR = 1;

% grid points
x = linespace(xL, xR, m);

% mesh size
h = (xR-xL) / (m-1);


% boundary conditions
uL = alpha;
uR = beta;

% the number of nonlinear equations(excluding the boundary condition) 
n = m-2;

f = zeros(m, size(u, 2));
 
% difference equations at each internal node
 
f(1,:) = ( u(2,:).^2 - 2.*u(2,:).*uL + uL.^2 ) / (4.*h.^2) 
	   + ( u(2,:).*u(1,:) - 2.*u(1,:).^2 + u(1,:).*uL ) / (h.^2)
	   + u(1,:);


for i = 2: n-1
 	f(i,:) = ( u(i+1,:).^2 - 2.*u(i+1,:).*u(i-1,:) + u(i-1,:).^2  )./(4.*h^2) 
 		   + ( u(i+1,:).*u(i,:) - 2.*u(i,:).^2 + u(i,:).*u(i-1,:) )./(h^2) 
 		   + u(i,:);
 
end
 
f(n,:) = ( uR.^2 - 2.*uR.*u(n-1,:) + u(n-1,:).^2 ) / (4.*h.^2) 
 	    + ( uR.*u(n,:) - 2.*u(n,:).^2 + u(n,:).*u(n-1,:) ) / (h.^2) 
 	    + u(n,:);
 

end