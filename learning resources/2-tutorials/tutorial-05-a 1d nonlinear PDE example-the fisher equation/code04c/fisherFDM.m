function f = fisherFDM( u )

% Nonlinear residual function
%  function f = fisherFDM( u )
% Input: u - current solution values
% Output: f - nonlinear functions evaluated at u

global uOld dt n h uL uR

f = zeros( n, size(u,2) );

% difference equations at each internal node

f(1,:) = ( u(1,:) - uOld(1) )/dt ...
       - u(1,:).*( u(2,:) - 2*u(1,:) + uL ) / h^2 ...
       - u(1,:).*( 1 - u(1,:) );
       
for i = 2:n-1
    f(i,:) = ( u(i,:) - uOld(i,:) )/dt ...
           - u(i,:) .* ( u(i+1,:) - 2*u(i,:) + u(i-1,:) ) / h^2 ...
           - u(i,:) .* ( 1 - u(i,:) );
end

f(n,:) = ( u(n,:) - uOld(n,:) )/dt ...
       - u(n,:) .* ( uR - 2*u(n,:) + u(n-1,:) ) / h^2 ...
       - u(n,:) .* ( 1 - u(n,:) );
   
end
