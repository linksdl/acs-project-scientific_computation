function [ u,x,t ] = forwardEulerFisher( dt,nt,n )
%function [ u,x,t ] = forwardEulerFisher( dt,nt,n )
%Explicit Forward Euler finite difference model
%of the Fisher equation

% Example: forwardEulerFisher(5e-5,2e3, 101 )

x = linspace(0,1,n)';
h = 1/(n-1);

% possible initial data
%u = ones(n,1)*0.2;
%u0 = 0.5+0.3*sin(2*pi*x);
%u = 0.5*x+0.2;
%u = 0.2+0.2*exp(-40*(x-0.5).^2);
u0 = 0.6+0.2*tanh(20*(x-0.5));

r = zeros(n,1);
t=0;

% initial solution
u = u0; 

% time steps
for k = 1:nt
    t = t + dt;
    % for each internal grid point
    for i = 2:n-1
        r(i) = u(i)*(u(i+1)-2*u(i)+u(i-1))/h^2 + u(i)*(1-u(i));
    end
    u = u + dt*r;
end

fprintf('Final time %f\n',t);

% final solution
plot(x,u0,'g',x,u,'-b')
legend('Initial','Final')
axis([0 1 0 1]);

end
